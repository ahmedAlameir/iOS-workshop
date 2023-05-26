//
//  RecipeCell.swift
//  iOS workshop
//
//  Created by ammar on 26/05/2023.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var favBackgroundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        favBackgroundView.clipsToBounds = true

        favBackgroundView.layer.cornerRadius = favBackgroundView.frame.width / 4
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
