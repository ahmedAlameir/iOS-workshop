//
//  MealDetailsViewController.swift
//  iOS workshop
//
//  Created by Hadia Yehia on 27/05/2023.
//

import UIKit

class MealDetailsViewController: UIViewController {

    @IBOutlet weak var mealImgHeader: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     let overlayImg = UIImage(named: "ic_overlay")
        let overlayImgView = UIImageView(image:  overlayImg)
        overlayImgView.frame = mealImgHeader.frame
        mealImgHeader.addSubview(overlayImgView)
        navigationController?.navigationBar.isHidden = true
        navigationItem.largeTitleDisplayMode = .never
    
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


