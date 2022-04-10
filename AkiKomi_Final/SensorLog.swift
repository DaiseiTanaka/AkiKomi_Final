//
//  SensorLog.swift
//  AkiKomi_Final
//
//  Created by 田中大誓 on 2022/03/30.
//

import UIKit
import Foundation
import CocoaMQTT


class sensorLog: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var textTime: UITextView!
    @IBOutlet var Text1: UITextView!
    @IBOutlet var Text2: UITextView!
    @IBOutlet var Text3: UITextView!
    @IBOutlet var Text4: UITextView!
    @IBOutlet var Text5: UITextView!
    @IBOutlet var Text6: UITextView!
    @IBOutlet var Text7: UITextView!
    @IBOutlet var Text8: UITextView!
    @IBOutlet var Text9: UITextView!
    
    @IBOutlet var logField: UITableView!
    
    @IBOutlet var nowLogView: UIView!
    
    @IBOutlet var deleteButton: UIBarButtonItem!
    @IBOutlet var addButton: UIBarButtonItem!
    
    //ユーザーデフォルトのインスタンス宣言
    let userDefaults = UserDefaults.standard
    //chatsという名前の空の配列
    var chats: [String] = []
    
    let sensorDefaults = UserDefaults.standard
    var sensorNum: [String] = []
    var sensorNumS: [[String]] = []
    
    let sumDefaults = UserDefaults.standard
    var sums: [String] = []
    var sumsList: [[String]] = []

    
    private var ClientID: String = ""
    private var topic: String = ""
    private var num: String = ""
    
    private var changedNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Feedbacker.impact(style: .rigid)

        setUpMQTT()
        nowLogView.layer.cornerRadius = 10
        //tableviewの線を消す
        //logField.tableFooterView = UIView()
        deleteButton.title = "edit"
        
        
        logField.allowsMultipleSelectionDuringEditing = true
        //アプリ起動時にtableViewを読み込む
        logField.register(UINib(nibName: "LogTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        //起動時にユーザーデフォルトを呼び出す
        if let arryTodoList = userDefaults.array(forKey: "todoList") as? [String] {
            chats.append(contentsOf: arryTodoList)
        }
        
        if let arryNumList = sensorDefaults.array(forKey: "sensorList") as? [[String]] {
            sensorNumS.append(contentsOf: arryNumList)
        }
        
        if let arraySumList = sumDefaults.array(forKey: "sumList") as? [[String]] {
            sumsList.append(contentsOf: arraySumList)
        }
        
        logField.delegate = self
        
        //現在時刻の表示
        Timer.scheduledTimer(timeInterval: 1, target: self,
                             selector: #selector(self.updateTime),
                             userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstNum = 0
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        firstNum = 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    var sum1: Int = 0
    var sum2: Int = 0
    var sum3: Int = 0
    var sum4: Int = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! LogTableViewCell
        //セルに表示
        
        //初期化用コード↓
        //resetAll()
        
        let chat = chats[indexPath.row]
        let text1 = sensorNumS[indexPath.row][0]
        let text2 = sensorNumS[indexPath.row][1]
        let text3 = sensorNumS[indexPath.row][2]
        let text4 = sensorNumS[indexPath.row][3]
        let text5 = sensorNumS[indexPath.row][4]
        let text6 = sensorNumS[indexPath.row][5]
        let text7 = sensorNumS[indexPath.row][6]
        let text8 = sensorNumS[indexPath.row][7]
        let text9 = sensorNumS[indexPath.row][8]
        
        
        sum1 = (Int(text1) ?? 0) + (Int(text2) ?? 0)
        sum2 = (Int(text3) ?? 0) + (Int(text4) ?? 0)
        sum3 = (Int(text5) ?? 0) + (Int(text6) ?? 0)
        sum4 = (Int(text7) ?? 0) + (Int(text8) ?? 0)
        
        if sum1 > 0 {
            cell.sumText1.backgroundColor = .orange
        } else if sum1 == 0 {
            cell.sumText1.backgroundColor = .systemGray5
        } else {
            cell.sumText1.backgroundColor = .cyan
        }
        
        if sum2 >= 0 {
            cell.sumText2.backgroundColor = .orange
        } else if sum2 == 0 {
            cell.sumText2.backgroundColor = .systemGray5
        } else {
            cell.sumText2.backgroundColor = .cyan
        }
        
        if sum3 >= 0 {
            cell.sumText3.backgroundColor = .orange
        } else if sum1 == 0 {
            cell.sumText3.backgroundColor = .systemGray5
        } else {
            cell.sumText3.backgroundColor = .cyan
        }
        
        if sum4 >= 0 {
            cell.sumText4.backgroundColor = .orange
        } else if sum4 == 0 {
            cell.sumText4.backgroundColor = .systemGray5
        } else {
            cell.sumText4.backgroundColor = .cyan
        }
        
//        if changedNum == 1 {
//            cell.label1.backgroundColor = .red
//        } else if changedNum == 2 {
//            cell.label2.backgroundColor = .red
//        } else if changedNum == 3 {
//            cell.label2.backgroundColor = .systemIndigo
//        } else if changedNum == 4 {
//            cell.label2.backgroundColor = .systemIndigo
//        } else if changedNum == 5 {
//            cell.label2.backgroundColor = .orange
//        } else if changedNum == 6 {
//            cell.label2.backgroundColor = .orange
//        } else if changedNum == 7 {
//            cell.label2.backgroundColor = .yellow
//        } else if changedNum == 8 {
//            cell.label2.backgroundColor = .yellow
//        } else if changedNum == 9 {
//            cell.label2.backgroundColor = .green
//        }

        
        cell.textView.text = chat
        cell.text1.text = text1
        cell.text2.text = text2
        cell.text3.text = text3
        cell.text4.text = text4
        cell.text5.text = text5
        cell.text6.text = text6
        cell.text7.text = text7
        cell.text8.text = text8
        cell.text9.text = text9
        cell.sumText1.text = String(sum1)
        cell.sumText2.text = String(sum2)
        cell.sumText3.text = String(sum3)
        cell.sumText4.text = String(sum4)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //logField.estimatedRowHeight = 10
        //return UITableView.automaticDimension
        return 200
    }
    
    //cellを削除するやつ
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            chats.remove(at: indexPath.row)
            userDefaults.set(chats, forKey: "todoList")
            
            sensorNumS.remove(at: indexPath.row)
            sensorDefaults.set(sensorNumS, forKey: "sensorList")
            
            sumsList.remove(at: indexPath.row)
            sumDefaults.set(sumsList, forKey: "sumList")
            
            logField.deleteRows(at: [indexPath], with: .fade)
            
            print("==Deleated at \(indexPath.row)")
            print(chats, sensorNumS, sumsList)
            print()
        }
    }
    
    @IBAction func save(_ sender: Any) {
        Feedbacker.impact(style: .rigid)
        saveTheLog()
    }
    
    private func saveTheLog() {
        self.chats.insert(textTime.text!, at: 0)
        self.sensorNum.insert(Text1.text!, at: 0)
        self.sensorNum.insert(Text2.text!, at: 1)
        self.sensorNum.insert(Text3.text!, at: 2)
        self.sensorNum.insert(Text4.text!, at: 3)
        self.sensorNum.insert(Text5.text!, at: 4)
        self.sensorNum.insert(Text6.text!, at: 5)
        self.sensorNum.insert(Text7.text!, at: 6)
        self.sensorNum.insert(Text8.text!, at: 7)
        self.sensorNum.insert(Text9.text!, at: 8)
        
        self.sums.insert(String(sum1), at: 0)
        self.sums.insert(String(sum2), at: 1)
        self.sums.insert(String(sum3), at: 2)
        self.sums.insert(String(sum4), at: 3)
        
        self.sensorNumS.insert(contentsOf: [sensorNum], at: 0)
        self.sumsList.insert(contentsOf: [sums], at: 0)
        self.logField.insertRows(at: [IndexPath(row: 0 , section: 0)], with: UITableView.RowAnimation.none)
        
        self.userDefaults.set(self.chats, forKey: "todoList")
        self.sensorDefaults.set(self.sensorNumS, forKey: "sensorList")
        self.sumDefaults.set(self.sumsList, forKey: "sumList")
        
        print("==Saved")
        print(chats, sensorNumS, sumsList)
        print()

        sensorNum = []
        sums = []
    }
    
    @objc private func updateTime() {
        let dt = Date()
        let dateFormatter = DateFormatter()
        
        // DateFormatter を使用して書式とロケールを指定する
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        self.textTime.text = dateFormatter.string(from: dt)
        
        firstNum += 1
        
    }
    
    @IBAction func hoge(_ sender: Any) {
        Feedbacker.impact(style: .heavy)
        logField.isEditing = true
        
        for row in 0..<chats.count {
            let indexPath = IndexPath(row: row, section: 0)
            logField.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        
        if deleteButton.title == "delete" {
            guard let selectedIndexPaths = self.logField.indexPathsForSelectedRows else { return }
            // 配列の要素削除で、indexの矛盾を防ぐため、降順にソートする
            let sortedIndexPaths =  selectedIndexPaths.sorted { $0.row > $1.row }
            for indexPathList in sortedIndexPaths {
                chats.remove(at: indexPathList.row) // 選択肢のindexPathから配列の要素を削除
                sensorNumS.remove(at: indexPathList.row)
                sumsList.removeAll()
                userDefaults.set(chats, forKey: "todoList")
                sensorDefaults.set(sensorNumS, forKey: "sensorList")
                sumDefaults.set(sumsList, forKey: "sumList")
            }
            logField.deleteRows(at: logField.indexPathsForSelectedRows!, with: UITableView.RowAnimation.automatic)
            logField.isEditing = false
        }
        
        deleteButton.title = "delete"
        
        if sensorNumS == [] {
            deleteButton.title = "edit"
            logField.isEditing = false
            
            print("==Deleated All")
            print(chats, sensorNumS, sumsList)
            print()
        }

    }
    
    private func resetAll() {
        chats.removeAll()
        sensorNum.removeAll()
        sensorNumS.removeAll()
        sums.removeAll()
        sumsList.removeAll()
        userDefaults.set(chats, forKey: "todoList")
        sensorDefaults.set(sensorNumS, forKey: "sensorList")
        sumDefaults.set(sumsList, forKey: "sumList")
    }
    
    
    var num1: String = "-"
    var num2: String = "-"
    var num3: String = "-"
    var num4: String = "-"
    var num5: String = "-"
    var num6: String = "-"
    var num7: String = "-"
    var num8: String = "-"
    var num9: String = "-"
    private var firstNum: Int = 0
    
    private func setUpMQTT() {
        let host = "54.165.233.114"
        
        ClientID = "mqtt1" + String(ProcessInfo().processIdentifier)
        let mqttSensor = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor.autoReconnect = false
        _ = mqttSensor.connect()
        mqttSensor.didConnectAck = { mqtt, ack in
            let topic = "topic/slibrary/enter"
            mqttSensor.subscribe(topic)
            mqttSensor.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text1.text = num
                if (num != self.num1 && self.firstNum > 1) {
                    self.changedNum = 1
                    self.saveTheLog()
                }
                self.num1 = num
            }
        }
        
        ClientID = "mqtt2" + String(ProcessInfo().processIdentifier)
        let mqttSensor2 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor2.autoReconnect = false
        _ = mqttSensor2.connect()
        mqttSensor2.didConnectAck = { mqtt, ack in
            let topic = "topic/slibrary/exit"
            mqttSensor2.subscribe(topic)
            mqttSensor2.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text2.text = num
                if (num != self.num2 && self.firstNum > 1) {
                    self.changedNum = 2
                    self.saveTheLog()
                }
                self.num2 = num
            }
        }
        
        ClientID = "mqtt3" + String(ProcessInfo().processIdentifier)
        let mqttSensor3 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor3.autoReconnect = false
        _ = mqttSensor3.connect()
        mqttSensor3.didConnectAck = { mqtt, ack in
            let topic = "topic/s311/west"
            mqttSensor3.subscribe(topic)
            mqttSensor3.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text3.text = num
                if (num != self.num3 && self.firstNum > 1) {
                    self.changedNum = 3
                    self.saveTheLog()
                }
                self.num3 = num
            }
        }
        
        ClientID = "mqtt4" + String(ProcessInfo().processIdentifier)
        let mqttSensor4 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor4.autoReconnect = false
        _ = mqttSensor4.connect()
        mqttSensor4.didConnectAck = { mqtt, ack in
            let topic = "topic/s311/east"
            mqttSensor4.subscribe(topic)
            mqttSensor4.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text4.text = num
                if (num != self.num4 && self.firstNum > 1) {
                    self.changedNum = 4
                    self.saveTheLog()
                }
                self.num4 = num
            }
        }
        
        ClientID = "mqtt5" + String(ProcessInfo().processIdentifier)
        let mqttSensor5 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor5.autoReconnect = false
        _ = mqttSensor5.connect()
        mqttSensor5.didConnectAck = { mqtt, ack in
            let topic = "topic/s312/west"
            mqttSensor5.subscribe(topic)
            mqttSensor5.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text5.text = num
                if (num != self.num5 && self.firstNum > 1) {
                    self.changedNum = 5
                    self.saveTheLog()
                }
                self.num5 = num
            }
        }
        
        ClientID = "mqtt6" + String(ProcessInfo().processIdentifier)
        let mqttSensor6 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor6.autoReconnect = false
        _ = mqttSensor6.connect()
        mqttSensor6.didConnectAck = { mqtt, ack in
            let topic = "topic/s312/east"
            mqttSensor6.subscribe(topic)
            mqttSensor6.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text6.text = num
                if (num != self.num6 && self.firstNum > 1) {
                    self.changedNum = 6
                    self.saveTheLog()
                }
                self.num6 = num
            }
        }
        
        ClientID = "mqtt7" + String(ProcessInfo().processIdentifier)
        let mqttSensor7 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor7.autoReconnect = false
        _ = mqttSensor7.connect()
        mqttSensor7.didConnectAck = { mqtt, ack in
            let topic = "topic/lsr/west"
            mqttSensor7.subscribe(topic)
            mqttSensor7.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text7.text = num
                if (num != self.num7 && self.firstNum > 1) {
                    self.changedNum = 7
                    self.saveTheLog()
                }
                self.num7 = num
            }
        }
        
        ClientID = "mqtt8" + String(ProcessInfo().processIdentifier)
        let mqttSensor8 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor8.autoReconnect = false
        _ = mqttSensor8.connect()
        mqttSensor8.didConnectAck = { mqtt, ack in
            let topic = "topic/lsr/east"
            mqttSensor8.subscribe(topic)
            mqttSensor8.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text8.text = num
                if (num != self.num8 && self.firstNum > 1) {
                    self.changedNum = 8
                    self.saveTheLog()
                }
                self.num8 = num
            }
        }
        
        ClientID = "mqtt9" + String(ProcessInfo().processIdentifier)
        let mqttSensor9 = CocoaMQTT(clientID: ClientID, host: host, port: 8883)
        mqttSensor9.autoReconnect = false
        _ = mqttSensor9.connect()
        mqttSensor9.didConnectAck = { mqtt, ack in
            let topic = "topic/s4s"
            mqttSensor9.subscribe(topic)
            mqttSensor9.didReceiveMessage = { mqtt, message, id in
                let num: String = message.string!
                self.Text9.text = num
                if (num != self.num9 && self.firstNum > 1) {
                    self.changedNum = 9
                    self.saveTheLog()
                }
                self.num9 = num
            }
        }
    }
    
}
