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
    
    var colorsArray = RoomData()
    var tappedCell: CollectionViewCellModel!
    var rowWithColors: [CollectionViewCellModel]?

    
    
    var searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.backgroundColor = UIColor.colorFromHex("#9E1C40")
        //tableView.separatorStyle = .none
        
        
        //setUpSegmantContoller()
        
        setUpRefreshController()
        
        
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "tableviewcellid")

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpSearchBar()

    }
    
    @IBAction func sideButton(_ sender: Any) {
        Feedbacker.impact(style: .medium)
        
    }
    
    @IBAction func reLoadButton(_ sender: Any) {
        Feedbacker.impact(style: .medium)
        

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
            
            sender.endRefreshing()
        }
    }
    
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
            // Show SubCategory Title
            let subCategoryTitle = colorsArray.objectsArray[indexPath.section].subcategory
            cell.subCategoryLabel.text = subCategoryTitle[indexPath.row]  + "    (\(colorsArray.objectsArray[indexPath.section].subcategory.count))"
        
            // Pass the data to colletionview inside the tableviewcell
            let rowArray = colorsArray.objectsArray[indexPath.section].rooms[indexPath.row]
            cell.updateCellWith(row: rowArray)
            
            // Set cell's delegate
            cell.cellDelegate = self

            cell.selectionStyle = .none
            
            //圆角半径
            let cornerRadius: CGFloat = 15.0
            
            //下面为设置圆角操作（通过遮罩实现）
            let sectionCount = tableView.numberOfRows(inSection: indexPath.section)
            let shapeLayer = CAShapeLayer()
            cell.layer.mask = nil
            //当前分区有多行数据时
            if sectionCount > 1 {
                switch indexPath.row {
                    //如果是第一行,左上、右上角为圆角
                case 0:
                    var bounds = cell.bounds
                    bounds.origin.y += 1.0  //这样每一组首行顶部分割线不显示
                    let bezierPath = UIBezierPath(roundedRect: bounds,
                                                  byRoundingCorners: [.topLeft,.topRight],
                                                  cornerRadii: CGSize(width: cornerRadius,height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                    //如果是最后一行,左下、右下角为圆角
                case sectionCount - 1:
                    var bounds = cell.bounds
                    bounds.size.height -= 1.0  //这样每一组尾行底部分割线不显示
                    let bezierPath = UIBezierPath(roundedRect: bounds,
                                                  byRoundingCorners: [.bottomLeft,.bottomRight],
                                                  cornerRadii: CGSize(width: cornerRadius,height: cornerRadius))
                    shapeLayer.path = bezierPath.cgPath
                    cell.layer.mask = shapeLayer
                default:
                    break
                }
            }
            //当前分区只有一行行数据时
            else {
                //四个角都为圆角（同样设置偏移隐藏首、尾分隔线）
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
            
            DestViewController.roomName = tappedCell.name
            DestViewController.detailImageViewName = tappedCell.imageName
            DestViewController.roomDetailTextView = tappedCell.roomDetail
            DestViewController.floorMap = tappedCell.floorMaps
            DestViewController.numCapacity = tappedCell.capacity
            DestViewController.numDesks = tappedCell.desks
            
            //MARK: - Set up MQTT
            let detailRoomClientID = tappedCell.name + String(ProcessInfo().processIdentifier)
            
            let roomMqtt = CocoaMQTT(clientID: detailRoomClientID, host: "192.168.1.111", port: 1883)
            roomMqtt.autoReconnect = true
            _ = roomMqtt.connect()
            roomMqtt.didConnectAck = { mqtt, ack in
                roomMqtt.subscribe(self.tappedCell.topic)
                roomMqtt.didReceiveMessage = { mqtt, message, id in
                    let number: Int = Int(message.string!) ?? 1
                    let percentage = Int(number * 100 / Int(self.tappedCell.capacity))

                    UIView.animate(withDuration: 1.0) {
                        DestViewController.detailCircle.value = CGFloat(percentage)
                    }
                    DestViewController.detailPercentLabel.text = "\(String(percentage))%"
                    DestViewController.detailNumberLabel.text = "There are \(message.string!) people in the room."
                    
                    //change font and color
                    if percentage > 100 {
                        DestViewController.detailCircle.progressColor = .purple
                        DestViewController.detailCircle.maxValue = CGFloat(percentage)
                        DestViewController.detailAllartLabel.text = "The capacity of this room has been exceeded. Please move to another room now."
                        DestViewController.detailAllartLabel.textColor = .red
                        
                    } else if percentage > 80  {
                        DestViewController.detailCircle.progressColor = .red
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        
                    } else if percentage > 60  {
                        DestViewController.detailCircle.progressColor = .orange
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        
                    } else if percentage > 40  {
                        DestViewController.detailCircle.progressColor = .yellow
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        
                    } else if percentage > 20  {
                        DestViewController.detailCircle.progressColor = .green
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100
                        
                    } else {
                        DestViewController.detailCircle.progressColor = .systemTeal
                        DestViewController.detailAllartLabel.text = " "
                        DestViewController.detailCircle.maxValue = 100

                    }
                }
            }
            
        }
    }
}

extension TableView: CollectionViewCellDelegate {
    func collectionView(collectionviewcell: CollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell) {
        if let colorsRow = didTappedInTableViewCell.rowWithColors {
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
