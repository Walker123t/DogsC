//
//  SubBreedListTableViewController.swift
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

class SubBreedListTableViewController: UITableViewController {
    var breed: Breed?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let breed = breed else {return}
        self.title = breed.name
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breed?.subBreeds.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        guard let breed = breed?.subBreeds[indexPath.row] as? SubBreed else {return UITableViewCell()}
        cell.textLabel?.text = breed.name
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let breed = breed?.subBreeds[indexPath.row] as? SubBreed else {return}
        if segue.identifier == "fromSubToImages"
        {
            let destination = segue.destination as?
        }
    }
}
