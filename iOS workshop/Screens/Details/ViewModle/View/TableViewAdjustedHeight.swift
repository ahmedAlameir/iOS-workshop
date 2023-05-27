//
//  TableViewAdjustedHeight.swift
//  iOS workshop
//
//  Created by Hadia Yehia on 27/05/2023.
//

import Foundation
import UIKit
class TableViewAdjustedHeight: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
