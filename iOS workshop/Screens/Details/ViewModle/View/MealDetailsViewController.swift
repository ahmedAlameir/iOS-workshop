//
//  MealDetailsViewController.swift
//  iOS workshop
//
//  Created by Hadia Yehia on 27/05/2023.
//

import UIKit

class MealDetailsViewController: UIViewController {
    @IBAction func backFromDetails(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
   
    @IBOutlet weak var mealImgHeader: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTables()
        
        navigationController?.navigationBar.isHidden = true
       
        
        ingredientTable.reloadData()
        adjustingTableHeight(tableView: ingredientTable, heightConstraint: ingredientHeight)
        adjustingTableHeight(tableView: instructionsTable, heightConstraint: instructionHeight)
        view.setNeedsLayout()
    }
    
    @IBOutlet weak var ingredientHeight: NSLayoutConstraint!
    
    @IBOutlet weak var instructionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var similarCOllection: UICollectionView!
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }*/
    
    @IBOutlet weak var ingredientTable: UITableView!
    @IBOutlet weak var instructionsTable: UITableView!
    
}
extension MealDetailsViewController : UITableViewDelegate,UITableViewDataSource{

        func setupTables(){
            ingredientTable.dataSource = self
            ingredientTable.delegate = self
            instructionsTable.dataSource = self
            instructionsTable.delegate = self
            ingredientTable.register(UINib(nibName: "DetailsTableViewCell", bundle: .main), forCellReuseIdentifier: "DetailsTableViewCell")
            instructionsTable.register(UINib(nibName: "DetailsTableViewCell", bundle: .main), forCellReuseIdentifier: "DetailsTableViewCell")
           
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView{
        case ingredientTable:
            return 10
        case instructionsTable:
            return 10
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as! DetailsTableViewCell
        switch tableView{
        case ingredientTable:
            cell.initializeCell(name: "Hadia")
        case instructionsTable:
            cell.initializeCell(name: "ttttttttt")
        default:
            break

        }
        return cell
    }

    func adjustingTableHeight(tableView:UITableView, heightConstraint:NSLayoutConstraint){
        let height = tableView.contentSize.height
        heightConstraint.constant = height
    }
    }
//extension MealDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
//        return cell
//    }
//
    
//}




