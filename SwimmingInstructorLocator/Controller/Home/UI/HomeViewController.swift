//
//  HomeViewController.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 11/03/2024.
//

import UIKit
import SideMenu
import SwiftyJSON
import NVActivityIndicatorView
import Kingfisher

enum CollectionViewType {
    case center
    case instructor
}

class HomeViewController: UIViewController {
    
    private var presenter: HomeContractPresenter!
    private var centerRepo: CenterRepo!
    private var centerService: CenterService!
    private var activityIndicator: NVActivityIndicatorView!
    private var listCenters: [Center] = []
    
    @IBOutlet weak var centerCollectionView: UICollectionView!
    @IBOutlet weak var instructorCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerRepo = CenterRepo()
        centerService = CenterService(centerRepo: centerRepo)
        
        presenter = HomePresenter(centerService: centerService)
        presenter.attachView(view: self)
        
        let frame = CGRect(x: self.view.frame.width / 2 - 25, y: self.view.frame.height / 2 - 25, width: 80, height: 80)
        activityIndicator = NVActivityIndicatorView(frame: frame, type: .ballRotateChase, color: .blue, padding: nil)
        self.view.addSubview(activityIndicator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        enableHero()
//        activityIndicator.startAnimating()
        presenter.onStart()
//        presenter.getListCenters()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disableHero()
        presenter.onStop()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case centerCollectionView:
            return listCenters.count
        case instructorCollectionView:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case centerCollectionView:
            let centerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "centerCell", for: indexPath) as! CenterCollectionViewCell
            let center = listCenters[indexPath.row]
            
            centerCell.centerName.text = center.centerName
            centerCell.address.text = center.address.first
            centerCell.phone.text = center.phone.first
            
            if let imageUrl = URL(string: center.image) {
                centerCell.centerImg.kf.setImage(with: imageUrl)
            }
            
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

extension HomeViewController: HomeContractView {
    func onGetListCenters(listCenters: [Center]) {
        activityIndicator.stopAnimating()
        self.listCenters = listCenters
        
        do {
            let jsonData = try JSONEncoder().encode(listCenters)
            let json = try JSON(data: jsonData)
            print(json.debugDescription)
        } catch {
            print("Error: Unable to encode data to JSON - \(error)")
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.centerCollectionView.reloadData()
        }
    }
}
