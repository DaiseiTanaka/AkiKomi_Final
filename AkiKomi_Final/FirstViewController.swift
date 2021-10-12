//
//  FirstViewController.swift
//  CollectionViewInsideTableViewExample
//
//  Created by 田中大誓 on 2021/10/04.
//  Copyright © 2021 John Codeos. All rights reserved.
//


import UIKit

class FirstViewController: UIViewController {
    
    var timer: Timer = Timer()
    
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.overrideUserInterfaceStyle = .dark
        
        gradation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.performSegue(withIdentifier: "startSegue", sender: nil)
        }
        
    }
    
    private func gradation(){
        // create a view with size 400 x 400
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))

        // Create a gradient layer
        let gradient = CAGradientLayer()

        // gradient colors in order which they will visually appear
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]

        // Gradient from left to right
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)

        // set the gradient layer to the same size as the view
        gradient.frame = view.bounds
        // add the gradient layer to the views layer for rendering
        view.layer.addSublayer(gradient)
        
        
        // Create a label and add it as a subview
        let label = UILabel(frame: view.bounds)
        label.text = "Hello World"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        view.addSubview(label)

        // Tha magic! Set the label as the views mask
        view.mask = label
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


