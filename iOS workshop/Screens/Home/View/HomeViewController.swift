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
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    let viewModel = HomeVIewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        
        categoryCollectionView.register(UINib(nibName: "FoodCategoriesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "FoodCategoriesCollectionViewCell")
        
        tableview.register(UINib(nibName: "RecipeCell", bundle: .main), forCellReuseIdentifier: "RecipeCell")
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let layeout = UICollectionViewFlowLayout()
        layeout.itemSize = CGSize(width: 72, height: 96)
        layeout.scrollDirection = .horizontal
        layeout.minimumInteritemSpacing = 0
        layeout.minimumLineSpacing = 5
        
        let titleLabel = UILabel()
          titleLabel.text = "Food Recipes"
          titleLabel.textAlignment = .center
          titleLabel.font = UIFont.boldSystemFont(ofSize: 24) // Customize the font if needed
          titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
        
        navigationItem.largeTitleDisplayMode = .never

        
        categoryCollectionView.collectionViewLayout = layeout
        
        viewModel.getData(foodTag: Categories.getCategories()[0].categorieKey)
        
        viewModel.cellDataSource.bind(){ [weak self] meal in
            guard let meals = meal else {
                return
            }
            self?.meals = meals.map{ $0 }
            self?.tableview.reloadData()
        }
        // Do any additional setup after loading the view.
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
        let categories = Categories.getCategories()
        cell.categoriesImage.image  = UIImage(named: categories[indexPath.row].categorieImage)
        cell.categoriesName.text = categories[indexPath.row].categorieName

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
        cell.initializeCell(meal: meals[indexPath.row])
        
        return cell

    }
    
    
    
    
}

