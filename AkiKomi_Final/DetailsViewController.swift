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
import SwiftyJSON

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
    
    @IBOutlet var scrollview: UIScrollView!
    
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
    
    @IBOutlet var apiLabel: UILabel!
    
    @IBOutlet var repeadButton: UIBarButtonItem!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        setUp()
    }

    private func setUpRefreshController() {
        
        //refresh control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        scrollview.refreshControl = refreshControl
        
    }
    
    //MARK: - Refresh Controll
    @objc func handleRefresh(sender: UIRefreshControl) {
        // ここに通信処理などデータフェッチの処理を書く
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.loadView()
            self.viewDidLoad()
            sender.endRefreshing()
        }
    }
    
    private func setUp() {
        
        self.view.backgroundColor = .systemGray6
        
        self.navigationItem.title = roomName ?? "Connecting..."
        
        self.detailImageView.image = UIImage(named: detailImageViewName)
        detailImageView.layer.cornerRadius = 10
        
        self.detailRoomDetail.text = roomDetailTextView ?? "Connecting..."
        //self.detailRoomDetail.layer.cornerRadius = 10
        
        self.mapView.image = UIImage(named: floorMap)
        self.mapView.setupImageViewer()
        self.mapView.layer.cornerRadius = 10

        
        self.capacityLabel.text = String(numCapacity ?? 0)
        
        self.desksLabel.text = String(numDesks ?? 0)
        
        self.monitorsLabel.text = String(numMonitors ?? 0)
    

    }
    
    private func setUpObjectSize() {
        let height = UIScreen.main.bounds.size.height
        let width = UIScreen.main.bounds.size.width

        //vartical
        if width < height {
            viewHeight.constant = (width - 20) * 0.6 + (width - 20) * 0.5 + 850

            //detailImageViewWidth.constant = width - 20
            detailImageViewHeight.constant  = (width - 20) * 0.6


//            mapViewWidth.constant = width - 20
            mapViewHeight.constant = (width - 20) * 0.5

        //horizonal
        } else {
            viewHeight.constant = 1050 + height * 0.8 + height - 50

            detailImageViewHeight.constant  = height * 2/3
            //detailImageViewWidth.constant = (height * 0.8) * 1.67

            mapViewHeight.constant = height * 2/3
//            mapViewWidth.constant = width - 20

        }
    }
    
    @objc func orientationChanged() {
        setUpObjectSize()
    }
    
}


struct User: Codable {
    let roomName: String
    let roomDetail: String
    let topic: String
    let capacity: Int
    let desks: Int
    let monitors: Int
}
