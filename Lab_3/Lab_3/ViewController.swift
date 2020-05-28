//
//  ViewController.swift
//  Lab_3
//
//  Created by 黄越 on 9/25/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var circleCanvas: CircleView!
    var currentCircle: Circle?
    var touchPoint = CGPoint.zero
    var stroke = 10
    var colorLine = UIColor.red
    var frame = CGRect()
    var x = 0
    
    @IBOutlet var viewImage: UIImageView!
    //the following function gets the idea from youtube "The Swift guy"
   

    
    @IBAction func Import(_ sender: Any) {
        viewImage.frame = CGRect(x: 0, y: 120, width: 500, height: 600)
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            viewImage.image = image
        }
        else{
            //error message
        }
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Export(_ sender: Any) {
        screenShotMethod()
    }
    @IBOutlet var indicator: UIButton!
    @IBOutlet var Red: UIButton!
    @IBOutlet var Green: UIButton!
    @IBAction func Red(_ sender: Any) {
        colorLine = UIColor.red
        circleCanvas.setColor(color: UIColor.red)
        indicator.frame = CGRect(x: 40, y: 880, width: 10, height: 10)
    }
    @IBAction func Green(_ sender: Any) {
        colorLine = UIColor.green
        circleCanvas.setColor(color: UIColor.green)
        indicator.frame = CGRect(x: 40+55*3, y: 880, width: 10, height: 10)
    }
    @IBAction func Yellow(_ sender: Any) {
        colorLine = UIColor.yellow
        circleCanvas.setColor(color: UIColor.yellow)
        indicator.frame = CGRect(x: 40+55*2, y: 880, width: 10, height: 10)
    }
    @IBAction func Blue(_ sender: Any) {
        colorLine = UIColor.blue
        circleCanvas.setColor(color: UIColor.blue)
        indicator.frame = CGRect(x: 40+55*4, y: 880, width: 10, height: 10)
    }
    @IBAction func Purple(_ sender: Any) {
        colorLine = UIColor.purple
        circleCanvas.setColor(color: UIColor.purple)
        indicator.frame = CGRect(x: 40+55*5, y: 880, width: 10, height: 10)
    }
    @IBAction func Pink(_ sender: Any) {
        colorLine = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        circleCanvas.setColor(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        indicator.frame = CGRect(x: 40+55*6, y: 880, width: 10, height: 10)
    }
    @IBAction func Orange(_ sender: Any) {
        colorLine = UIColor.orange
        circleCanvas.setColor(color: UIColor.orange)
        indicator.frame = CGRect(x: 40+55*1, y: 880, width: 10, height: 10)
    }
    
    @IBAction func TheSlider(_ sender: UISlider) {
        stroke = (Int(sender.value)/5)+10
        circleCanvas.setStroke(stro: stroke)
    }
    
    @IBOutlet var Yellow: UIButton!
    @IBOutlet var Blue: UIButton!
    @IBOutlet var Orange: UIButton!
    @IBOutlet var Purple: UIButton!
    @IBOutlet var Pink: UIButton!
    func createButton(abc: UIButton!, color: UIColor, num: Int){
        x = 20+(num-1)*55
        abc.setTitle("", for: .normal)
        abc.frame = CGRect(x: x, y: 820, width: 50, height: 50)
        abc.layer.cornerRadius = 0.5 * abc.bounds.size.width
        abc.clipsToBounds = true
        abc.layer.backgroundColor = color.cgColor
    }
    func changePoints(original: CGPoint)-> CGPoint{
        let newPoint = CGPoint(x: original.x, y: original.y-120)
        return newPoint
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        viewImage.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        frame = CGRect(x: 0, y: 120, width: view.frame.width, height: 700)
        circleCanvas = CircleView(frame: frame)
        indicator.setTitle("", for: .normal)
        indicator.frame = CGRect(x: 40, y: 880, width: 10, height: 10)
        indicator.layer.cornerRadius = 0.5 * indicator.bounds.size.width
        indicator.clipsToBounds = true
        indicator.layer.backgroundColor = UIColor.gray.cgColor
        createButton(abc: Red, color: UIColor.red, num: 1)
        createButton(abc: Green, color: UIColor.green, num: 4)
        createButton(abc: Yellow, color: UIColor.yellow, num: 3)
        createButton(abc: Blue, color: UIColor.blue, num: 5)
        createButton(abc: Purple, color: UIColor.purple, num: 6)
        createButton(abc: Pink, color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), num: 7)
        createButton(abc: Orange, color: UIColor.orange, num: 2)
        view.addSubview(circleCanvas)
    }
    @IBAction func clear(_ sender: Any) {
        circleCanvas.clear()
    }
    
    @IBAction func undo(_ sender: Any) {
        circleCanvas.undo()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoint = changePoints(original:(touches.first)!.location(in: view) as CGPoint)
        //print("point is \(touchPoint)")
        circleCanvas.new(point: touchPoint, stroke: stroke, color: colorLine)
        circleCanvas.points.append(touchPoint)
        circleCanvas.setStart(_start: touchPoint)
        //circleCanvas.thePoint = touchPoint
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        //print(touchPoint)
        self.touchPoint = changePoints(original: touchPoint)
        circleCanvas.points.append(self.touchPoint)
        //print (touchPoint ?? "no point")
        //print(circleCanvas.points)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoint = changePoints(original:(touches.first)!.location(in: view) as CGPoint)
        circleCanvas.setEnd(_end: touchPoint)
        circleCanvas.end()
    }
    //reference: from stackoverflow
    func screenShotMethod() {
        //Create the UIImage
        UIGraphicsBeginImageContext(circleCanvas.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
}

