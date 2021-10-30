//
//  WhatIsAkiKomi.swift
//  AkiKomi_Final
//
//  Created by 田中大誓 on 2021/10/30.
//

import UIKit

class WhatIsAkiKomi: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func instagram(_ sender: Any) {
        let instagramHooks = "instagram://user?username=akikomi_official"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
            UIApplication.shared.openURL(instagramUrl! as URL)
        } else {
          //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.openURL(NSURL(string: "http://instagram.com/")! as URL)
            print("Can not find the account")
        }
    }

}
