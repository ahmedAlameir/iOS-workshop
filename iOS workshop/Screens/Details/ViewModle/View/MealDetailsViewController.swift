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
        let overlayImg = UIImage(named: "ic_overlay")
        let overlayImgView = UIImageView(image:  overlayImg)
        overlayImgView.frame = mealImgHeader.frame
        mealImgHeader.addSubview(overlayImgView)
        navigationController?.navigationBar.isHidden = true
        navigationItem.largeTitleDisplayMode = .never
        ingredientTable.reloadData()
       let height = ingredientTable.contentSize.height
        
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }*/
    
    
  
    @IBOutlet weak var instructionsTable: TableViewAdjustedHeight!
    @IBOutlet weak var ingredientTable: TableViewAdjustedHeight!
    
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
            break
        default:
            cell.initializeCell(name: "Hadia")
            break
            
        }
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            // Calculate the height based on the cell's content
//        let yourContentHeight: CGFloat = calculateContentHeightForIndexPath(indexPath:indexPath)
//            let cellHeight = yourContentHeight + 5 // Include any additional padding or spacing
//
//            return cellHeight
//
//
//    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 88.0
//    }
//    calculateContentHeightForIndexPath(indexPath: IndexPath){
//
//    }
    }




