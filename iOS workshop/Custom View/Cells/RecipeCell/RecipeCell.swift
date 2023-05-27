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
    
    
    var onClick : (()-> Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favBackgroundView.clipsToBounds = true
        
        favBackgroundView.layer.cornerRadius = favBackgroundView.frame.width / 4
        
        mealImage.clipsToBounds = true
        
        mealImage.layer.cornerRadius = mealImage.frame.height / 10
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        favImage.isUserInteractionEnabled = true
        favImage.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        onClick()
        //        if(isFav){
        //            tappedImage.image = UIImage(systemName: "heart")
        //            onClick(false)
        //        }
        //        else {
        //            tappedImage.image = UIImage(systemName: "heart.fill")
        //            onClick(true)
        //        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    func changeImage(_ isFav : Bool){
        if(isFav){
            favImage.image = UIImage(systemName: "heart.fill")
        }
        else {
            favImage.image = UIImage(systemName: "heart")
        }
    }
    
    
    func initializeCell(meal : Meal,Favourite isFav:Bool,_ onClick : @escaping ()-> Void){
        self.onClick = onClick
        recipeName.text = meal.name
        chefName.text = meal.credits?[0].name ?? "None"
        foodTypeName.text = meal.credits?[0].type ?? "None"
        servingsNumber.text = String(meal.numServings ?? 0)
        mealImage.sd_setImage(with: URL(string: meal.thumbnailURL ?? ""), placeholderImage : UIImage(named: "ic_RecipeCell"))
        if(isFav){
            favImage.image = UIImage(systemName: "heart.fill")
        }
        else{
            favImage.image = UIImage(systemName: "heart")
            
        }
    }
    
}
