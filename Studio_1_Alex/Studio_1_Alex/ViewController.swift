//
//  ViewController.swift
//  Studio_1_Alex
//
//  Created by 黄越 on 9/4/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBOutlet weak var theSlider: UISlider!
    @IBAction func theSlider(_ sender: Any) {
        image1.alpha=CGFloat(theSlider.value);
    }
//    @IBAction func sliderValue(_sender:Any){
//        image1.alpha=CGFloat(theSlider.value);
//    }
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var schoolName: UILabel!
}

