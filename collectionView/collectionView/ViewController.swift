//
//  ViewController.swift
//  collectionView
//
//  Created by ChicMic on 23/02/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
 
    var imageArray = ["cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6"]
    
    var labelArray = ["cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6","cat1","cat2","cat3","cat4","cat5","cat6"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
        cell.myImage.image = UIImage(named: imageArray[indexPath.row])
        cell.myLabel.text = String(labelArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 180, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

