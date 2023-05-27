//
//  RecipeCell.swift
//  iOS workshop
//
//  Created by ammar on 26/05/2023.
//

import UIKit
import SDWebImage

class RecipeCell: UITableViewCell {

    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var favBackgroundView: UIView!
    
    @IBOutlet weak var recipeName: UILabel!
    
    @IBOutlet weak var chefName: UILabel!
    
    @IBOutlet weak var foodTypeName: UILabel!
    
    @IBOutlet weak var servingsNumber: UILabel!
    
    @IBOutlet weak var favImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        favBackgroundView.clipsToBounds = true

        favBackgroundView.layer.cornerRadius = favBackgroundView.frame.width / 4
        
        mealImage.clipsToBounds = true

        mealImage.layer.cornerRadius = mealImage.frame.height / 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    func initializeCell(meal : Meal){
        
        recipeName.text = meal.name
        chefName.text = meal.credits?[0].name ?? "None"
        foodTypeName.text = meal.credits?[0].type ?? "None"
        servingsNumber.text = String(meal.num_servings ?? 0)
        mealImage.sd_setImage(with: URL(string: meal.thumbnail_url ?? ""), placeholderImage : UIImage(named: "ic_RecipeCell"))
        }
    
}
