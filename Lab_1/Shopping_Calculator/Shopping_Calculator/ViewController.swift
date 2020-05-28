//
//  ViewController.swift
//  Shopping_Calculator
//
//  Created by 黄越 on 9/4/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var taxState: [Double]=[Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Missouri", "Illinois", "Kansas"]
        taxState=[11.5, 12.1, 10.4]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var Original: UITextField!
    @IBOutlet weak var Discunt: UITextField!
    @IBOutlet weak var Tax: UITextField!
   
    @IBOutlet weak var final: UITextField!
    
    @IBAction func price_calculate(_ sender: Any) {
        var c=0
        var b=0.0
        if Double(Original.text!) != nil{
            b=Double(Original.text!)!
        }
        else{
            c=1
        }
        var d=0.0
        if Double(Discunt.text!) != nil{
            d=Double(Discunt.text!)!
        }
        if Int(Discunt.text!) == nil{
            c=1
        }
        var f=0.0
        if Double(Tax.text!) != nil{
            f=Double(Tax.text!)!
        }
        else{
            c=1
        }
        if c==1{
            final.text="Only accept number inputs"
        }
        else if b==0{
            final.text="Zero price is not allowed"
        }
        else if b<0||d<0||f<0{
            final.text="negative price/tax/discount is not allowed"
        }
        else if b>10000 {
            final.text="Price to big. Don't buy it"
        }
        else{
        let displayText = "$\(String(format: "%.2f", (b*((100-d)/100)*((100+f)/100))))"
        final.text=displayText
        }
    
    }
   
    
    
    
}
