//
//  HomeTabBar.swift
//  iOS workshop
//
//  Created by Hadia Yehia on 26/05/2023.
//

import UIKit

class HomeTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = hexStringToUIColor(hex:"#D99651")
        
           setupVCs()


        // Do any additional setup after loading the view.
    }
   

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0

        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func setupVCs() {
            viewControllers = [
                createNavController(for: HomeViewController(nibName: "HomeViewController",bundle: Bundle.main),  title: NSLocalizedString("Food Recipes", comment: ""), image: UIImage(named: "ic_homeIcon"),imageColored:UIImage(named: "ic_coloredHomeIcon" )),
                createNavController(for:FavouritesViewController(nibName: "FavouritesViewController",bundle: Bundle.main), title: NSLocalizedString("Favourite", comment: ""), image: UIImage(named: "ic_favouriteIcon"),imageColored:UIImage(named: "ic_coloredFavouriteIcon")),
                
            ]
        }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                         image: UIImage?,imageColored:UIImage?) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = imageColored
            navController.navigationBar.prefersLargeTitles = true
            return navController
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
