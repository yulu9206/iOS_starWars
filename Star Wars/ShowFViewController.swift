//
//  ShowFViewController.swift
//  Star Wars
//
//  Created by Lu Yu on 7/17/17.
//  Copyright © 2017 Lu Yu. All rights reserved.
//

import Foundation
import UIKit
class ShowFViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLable: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingLabel: UILabel!

    var film: NSDictionary = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = film["title"] as? String
        releaseLable.text = film["release_date"] as? String
        directorLabel.text = film["director"] as? String
        openingLabel.text = film["opening_crawl"] as? String
    }
}
