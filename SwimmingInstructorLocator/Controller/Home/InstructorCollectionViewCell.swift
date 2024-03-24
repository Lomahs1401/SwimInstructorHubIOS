//
//  InstructorCollectionViewCell.swift
//  SwimmingInstructorLocator
//
//  Created by Le Hoang Long on 24/03/2024.
//

import UIKit

class InstructorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var instructorImg: UIImageView!
    @IBOutlet weak var instructorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell() {
        instructorImg.layer.cornerRadius = instructorImg.frame.height / 2
        instructorImg.layer.masksToBounds = true
    }
}

