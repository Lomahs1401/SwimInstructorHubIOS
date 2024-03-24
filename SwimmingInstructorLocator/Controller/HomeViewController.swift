//
//  HomeViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 11/03/2024.
//

import UIKit
import SideMenu

enum CollectionViewType {
    case center
    case instructor
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var centerCollectionView: UICollectionView!
    @IBOutlet weak var instructorCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enableHero()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disableHero()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case centerCollectionView:
            return 4
        case instructorCollectionView:
            return 6
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case centerCollectionView:
            let centerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "centerCell", for: indexPath) as! CenterCollectionViewCell
            return centerCell
        case instructorCollectionView:
            let instructorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "instructorCell", for: indexPath) as! InstructorCollectionViewCell
            return instructorCell
        default:
            fatalError("Unexpected collection view")
        }
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}
