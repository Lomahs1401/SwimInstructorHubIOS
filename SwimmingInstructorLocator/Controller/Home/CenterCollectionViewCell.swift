//
//  CenterCollectionViewCell.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 23/03/2024.
//

import UIKit

class CenterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var centerImg: UIImageView!
    @IBOutlet weak var layerImg: UIView!
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var centerBtnMark: UIButton!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell() {
        centerView.layer.cornerRadius = 20
                centerView.layer.shadowColor = UIColor.black.cgColor
        centerView.layer.shadowOpacity = 0.3
        centerView.layer.shadowOffset = CGSize(width: 0, height: 0.5)
                centerView.layer.shadowRadius = 1
                centerView.layer.masksToBounds = false
        
        // Rounded corners for top left and top right of centerImg
        let imageLayer = CAShapeLayer()
        imageLayer.path = UIBezierPath(roundedRect: centerImg.bounds,
                                      byRoundingCorners: [.topLeft, .topRight],
                                      cornerRadii: CGSize(width: 20, height: 20)).cgPath
        centerImg.layer.mask = imageLayer
        
        let layerViewImgLayer = CAShapeLayer()
        layerViewImgLayer.path = UIBezierPath(roundedRect: layerImg.frame,
                                      byRoundingCorners: [.topLeft, .topRight],
                                      cornerRadii: CGSize(width: 20, height: 20)).cgPath
        layerImg.layer.mask = layerViewImgLayer
        
    }
}
