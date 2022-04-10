//
//  LogTableViewCell.swift
//  AkiKomi_Final
//
//  Created by 田中大誓 on 2022/03/31.
//

import UIKit

class LogTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet var text1: UITextView!
    @IBOutlet var text2: UITextView!
    @IBOutlet var text3: UITextView!
    @IBOutlet var text4: UITextView!
    @IBOutlet var text5: UITextView!
    @IBOutlet var text6: UITextView!
    @IBOutlet var text7: UITextView!
    @IBOutlet var text8: UITextView!
    @IBOutlet var text9: UITextView!
    
    @IBOutlet var sumText1: UITextView!
    @IBOutlet var sumText2: UITextView!
    @IBOutlet var sumText3: UITextView!
    @IBOutlet var sumText4: UITextView!
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        text1.text = "-"
        text2.text = "-"
        text3.text = "-"
        text4.text = "-"
        text5.text = "-"
        text6.text = "-"
        text7.text = "-"
        text8.text = "-"
        text9.text = "-"
        
//        label1.backgroundColor = .systemBackground
//        label2.backgroundColor = .systemBackground
//        label3.backgroundColor = .systemBackground
//        label4.backgroundColor = .systemBackground
//        label5.backgroundColor = .systemBackground
        
    }
    
}
