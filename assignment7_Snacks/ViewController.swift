//
//  ViewController.swift
//  assignment7_Snacks
//
//  Created by Li Tzu Lin on 2022-01-26.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet var plussign: UIButton!
    
    @IBOutlet var heightChange: NSLayoutConstraint!
    @IBOutlet var navBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func plusPressed(_ sender: UIButton) {
        print("plus icon pressed")
        //heightChange.constant = 200.0
        heightChanged()
        plussign.tintColor = .systemBlue
        plussign.transform = .init(rotationAngle: 90.0)
        
        
        }
    
  func heightChanged() {

        navBarView = UIView(frame: .init(x: 0, y: 44, width: 414 , height: 88))

       view.addSubview(navBarView)
    

      UIView.animate(withDuration: 3.0, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 3) { [self] in

          self.navBarView.bounds = CGRect(x: 0, y: 44, width: 414, height: 200)
          self.navBarView.backgroundColor = UIColor(red: 0.8667, green: 0.8667, blue: 0.8667, alpha: 1.0)
          //self.navBarView.backgroundColor = .blue


        }
    }
   
   
}

    
