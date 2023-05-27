//
//  HomeViewController.swift
//  iOS workshop
//
//  Created by Hadia Yehia on 26/05/2023.
//

import UIKit

class HomeViewController: UIViewController {
    var selectedIndexPath: IndexPath?
    var meals : [Meal] = []
    var favMeals : [Int : Bool] = [:]
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    let viewModel = HomeVIewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
           configureCategoryCollectionView()
           configureNavigationBar()
           fetchDataAndUpdateUI()
        // Do any additional setup after loading the view.
    }

    private func configureTableView() {

        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        
        tableview.register(UINib(nibName: "RecipeCell", bundle: .main), forCellReuseIdentifier: "RecipeCell")
    }

    // Method to configure the category collection view
    private func configureCategoryCollectionView() {
        categoryCollectionView.register(UINib(nibName: "FoodCategoriesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "FoodCategoriesCollectionViewCell")
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 72, height: 96)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        
        categoryCollectionView.collectionViewLayout = layout
    }

    // Method to configure the navigation bar
    private func configureNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Food Recipes"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24) // Customize the font if needed
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
        
        navigationItem.largeTitleDisplayMode = .never
    }

    // Method to fetch and reload data
    private func fetchDataAndUpdateUI() {
        viewModel.getData(foodTag: Categories.getCategories()[0].categorieKey)
        
        viewModel.cellDataSource.bind() { [weak self] meal in
            guard let meals = meal else {
                return
            }
            self?.meals = meals
            self?.tableview.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getFavItems()
        tableview.reloadData()
    }
    
    func getFavItems(){
        favMeals = [:]
        for i in  viewModel.getDataFormDataBase() {
            if let showID = i.id {
                favMeals[showID] = true
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.getCategories().count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoriesCollectionViewCell", for: indexPath) as! FoodCategoriesCollectionViewCell
        let categorie = Categories.getCategories()[indexPath.row]
        cell.configure(with: categorie)

        if(indexPath.row == 0){
            cell.itemSelected() // Set the desired color
            selectedIndexPath = indexPath

        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedIndexPath = selectedIndexPath{
            let previousSelectedCell = collectionView.cellForItem(at: selectedIndexPath) as! FoodCategoriesCollectionViewCell
            previousSelectedCell.itemUnSelected()// Reset the color to your default color
        }
        
        // Update the color for the newly selected cell
        let cell = collectionView.cellForItem(at: indexPath)as! FoodCategoriesCollectionViewCell
        cell.itemSelected() // Set the desired color
        let categories = Categories.getCategories()

        viewModel.getData(foodTag:categories[indexPath.row].categorieKey)
        // Update the selectedIndexPath
        selectedIndexPath = indexPath
    }
    
    
}
extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        let meal = meals[indexPath.row]
                print("x")
        if let id = meal.id{
            cell.initializeCell(meal: meal,Favourite: favMeals[id] != nil ){
                [weak self] in
                if(self?.favMeals[id] == nil){
                    self?.viewModel.saveMeal(withData: meal)
                    cell.changeImage(true)
                }
                else {
                    self?.viewModel.deleteMeal(withId: id)
                    cell.changeImage(false)
                }
                    self?.getFavItems()
            }
        }
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = MealDetailsViewController(nibName: "MealDetailsViewController", bundle: nil)
        navigationController?.pushViewController(details, animated: true)
    }
    
}

