//
//  ImageCollectionViewController.swift
//  DogsC
//
//  Created by Trevor Walker on 7/3/19.
//  Copyright © 2019 Trevor Walker. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCell"

class ImageCollectionViewController: UICollectionViewController {
    var breed: Breed?
    var subBreed: SubBreed?
    var imageURLs: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        guard let breed = breed else {return}
        self.title = breed.name
        if let subBreed = subBreed{
            var title = subBreed.name.capitalized
            title.append(" ")
            title.append(breed.name.capitalized)
            self.title = title
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.imageURLs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    let imageURL = URL(string: imageURLs[indexPath.row])
        cell.
        // Configure the cell
    
        return cell
    }
}

