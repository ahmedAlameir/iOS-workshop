//
//  DetailsTableViewCell.swift
//  iOS workshop
//
//  Created by ammar on 27/05/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var detailsLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        circle.clipsToBounds = true

        circle.layer.cornerRadius = circle.frame.width / 4
    }
    
    func initializeCell(name : String ){
        detailsLable.text = name
        
    }
}
