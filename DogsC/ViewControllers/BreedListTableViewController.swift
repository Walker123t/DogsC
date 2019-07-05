//
//  BreedListTableViewController.swift
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class BreedListTableViewController: UITableViewController {
    var breeds: [Breed] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        BreedNetworkClient.shared().fetchAllBreeds { (breeds) in
            guard let breeds = breeds as? [Breed] else {return}
            self.breeds = breeds
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breeds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)
        cell.textLabel?.text = self.breeds[indexPath.row].name.capitalized
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = self.breeds[indexPath.row]
        if breed.subBreeds.count > 0{
            performSegue(withIdentifier: "toSubBreedVC", sender: self)
        } else {
            performSegue(withIdentifier: "toCollectionVC", sender: self)
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let breed = breeds[indexPath.row]
        if segue.identifier == "toSubBreedVC"{
            let destination = segue.destination as? SubBreedListTableViewController
            destination?.breed = breed
        }
    }
}
