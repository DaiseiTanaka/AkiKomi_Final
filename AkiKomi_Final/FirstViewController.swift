//
//  FirstViewController.swift
//  CollectionViewInsideTableViewExample
//
//  Created by 田中大誓 on 2021/10/04.
//  Copyright © 2021 John Codeos. All rights reserved.
//


import UIKit
import CLTypingLabel

class FirstViewController: UIViewController {
    
    var timer: Timer = Timer()
    
    @IBOutlet weak var mainLabel: CLTypingLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = "AkiKomi"
        mainLabel.charInterval = 1
        mainLabel.textAlignment = NSTextAlignment.center
        
        mainLabel.onTypingAnimationFinished = {
            self.performSegue(withIdentifier: "startSegue", sender: nil)
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
//            self.performSegue(withIdentifier: "startSegue", sender: nil)
//        }
    }
    
    private func setUp() {
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


