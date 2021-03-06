//
//  FilmViewController.swift
//  Star Wars
//
//  Created by Lu Yu on 7/16/17.
//  Copyright © 2017 Lu Yu. All rights reserved.
//

import UIKit

class FilmViewController: UITableViewController {
    var films = [NSDictionary]()
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = films[indexPath.row]["title"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showFSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! NSIndexPath
        let destController = segue.destination as? ShowFViewController
        destController?.film = films[indexPath.row]
        
    }
    //
    //  PeopleViewController.swift
    //  Star Wars
    //
    //  Created by Lu Yu on 7/14/17.
    //  Copyright © 2017 Lu Yu. All rights reserved.
    //
    
        override func viewDidLoad() {
            super.viewDidLoad()
            StarWarsModel.getAllFilms(completionHandler:{
                data, response, error in
                do {
                    // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let results = jsonResult["results"] as? NSArray {
                            for film in results {
                                let filmDict = film as! NSDictionary
                                self.films.append(filmDict)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Something went wrong")
                }
            })

//            getData()
            // Do any additional setup after loading the view, typically from a nib.
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
        func getData() {
            let url = URL(string: "http://swapi.co/api/films/")
            // create a URLSession to handle the request tasks
            let session = URLSession.shared
            // create a "data task" to make the request and run the completion handler
            let task = session.dataTask(with: url!, completionHandler: {
                // see: Swift closure expression syntax
                data, response, error in
                do {
                    // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let results = jsonResult["results"] {
                            // coercing the results object as an NSArray and then storing that in resultsArray
                            let resultsArray = results as! NSArray
                            // now we can run NSArray methods like count and firstObject
                            for film in resultsArray {
                                // cast to dictionary for data extraction
                                let filmDict = film as! NSDictionary
                                self.films.append(filmDict)
                            }

                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            })
            // execute the task and wait for the response before
            // running the completion handler. This is async!
            task.resume()
            print("I happen before the response!")
        }
        
    }
    

    

