//
//  ViewController.swift
//  Lab_2
//
//  Created by 黄越 on 9/14/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    var dog = Pet(a: .dog)
    var cat = Pet(a: .cat)
    var fish = Pet(a: .fish)
    var bird = Pet(a: .bird)
    var bunny = Pet(a: .rabbit)
    var current: Pet!
    //var dogSound: AVAudioPlayer?

    @IBOutlet weak var hLevel: DisplayView!
    @IBOutlet weak var fLevel: DisplayView!
    @IBOutlet weak var fedTimes: UILabel!
    @IBOutlet weak var playedTimes: UILabel!
    
    @IBOutlet var img1: UIImageView!
    @IBOutlet weak var photo: UIView!
    
    
    @IBAction func dogB(_ sender: Any) {
        playAudio(namePlay: "Dog")
            self.photo.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            self.img1.image = UIImage(named: "Dog")
        self.hLevel.color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.fLevel.color = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            self.current = self.dog
        updateValue()
    }
    
    @IBAction func catB(_ sender: Any) {
        playAudio(namePlay: "Cat")
        self.photo.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        self.hLevel.color = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        self.fLevel.color = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        self.img1.image = UIImage(named: "Cat")
        self.current = self.cat
        updateValue()
    }
    
    @IBAction func bunnyB(_ sender: Any) {
        playAudio(namePlay: "Bunny")
        self.photo.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.hLevel.color = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.fLevel.color = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.img1.image = UIImage(named: "Rabbit")
        self.current = self.bunny
        updateValue()
    }
           var player = AVAudioPlayer()
    @IBAction func fishB(_ sender: Any) {
        playAudio(namePlay: "Fish")
        self.photo.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.hLevel.color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.fLevel.color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        self.img1.image = UIImage(named: "Fish")
        self.current = self.fish
        updateValue()
    }
    @IBAction func birdB(_ sender: Any) {
        playAudio(namePlay: "Bird")
        self.photo.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.hLevel.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.fLevel.color = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        self.img1.image = UIImage(named: "Bird")
        self.current = self.bird
        updateValue()
    }
    @IBAction func food(_ sender: Any) {
        current!.feed()
        updateValue()
        
    }
    func updateValue(){
        playedTimes.text="Played: "+(String)(current.playNum)
        fedTimes.text="Fed: "+(String)(current.fedNum)
        hLevel.animateValue(to: CGFloat(Double(current!.getHap())/10.0))
        fLevel.animateValue(to: (CGFloat)(Double(current!.getFood())/10.0))
    }
    
    
    @IBAction func play(_ sender: Any) {
        current!.play()
        updateValue()
    }
    func playAudio(namePlay: String){
        let url = Bundle.main.url(forResource: namePlay, withExtension: "mp3")!
        
        do{
            player =  try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
            //print("work")
        }catch {
            //print ("error")
        }
        player.numberOfLoops = 1
        player.prepareToPlay()
        player.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        current = self.dog
        playAudio(namePlay: "Dog")
            //print(theFood)
        hLevel.color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.current = dog
        hLevel.animateValue(to: CGFloat(0))
        photo.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        self.img1.image = UIImage(named: "Dog")
        fLevel.color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        fLevel.animateValue(to: CGFloat(0))
        
        
    }

    
   
    
}

