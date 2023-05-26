//
//  HomeViewController.swift
//  iOS workshop
//
//  Created by Hadia Yehia on 26/05/2023.
//

import UIKit

class HomeViewController: UIViewController {
    var selectedIndexPath: IndexPath?

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(UINib(nibName: "FoodCategoriesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "FoodCategoriesCollectionViewCell")
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
        categoryCollectionView.collectionViewLayout = layeout
        
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
        
        
        // Update the selectedIndexPath
        selectedIndexPath = indexPath
    }
    
    
}
