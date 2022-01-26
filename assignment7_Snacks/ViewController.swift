//
//  ViewController.swift
//  assignment7_Snacks
//
//  Created by Li Tzu Lin on 2022-01-26.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var heightChange: NSLayoutConstraint!
    @IBOutlet var navBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func plusPressed(_ sender: UIButton) {
        print("plus icon pressed")
        heightChange.constant = 200.0
       
    }
}
    
