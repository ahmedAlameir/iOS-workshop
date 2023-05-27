//
//  FavouritesViewController.swift
//  iOS workshop
//
//  Created by ammar on 26/05/2023.
//

import UIKit

class FavouritesViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var emptyListImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
extension FavouritesViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return UITableViewCell()
    }
    
    
}
