
//  RecipeCollectionCell.swift
//  iOS workshop
//
//  Created by ammar on 27/05/2023.
//

import UIKit

class RecipeCollectionCell: UICollectionViewCell {
    @IBOutlet weak var recipeName: UILabel!
    
    @IBOutlet weak var chefName: UILabel!
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var backgroundFav: UIView!
    @IBOutlet weak var backgroundreicpe: UIImageView!
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var servingsNumber: UILabel!
    
    var onClick : (()-> Void)!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundFav.clipsToBounds = true
        
        backgroundFav.layer.cornerRadius = backgroundFav.frame.width / 4
        
        backgroundreicpe.clipsToBounds = true
        
        backgroundreicpe.layer.cornerRadius = backgroundreicpe.frame.height / 10
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        favImage.isUserInteractionEnabled = true
        favImage.addGestureRecognizer(tapGestureRecognizer)
 
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        onClick()
    
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
        typeName.text = meal.credits?[0].type ?? "None"
        servingsNumber.text = String(meal.numServings ?? 0)
        backgroundreicpe.sd_setImage(with: URL(string: meal.thumbnailURL ?? ""), placeholderImage : UIImage(named: "ic_RecipeCell"))
        if(isFav){
            favImage.image = UIImage(systemName: "heart.fill")
        }
        else{
            favImage.image = UIImage(systemName: "heart")
            
        }
    }

}
