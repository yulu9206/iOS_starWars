//
//  ShowPViewController.swift
//  Star Wars
//
//  Created by Lu Yu on 7/17/17.
//  Copyright © 2017 Lu Yu. All rights reserved.
//

import Foundation
import UIKit
class ShowPViewController: UIViewController {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    var index: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getPerson(personNum:(index + 1) , completionHandler:{
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let personDict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    print(jsonResult)
                    DispatchQueue.main.async {
                        self.nameLable.text = personDict["name"]! as? String
                        self.birthLabel.text = personDict["birth_year"]! as? String
                        self.genderLabel.text = personDict["gender"]! as? String
                        self.massLabel.text = personDict["mass"]! as? String
                    }
//                    if let results = jsonResult["results"] as? NSArray {
//                        for person in results {
//                            let personDict = person as! NSDictionary
//                            self.people.append(personDict["name"]! as! String)
//                        }
//                    }
                }

            } catch {
                print("Something went wrong")
            }
        })
        //        getData()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
