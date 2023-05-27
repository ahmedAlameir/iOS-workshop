//
//  FoodCategoriesCollectionViewCell.swift
//  iOS workshop
//
//  Created by ahmed osama on 26/05/2023.
//

import UIKit

class FoodCategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var categoriesImage: UIImageView!
    @IBOutlet weak var categoriesName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        categoriesView.layer.cornerRadius = categoriesView.frame.width/4
        categoriesView.layer.masksToBounds = true
        categoriesView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.04)
        // Initialization code
    }
    func itemSelected(){
        categoriesView.backgroundColor = UIColor(red: 0.85, green: 0.589, blue: 0.319, alpha: 1)
    }
    func itemUnSelected(){
        categoriesView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.04)
    }

}
