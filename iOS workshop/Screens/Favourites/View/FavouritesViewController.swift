//
//  FavouritesViewController.swift
//  iOS workshop
//
//  Created by ammar on 26/05/2023.
//

import UIKit

class FavouritesViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var emptyListImage: UIImageView!
    
    var favMeals:[Meal]!
    
    var viewModel : FvaouritesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favMeals = []
        
        tableview.register(UINib(nibName: "RecipeCell", bundle: .main), forCellReuseIdentifier: "RecipeCell")
        tableview.dataSource = self
        tableview.delegate = self
        
        viewModel = FvaouritesViewModel()
        
        viewModel.cellDataSource.bind(){ [weak self] data in
            if let data = data {
                self?.favMeals = data
                self?.tableview.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getData()
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
extension FavouritesViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(favMeals.isEmpty){
            emptyListImage.isHidden = false
        }
        else{
            emptyListImage.isHidden = true
        }
        return favMeals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        
        let meal = favMeals[indexPath.row]
        if let id = meal.id{
            cell.initializeCell(meal: meal,Favourite: true ){
                [weak self]  in
                self?.viewModel.removeMeal(IdMeal: id)
                self?.tableview.reloadData()
            }
        }
        
        
        
        
        return cell
        
    }
    
}
