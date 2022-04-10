//
//  ViewController.swift
//  CollectionViewInsideTableViewExample
//
//  Created by John Codeos on 12/20/19.
//  Copyright © 2019 John Codeos. All rights reserved.
//

import UIKit
import CocoaMQTT

class TableView: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    var colorsArray = RoomData()
    var tappedCell: CollectionViewCellModel!
    var rowWithColors: [CollectionViewCellModel]?
        
    var searchController = UISearchController(searchResultsController: nil)
    let url: URL = URL(string: "http://192.168.1.111:5000/users")! // URLの変更
    var wifiSwitchCond: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundColor = UIColor.colorFromHex("#9E1C40")
        //tableView.separatorStyle = .none

        
        //setUpSegmantContoller()
        
        //setUpRefreshController()
        
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableviewcellid")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //setUpSearchBar()
    }
    
    @IBAction func goToSearch(_ sender: Any) {
    }
    
    private func setUpRefreshController() {
        
        //refresh controll
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
    }
    
    private func setUpSegmantContoller() {
        
        // セグメントに追加するテキストの設定
        let params = ["All", "First", "Second", "Third", "Fourth"]
        // UISegmentedControlを生成
        let mySegment = UISegmentedControl(items: params)
        mySegment.frame = CGRect(x: 10, y: 135, width: UIScreen.main.bounds.size.width - 20, height: 32)
        // 選択されたセグメントの背景色の設定
        mySegment.tintColor = UIColor(red: 0.13, green: 0.61, blue: 0.93, alpha: 1.0)
        // セグメントの背景色の設定
        mySegment.backgroundColor = UIColor(red: 0.96, green: 0.98, blue: 1.00, alpha: 1.0)
        // 選択されたセグメントのフォントと文字色の設定
        mySegment.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "HiraKakuProN-W6", size: 11.0)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.50, green: 0.49, blue: 0.62, alpha: 1.0)
        ], for: .selected)
        // セグメントのフォントと文字色の設定
        mySegment.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "HiraKakuProN-W3", size: 11.0)!,
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.30, green: 0.49, blue: 0.62, alpha: 1.0)
        ], for: .normal)
        // セグメントの選択
        mySegment.selectedSegmentIndex = 0
        // セグメントが変更された時に呼び出すメソッドの設定
        mySegment.addTarget(self, action: #selector(segmentChanged(_:)), for: UIControl.Event.valueChanged)
        // UISegmentedControlを追加
        self.view.addSubview(mySegment)
        
    }
    
    private func setUpSearchBar() {
        
        // -MARK: Search Bar
        let searchBar = self.searchController.searchBar  // searchBarを取得
        searchBar.delegate = self
        //        //searchBar.scopeButtonTitles = ["contain all", "contain something"]  // Scopeボタンのタイトルを設定
        //        searchBar.becomeFirstResponder()
        //
        if #available(iOS 11.0, *){
            // iOS11以降は，UINavigationItemにSearchControllerを設定
            self.navigationItem.searchController = self.searchController
            
            // trueだとスクロールした時にSearchBarを隠す（デフォルトはtrue）
            // falseだとスクロール位置に関係なく常にSearchBarが表示される
            self.navigationItem.hidesSearchBarWhenScrolling = true
            
        }else{
            // iOS11より前は，tableHeaderViewにsearchBarを設定
            self.tableView.tableHeaderView = searchBar  // TableViewの一番上にsearchBarを設置
        }
        
    }
    
    //MARK: - Segment control
    @objc func segmentChanged(_ segment:UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            print("selected all")
        case 1:
            print("selected first")
        case 2:
            print("selected second")
        case 3:
            print("selected third")
        case 4:
            print("selected fourth")
        default:
            break
        }
    }
    
    //MARK: - Refresh Controll
    @objc func handleRefresh(sender: UIRefreshControl) {
        // ここに通信処理などデータフェッチの処理を書く
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.tableView.reloadData()
            sender.endRefreshing()
        }
    }
    
//    @IBAction func wifiSwitcher(_ sender: UISwitch) {
//        if sender.isOn {
//
//        } else {
//
//        }
//    }
    
}

extension TableView: UISearchBarDelegate {
    
}



extension TableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colorsArray.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.objectsArray[section].subcategory.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    // Category Title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemGray6
        headerView.alpha = 0.8
        //headerView.layer.cornerRadius = 10
        let titleLabel = UILabel(frame: CGRect(x: 35, y: 0, width: 200, height: 25))
        headerView.addSubview(titleLabel)
        titleLabel.textColor = .label
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.text = colorsArray.objectsArray[section].category + "    (\(colorsArray.objectsArray[section].category.count))"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid", for: indexPath) as? TableViewCell {
            cell.subCategoryLabel.text = colorsArray.objectsArray[0].subcategory[indexPath.row]
            
            //MARK: - API section
//            let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
//                do  {
//
//                    if data == nil {
//                        DispatchQueue.main.async {
//                            cell.subCategoryLabel.text = self.colorsArray.objectsArray[0].subcategory[indexPath.row]
//                        }
//                    }
//
//                    else {
//
//                        let roomDataArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any] //Any型にキャスト
//                        let roomData = roomDataArray.map { (roomData) -> [String: Any] in
//                            return roomData as! [String: Any]
//                        }
//                        let Building = roomData[0] as AnyObject?
//                        let Building2 = Building?["South Building"] as AnyObject?
//                        let Rooms = Building2?[0] as AnyObject?
//                        //                    let Rooms2 = Rooms?["rooms"] as AnyObject?
//                        //                    let Category = Rooms2?[0] as AnyObject?
//                        //                    let Category2 = Category?[indexPath.row] as AnyObject?
//                        //                    let Room = Category2?[0] as AnyObject?
//                        //                    let Room2 = Room?[indexPath.section] as AnyObject?
//                        //                    let selectedRoom = Room2?[0] as AnyObject?
//
//                        let SubCategory = Rooms?["subcategory"] as AnyObject?
//                        let subCategoryTitle = SubCategory?[indexPath.row] as AnyObject?
//
//                        DispatchQueue.main.async {
//                            if SubCategory != nil {
//                                cell.subCategoryLabel.text = subCategoryTitle! as? String
//                            } else {
//                                cell.subCategoryLabel.text = "connecting ..."
//                            }
//                        }
//                    }
//                }
//
//                catch {
//                    cell.subCategoryLabel.text = "connecting ..."
//                    print(error)
//                }
//            })
//            task.resume()
            
            
            
            // Show SubCategory Title
            //let subCategoryTitle = colorsArray.objectsArray[indexPath.section].subcategory
            //cell.subCategoryLabel.text = subCategoryTitle[indexPath.row]  //+ "    (\(colorsArray.objectsArray[indexPath.section].rooms.count))"
            
            // Pass the data to colletionview inside the tableviewcell
            let rowArray = colorsArray.objectsArray[indexPath.section].rooms[indexPath.row]
            cell.updateCellWith(row: rowArray)
            
            // Set cell's delegate
            cell.cellDelegate = self
            
            cell.selectionStyle = .none
            
            //Fillet radius
            let cornerRadius: CGFloat = 15.0
            
            //The following is to set the fillet operation (achieved by mask)
            let sectionCount = tableView.numberOfRows(inSection: indexPath.section)
            let shapeLayer = CAShapeLayer()
            cell.layer.mask = nil
            //When there are multiple rows of data in the current partition
            if sectionCount > 1 {
                switch indexPath.row {
                    //If it is the first row, the upper left and upper right corners are rounded
                case 0:
                    var bounds = cell.bounds
                    bounds.origin.y += 1.0  //In this way, the top dividing line of the first row of each group is not displayed
                    let bezierPath = UIBezierPath(roundedRect: bounds,
                                                  byRoundingCorners: [.topLeft,.topRight],
                                                  cornerRadii: CGSize(width: cornerRadius,height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                    //If it is the last line, the lower left and lower right corners are rounded
                case sectionCount - 1:
                    var bounds = cell.bounds
                    bounds.size.height -= 1.0  //In this way, the bottom dividing line of each group of the last row is not displayed
                    let bezierPath = UIBezierPath(roundedRect: bounds,
                                                  byRoundingCorners: [.bottomLeft,.bottomRight],
                                                  cornerRadii: CGSize(width: cornerRadius,height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                default:
                    break
                }
            }
            //When the current partition has only one row of data
            else {
                //All four corners are rounded (also set the offset to hide the first and last separation lines)
                let bezierPath = UIBezierPath(roundedRect:
                                                cell.bounds.insetBy(dx: 0.0, dy: 2.0),
                                              cornerRadius: cornerRadius)
                shapeLayer.path = bezierPath.cgPath
                cell.layer.mask = shapeLayer
            }
            
            
            return cell
        }
        return UITableViewCell()
        
    }
    
    
    //MARK: - Set up Detail View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsviewcontrollerseg" {
            let DestViewController = segue.destination as! DetailsViewController
            
            //MARK: - Set up MQTT
            //let hostMqtt = wifiSwitcher(sender: self.wifiSwitch)
            //let hostMqtt = "172.31.32.141"
            //let hostMqtt = "192.168.1.111"
            let hostMqtt = "54.165.233.114"
            let detailRoomClientID = self.tappedCell.name + String(ProcessInfo().processIdentifier)
            let roomMqtt = CocoaMQTT(clientID: detailRoomClientID, host: hostMqtt, port: 8883)
            roomMqtt.autoReconnect = true
            _ = roomMqtt.connect()
            roomMqtt.didConnectAck = { mqtt, ack in
                let topic = self.tappedCell.topic
                //print("__________-------" + topic)
                roomMqtt.subscribe(topic)

                roomMqtt.didReceiveMessage = { mqtt, message, id in
                    
                    var number: Int = 0
                    var percentage: Int = 0
                    
                    number = Int(message.string!) ?? 1
                    let capacity = self.tappedCell.capacity
                    percentage = Int(number * 100 / (capacity))
                    
                    if number < 0 {
                        percentage = 0
                    }
                    
                    if number < 5 {
                        
                    }
                    
                    UIView.animate(withDuration: 1.0) {
                        if percentage >= 0 {
                            DestViewController.detailCircle.value = CGFloat(percentage)
                        } else {
                            DestViewController.detailCircle.value = 0
                        }
                    }
                    DestViewController.detailPercentLabel.text = "\(String(percentage))%"
                    DestViewController.numberLabel.text = "Less than \(String(number)) people in the room."
                    
                    //change font and color
                    if percentage > 100 {
                        DestViewController.detailCircle.progressColor = .purple
                        DestViewController.detailCircle.maxValue = CGFloat(percentage)
                        DestViewController.detailAllartLabel.text = "The number of people in this room exceeds the permissible capacity. Please move to another room now."
                        DestViewController.detailAllartLabel.textColor = .red
                        DestViewController.detailNumberLabel.text = "Very crowded😡"
                        
                    } else if percentage > 80  {
                        DestViewController.detailCircle.progressColor = .red
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        DestViewController.detailNumberLabel.text = "Quite crowded😠"
                        
                    } else if percentage > 60  {
                        DestViewController.detailCircle.progressColor = .orange
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        DestViewController.detailNumberLabel.text = "Relatively crowded😬"
                        
                    } else if percentage > 40  {
                        DestViewController.detailCircle.progressColor = .yellow
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        DestViewController.detailNumberLabel.text = "Little crowded🙂"
                        
                    } else if percentage > 20  {
                        DestViewController.detailCircle.progressColor = .green
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        DestViewController.detailNumberLabel.text = "Relatively vacant😉"
                        
                    } else {
                        DestViewController.detailCircle.progressColor = .systemTeal
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        DestViewController.detailNumberLabel.text = "Quite vacant😁"
                        
                    }
                }
            }
            //MARK: - API section
//            let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
//                do  {
//                    if data == nil {
//                        DestViewController.roomName = "nil"
//                        DestViewController.roomDetailTextView = "nil"
//                        DestViewController.numCapacity = 0
//                        DestViewController.numDesks = 0
//                        DestViewController.numMonitors = 0
//                    }
//
//                    else {
//                        let roomDataArray = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [Any] //Any型にキャスト
//                        let roomData = roomDataArray.map { (roomData) -> [String: Any] in
//                            return roomData as! [String: Any]
//                        }
//                        let Building = roomData[0] as AnyObject?
//                        let Building2 = Building?["South Building"] as AnyObject?
//                        let Rooms = Building2?[0] as AnyObject?
//                        let Rooms2 = Rooms?["rooms"] as AnyObject?
//                        //let SubCategory = Rooms?["subcategory"] as AnyObject?
//                        let Category = Rooms2?[0] as AnyObject?
//                        let Category2 = Category?[self.tappedCell.category] as AnyObject?
//                        let Room = Category2?[0] as AnyObject?
//                        let Room2 = Room?[self.tappedCell.name] as AnyObject?
//                        let selectedRoom = Room2?[0] as AnyObject?
//
//                        let roomName = selectedRoom?["roomName"]
//                        let roomDetail = selectedRoom?["roomDetail"]
//                        let capacity = selectedRoom?["capacity"]
//                        let desks = selectedRoom?["desks"]
//                        let monitors = selectedRoom?["monitors"]
//
//                        if roomName != nil {
//                            DestViewController.roomName = roomName! as? String
//                            DestViewController.roomDetailTextView = roomDetail! as? String
//                            print(roomName! as? String ?? "nil")
//                        } else {
//                            DestViewController.roomName = "nil"
//                            DestViewController.roomDetailTextView = "nil"
//                        }
//
//                        if capacity != nil {
//                            DestViewController.numCapacity = capacity! as? Int
//                            DestViewController.numDesks = desks! as? Int
//                            DestViewController.numMonitors = monitors! as? Int
//                        } else {
//                            DestViewController.numCapacity = 0
//                            DestViewController.numDesks = 0
//                            DestViewController.numMonitors = 0
//                        }
//
//                        //MARK: - Set up MQTT
//                        //let hostMqtt = wifiSwitcher(sender: self.wifiSwitch)
//                        //let hostMqtt = "172.31.32.141"
//                        //let hostMqtt = "192.168.1.111"
//                        let hostMqtt = "54.165.233.114"
//                        let detailRoomClientID = self.tappedCell.name + String(ProcessInfo().processIdentifier)
//                        let roomMqtt = CocoaMQTT(clientID: detailRoomClientID, host: hostMqtt, port: 8883)
//                        roomMqtt.autoReconnect = true
//                        _ = roomMqtt.connect()
//                        roomMqtt.didConnectAck = { mqtt, ack in
//                            let topic = self.tappedCell.topic
//                            print("__________-------" + topic)
//                            roomMqtt.subscribe(topic)
//
//                            roomMqtt.didReceiveMessage = { mqtt, message, id in
//                                let number: Int = Int(message.string!) ?? 1
//                                let capacity = selectedRoom?["capacity"]! as? Int
//                                let percentage = Int(number * 100 / (capacity ?? 1))
//
//                                UIView.animate(withDuration: 1.0) {
//                                    if percentage >= 0 {
//                                        DestViewController.detailCircle.value = CGFloat(percentage)
//                                    } else {
//                                        DestViewController.detailCircle.value = 0
//                                    }
//                                }
//                                DestViewController.detailPercentLabel.text = "\(String(percentage))%"
//                                DestViewController.numberLabel.text = "\(String(number)) people"
//                                DestViewController.detailNumberLabel.text = "There are \(message.string!) people in the room."
//
//                                //change font and color
//                                if percentage > 100 {
//                                    DestViewController.detailCircle.progressColor = .purple
//                                    DestViewController.detailCircle.maxValue = CGFloat(percentage)
//                                    DestViewController.detailAllartLabel.text = "The number of people in this room exceeds the permissible capacity. Please move to another room now."
//                                    DestViewController.detailAllartLabel.textColor = .red
//
//                                } else if percentage > 80  {
//                                    DestViewController.detailCircle.progressColor = .red
//                                    DestViewController.detailAllartLabel.text = " "
//                                    DestViewController.detailCircle.maxValue = 100
//
//                                } else if percentage > 60  {
//                                    DestViewController.detailCircle.progressColor = .orange
//                                    DestViewController.detailAllartLabel.text = " "
//                                    DestViewController.detailCircle.maxValue = 100
//
//                                } else if percentage > 40  {
//                                    DestViewController.detailCircle.progressColor = .yellow
//                                    DestViewController.detailAllartLabel.text = " "
//                                    DestViewController.detailCircle.maxValue = 100
//
//                                } else if percentage > 20  {
//                                    DestViewController.detailCircle.progressColor = .green
//                                    DestViewController.detailAllartLabel.text = " "
//                                    DestViewController.detailCircle.maxValue = 100
//
//                                } else {
//                                    DestViewController.detailCircle.progressColor = .systemTeal
//                                    DestViewController.detailAllartLabel.text = " "
//                                    DestViewController.detailCircle.maxValue = 100
//
//                                }
//                            }
//                        }
//                    }
//                }
//                catch {
//                    DestViewController.roomName = "nil"
//                    DestViewController.roomDetailTextView = "nil"
//                    print(error)
//                }
//            })
//            task.resume()
            
            DestViewController.roomName = tappedCell.name
            DestViewController.detailImageViewName = tappedCell.imageName
            DestViewController.roomDetailTextView = tappedCell.roomDetail
            DestViewController.floorMap = tappedCell.floorMaps
            DestViewController.numCapacity = tappedCell.capacity
            DestViewController.numDesks = tappedCell.desks
            DestViewController.numMonitors = tappedCell.monitors
            
        }
        
    }
}

extension TableView: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
        if let colorsRow = didTappedInTableViewCell.rowWhithRooms {
            self.tappedCell = colorsRow[index]
            performSegue(withIdentifier: "detailsviewcontrollerseg", sender: self)
            // You can also do changes to the cell you tapped using the 'collectionviewcell'
        }
    }
}


struct Feedbacker {
    
    static func notice(type: UINotificationFeedbackGenerator.FeedbackType) {
        if #available(iOS 10.0, *) {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(type)
        }
    }
    
    static func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.prepare()
            generator.impactOccurred()
        }
    }
    
    static func selection() {
        if #available(iOS 10.0, *) {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
    }
    
}
