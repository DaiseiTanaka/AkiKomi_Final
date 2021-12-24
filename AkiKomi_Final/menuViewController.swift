//
//  menuViewController.swift
//  CollectionViewInsideTableViewExample
//
//  Created by 田中大誓 on 2021/10/07.
//  Copyright © 2021 John Codeos. All rights reserved.
//

import UIKit
import Foundation

class menuViewController: UIViewController {
    
    @IBOutlet var menuView: UIView!
    
    @IBOutlet var akikomiWebView: UIView!
    @IBOutlet var kuasWebView: UIView!
    
    @IBOutlet var akikomiImage1: UIImageView!
    @IBOutlet var kuasImage1: UIImageView!
    
    @IBOutlet var webbutton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Feedbacker.impact(style: .medium)

        setUp()
        
    }
    
    @IBAction func tappWeb(_ sender: Any) {
        let url = URL(string: "https://dtnk4448.wixsite.com/akikomi")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    private func setUp() {
        akikomiWebView.layer.cornerRadius = 10
        kuasWebView.layer.cornerRadius = 10
        akikomiImage1.layer.cornerRadius = 10
        kuasImage1.layer.cornerRadius = 10
    }
    
    @IBAction func seeKUASWeb(_ sender: Any) {
        let url = URL(string: "https://www.kuas.ac.jp/")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // メニューの位置を取得する
        let menuPos = self.menuView.layer.position
        // 初期位置を画面の外側にするため、メニューの幅の分だけマイナスする
        self.menuView.layer.position.x = -self.menuView.frame.width
        // 表示時のアニメーションを作成する
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.menuView.layer.position.x = menuPos.x
        },
            completion: { bool in
        })
        
    }

    // メニューエリア以外タップ時の処理
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            if touch.view?.tag == 1 {
                UIView.animate(
                    withDuration: 0.2,
                    delay: 0,
                    options: .curveEaseIn,
                    animations: {
                        self.menuView.layer.position.x = -self.menuView.frame.width
                },
                    completion: { bool in
                        self.dismiss(animated: true, completion: nil)
                }
                )
            }
        }
    }
}

