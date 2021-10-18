//
//  DetailsViewController.swift
//  CollectionViewInsideTableViewExample
//
//  Created by John Codeos on 12/30/19.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import Foundation
import UIKit
import MBCircularProgressBar
import ImageViewer_swift

class DetailsViewController: UIViewController {
    
    var roomName: String!
    var detailImageViewName: String!
    var numberInTheRoom: String!
    var roomDetailTextView: String!
    var floorMap: String!
    var numCapacity: Int!
    var numDesks: Int!
    var numMonitors: Int!

    @IBOutlet var detailView: UIView!
    
    @IBOutlet var viewHeight: NSLayoutConstraint!
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailImageViewHeight: NSLayoutConstraint!
    @IBOutlet var detailImageViewWidth: NSLayoutConstraint!
    
    @IBOutlet var detailPercentLabel: UILabel!
    @IBOutlet var detailAllartLabel: UILabel!
    @IBOutlet var detailNumberLabel: UILabel!
    @IBOutlet var detailCircle: MBCircularProgressBarView!
    
    @IBOutlet var detailRoomDetail: UITextView!
    
    @IBOutlet var mapView: UIImageView!
    @IBOutlet var mapViewWidth: NSLayoutConstraint!
    @IBOutlet var mapViewHeight: NSLayoutConstraint!
    
    @IBOutlet var capacityLabel: UILabel!
    @IBOutlet var desksLabel: UILabel!
    @IBOutlet var monitorsLabel: UILabel!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setUpObjectSize()

        NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(DetailsViewController.orientationChanged),
                    name: UIDevice.orientationDidChangeNotification,
                    object: nil)
        
    }
    
    private func setUp() {
        
        self.view.backgroundColor = .systemGray6
        
        self.navigationItem.title = roomName
        
        self.detailImageView.image = UIImage(named: detailImageViewName)
        detailImageView.layer.cornerRadius = 10
        
        self.detailRoomDetail.text = roomDetailTextView
        self.detailRoomDetail.layer.cornerRadius = 10
        
        self.mapView.image = UIImage(named: floorMap)
        self.mapView.setupImageViewer()
        self.mapView.layer.cornerRadius = 10

        
        self.capacityLabel.text = "Capacity:                " + String(numCapacity)
        
        self.desksLabel.text = "Desks:                     " + String(numDesks)
        
        self.monitorsLabel.text = "Monitors:                     " + String(numMonitors)
    

    }
    
    private func setUpObjectSize() {
        let height = UIScreen.main.bounds.size.height
        let width = UIScreen.main.bounds.size.width

        //vartical
        if width < height {
            viewHeight.constant = (width - 20) * 0.6 + (width - 20) * 0.5 + 850

            detailImageViewWidth.constant = width - 20
            detailImageViewHeight.constant  = (width - 20) * 0.6


            mapViewWidth.constant = width - 20
            mapViewHeight.constant = (width - 20) * 0.5

        //horizonal
        } else {
            viewHeight.constant = 1050 + height * 0.8 + height - 50

            detailImageViewHeight.constant  = height * 0.8
            detailImageViewWidth.constant = (height * 0.8) * 1.67

            mapViewHeight.constant = height - 50
            mapViewWidth.constant = (height - 50) * 2

        }
    }
    
    @objc func orientationChanged() {
        setUpObjectSize()
    }
    
}


