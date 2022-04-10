//
//  CollectionViewCell.swift
//  CollectionViewInsideTableViewExample
//
//  Created by John Codeos on 12/21/19.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var miniCircle: MBCircularProgressBarView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var numberLabelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.cornerRadius = 56
        
    }
}
