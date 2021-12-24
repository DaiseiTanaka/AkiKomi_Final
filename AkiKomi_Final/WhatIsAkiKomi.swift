//
//  WhatIsAkiKomi.swift
//  AkiKomi_Final
//
//  Created by 田中大誓 on 2021/10/30.
//

import UIKit

class WhatIsAkiKomi: UIViewController {
    
    @IBOutlet var missionStatement: UITextView!
    
    @IBOutlet var scrollViewWidth: NSLayoutConstraint!
    @IBOutlet var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet var stackViewWidth: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        Feedbacker.impact(style: .heavy)
        let scrollWidth = scrollViewWidth.constant
        stackViewWidth.constant = scrollWidth * 4.7
        //scrollViewHeight.constant = scrollViewWidth.constant * 0.575
    }
    
    override func viewDidAppear(_ animated: Bool ) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func instagram(_ sender: Any) {
        let instagramHooks = "instagram://user?username=kuas.official_akikomi"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.openURL(instagramUrl! as URL)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.openURL(NSURL(string: "http://instagram.com/")! as URL)
            print("Can not find the account")
        }
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        if (sender as AnyObject).isOn == true {    //sender.isOnのみに省略可能
            missionStatement.text = "   Coronavirus has changed our lives dramatically over a very short period of time. It forces people to stay apart and keep certain distance from each other. People are encouraged to avoid 3Cs-closed space, crowded place, and close contact. In universities and workplaces, rooms are only allowed to be occupied by up to 50% of their capacities. Nevertheless, there are often many rooms in an organization, making it extremely difficult for people to keep tracking the vacancies of all rooms by themselves. For example, the Kyoto University of Advanced Science (KUAS) holds at least 70 rooms in regular use. As a result, students may have to spend a lot of time searching for available study rooms on campus. Similar problem also exists in workplaces where office workers may have to waste time to look for available meeting rooms.\n   Our mission at AkiKomi is to provide quick and reliable data of room occupancy to everyone by exploiting our sensors and mobile application. We are aiming not only to support elimination strategy of prevalent global epidemic but prevention of forthcoming epidemic.       We believe this mission is indispensable because epidemic is hardly predictable, and its threat is formidable. Utilizing our technology enable us to handle them instantaneously and has potential to become a powerful tool for saving people’s lives.      We will continue to develop our technology to provide comfortable environment and improve the sense of safety in people’s daily life."
        } else {
            missionStatement.text = "   コロナウイルスは、非常に短い期間で私たちの生活を劇的に変えました。今日人々は混雑した場所や密接な接触を避けることが奨励されています。大学や職場では、密を避けるため密室内には収容人数の最大50％までしか占有できません。しかしながら、組織内には多くの部屋があり、管理者が自分ですべての部屋の空室を追跡し、管理し続けることは非常に困難です。たとえば、京都先端科学大学（KUAS）には、少なくとも70室の常用室があり、学生はキャンパスで利用可能な、混んでいない研究室または会議室を探すのに多くの時間を費やさなければならないかもしれません。同様に、オフィスワーカーが利用可能な会議室を探すために時間を無駄にしなければならない可能性がある職場も多く存在します。\n   AkiKomiプロジェクトの使命は、センサーとモバイルアプリケーションを活用して、部屋の占有状況に関する迅速で信頼性の高いデータをすべての人に提供することです。私たちは、蔓延している世界的パンデミックの撲滅戦略を支援するだけでなく、今後のパンデミックの防止も目指しています。今回の新型コロナウイルスのような非常事態はほとんど予測できず、その脅威は恐ろしいものであるため、この使命は不可欠であると私たちは信じています。私たちの技術を活用することで、それらを瞬時に処理することができ、人々の命を救うための強力なツールになります。\n   今後も快適な環境を提供し、人々の日常の安心感を高める技術を開発していきます。"
        }
    }
}
