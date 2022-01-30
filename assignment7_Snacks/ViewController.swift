//
//  ViewController.swift
//  assignment7_Snacks
//
//  Created by Li Tzu Lin on 2022-01-26.
//

import UIKit


class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in aTableView: UITableView) -> Int {
        return 1
    }
    var selectItem = [String]()
    
    
    func tableView(_ aTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectItem.count
    }
    func tableView(_ aTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = aTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = selectItem[indexPath.row]
        return cell
    }
 
    @IBOutlet var navBarHeight: NSLayoutConstraint!
    @IBOutlet var aTableView: UITableView!
    @IBOutlet var plusSign: UIButton!
    @IBOutlet var navBarView: UIView!
    var isPlusPressed = false
    let objects = ["Oreos", "Pizza Pockets", "Pop Tarts", "Popsicle", "Ramen"]
    @IBOutlet var showSnacksStackView: UIStackView!
    
    override func viewDidLoad() {
                super.viewDidLoad()
        aTableView.delegate = self
        aTableView.dataSource = self
        showSnacksStackView.isHidden = true
        let Image1 = UIImageView(image: UIImage(named: "oreos"))
        let Image2 = UIImageView(image: UIImage(named: "pizza_pockets"))
        let Image3 = UIImageView(image: UIImage(named: "pop_tarts"))
        let Image4 = UIImageView(image: UIImage(named: "popsicle"))
        let Image5 = UIImageView(image: UIImage(named: "ramen"))
        let sceneArray = [Image1, Image2, Image3, Image4, Image5]
        
        showSnacksStackView.axis = .horizontal
        showSnacksStackView.distribution = .fillEqually

        for i in 0..<sceneArray.count {
            sceneArray[i].isUserInteractionEnabled = true
             let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addItem(_:)))
            sceneArray[i].addGestureRecognizer(tapGestureRecognizer)
            sceneArray[i].tag = i
            showSnacksStackView.addArrangedSubview(sceneArray[i])
    
        }
    }
        @IBAction func plusButtonPressed(_ sender: UIButton) {
        print("plus icon pressed")
        heightChanged()
    }
    
    func heightChanged() {
    
    if isPlusPressed == false
      {
       UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 3, options:.curveEaseInOut, animations: {
          self.plusSign.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
          self.navBarHeight.constant = 200.0
          self.view.layoutIfNeeded()
          self.isPlusPressed = true})
          showSnacksStackView.isHidden = false
          
       } else {
       UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 3, options:.curveEaseInOut, animations: {
          self.plusSign.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
          self.navBarHeight.constant = 88.0
          self.view.layoutIfNeeded()
          self.isPlusPressed = false})
          showSnacksStackView.isHidden = true
    }
}
    
    @objc func addItem(_ sender: UITapGestureRecognizer) {
            if isPlusPressed {
                if let i = sender.view?.tag {
                    selectItem.append(objects[i])
                    let indexPath = IndexPath(row: selectItem.count - 1, section: 0)
                    aTableView.insertRows(at: [indexPath], with: .automatic)
                }
            }
        }
 
}

   
    
