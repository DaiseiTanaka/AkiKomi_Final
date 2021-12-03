//
//  TableViewCell.swift
//  CollectionViewInsideTableViewExample
//
//  Created by John Codeos on 12/20/19.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import UIKit
import CocoaMQTT

protocol CollectionViewCellDelegate: AnyObject {
    func collectionView(collectionviewcell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell)
    // other delegate methods that you can define to perform action in viewcontroller
}

class TableViewCell: UITableViewCell {
    
    var selfIndex: Int = 0
    
    weak var cellDelegate: CollectionViewCellDelegate?
    
    var rowWithColors: [CollectionViewCellModel]?
    
    
    @IBOutlet var subCategoryLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableViewContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemBackground
        self.subCategoryLabel.textColor = .label
        self.subCategoryLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        // TODO: need to setup collection view flow layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 160)
        //flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 2.0
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        // Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // Register the xib for collection view cell
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "collectionviewcellid")
        
    }
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // The data we passed from the TableView send them to the CollectionView Model
    func updateCellWith(row: [CollectionViewCellModel]) {
        self.rowWithColors = row
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Feedbacker.impact(style: .medium)
        
        let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        //print("I'm tapping the \(indexPath.item)")
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rowWithColors?.count  ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Set the data for each cell (color and color name)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionviewcellid", for: indexPath) as? CollectionViewCell {
            //cell.colorView.backgroundColor = self.rowWithColors?[indexPath.item].color ?? UIColor.black
            
            //MARK: - API section
            let url: URL = URL(string: "http://192.168.1.111:5000/users")! // URLの変更
            let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                do  {
                    if data == nil {
                        DispatchQueue.main.async {
                            
                            cell.nameLabel.text = self.rowWithColors?[indexPath.item].name ?? ""
                        }
                    }
                    
                    else {
                        let roomDataArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any] //Any型にキャスト
                        let roomData = roomDataArray.map { (roomData) -> [String: Any] in
                            return roomData as! [String: Any]
                        }
                        let Building = roomData[0] as AnyObject?
                        let Building2 = Building?["South Building"] as AnyObject?
                        let Rooms = Building2?[0] as AnyObject?
                        let Rooms2 = Rooms?["rooms"] as AnyObject?
                        let Category = Rooms2?[0] as AnyObject?
                        let Category2 = Category?[self.rowWithColors?[indexPath.item].category ?? "Library"] as AnyObject?
                        let Room = Category2?[0] as AnyObject?
                        let Room2 = Room?[self.rowWithColors?[indexPath.item].name ?? "South Library"] as AnyObject?
                        let selectedRoom = Room2?[0] as AnyObject?
                        
                        let roomName = selectedRoom?["roomName"]
                        DispatchQueue.main.async {
                            if roomName != nil {
                                cell.nameLabel.text = roomName! as? String
                            } else {
                                cell.nameLabel.text = "connecting ..."
                            }
                        }
                        
                        //MARK: - Set up MQTT
                        let clientID = String(self.rowWithColors?[indexPath.item].imageName ?? "connected_error!!") + String(ProcessInfo().processIdentifier)
                        
                        let hostmqttKUAS = "172.31.32.141"
                        let hostmqttEWS = "192.168.1.111"
                        let roomMqtt = CocoaMQTT(clientID: clientID, host: hostmqttEWS, port: 1883)
                        roomMqtt.autoReconnect = true
                        _ = roomMqtt.connect()
                        roomMqtt.didConnectAck = { mqtt, ack in
                            let topic = selectedRoom?["topic"]! as? String
                            roomMqtt.subscribe(topic ?? "topic_aadvanced")
                            roomMqtt.didReceiveMessage = { mqtt, message, id in
                                
                                let number: Int = Int(message.string!) ?? 1
                                let capacity = selectedRoom?["capacity"]! as? Int
                                let percentage = Int(number * 100 / (capacity ?? 1))
                                
                                UIView.animate(withDuration: 1.0) {
                                    cell.miniCircle.value = CGFloat(percentage)
                                }
                                cell.percentageLabel.text = "\(String(percentage))%"
                                
                                //change font and color
                                if percentage > 100 {
                                    cell.miniCircle.progressColor = .purple
                                    cell.miniCircle.maxValue = CGFloat(percentage)
                                    
                                } else if percentage > 80  {
                                    cell.miniCircle.progressColor = .red
                                    cell.miniCircle.maxValue = 100
                                    
                                } else if percentage > 60  {
                                    cell.miniCircle.progressColor = .orange
                                    cell.miniCircle.maxValue = 100
                                    
                                } else if percentage > 40  {
                                    cell.miniCircle.progressColor = .yellow
                                    cell.miniCircle.maxValue = 100
                                    
                                } else if percentage > 20  {
                                    cell.miniCircle.progressColor = .green
                                    cell.miniCircle.maxValue = 100
                                    
                                } else {
                                    cell.miniCircle.progressColor = .systemTeal
                                    cell.miniCircle.maxValue = 100
                                    
                                }
                            }
                        }
                        
                    }
                    
                    
                    
                }
                catch {
                    cell.nameLabel.text = self.rowWithColors?[indexPath.item].name ?? "Connecting..."
                    print(error)
                }
            })
            task.resume()
            
            //cell.nameLabel.text = self.rowWithColors?[indexPath.item].name ?? ""
            cell.imageView.image = UIImage(named: self.rowWithColors?[indexPath.item].imageName ??  "advanced_hall")
            
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Add spaces at the beginning and the end of the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
