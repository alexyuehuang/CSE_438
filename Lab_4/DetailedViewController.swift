//
//  DetailedViewController.swift
//  Lab4
//
//  Created by 黄越 on 10/15/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var favorites: [String] = []
    var posterPath: String = ""
    var image = UIImage(named: "Movie")
    var name: String = ""
    var id: Int = 0
    var dateRelease: String!
    var score: Double!
    var overview: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        loadImage()
        let theImageFrame = CGRect(x: 0, y: 120, width: view.frame.width, height: 300)
        let ImageView = UIImageView(frame: theImageFrame)
        ImageView.image = image
        ImageView.contentMode = .scaleAspectFit
        view.addSubview(ImageView)
        let theTextFrame = CGRect(x: 0, y: 520, width: view.frame.width, height: 30)
        let textView = UILabel(frame: theTextFrame)
        textView.text = "Released: \(dateRelease ?? "not recorded")"
        textView.textAlignment = .center
        view.addSubview(textView)
        self.navigationItem.title = name
        let theTextFrame2 = CGRect(x: 0, y: 570, width: view.frame.width, height: 30)
        let textView2 = UILabel(frame: theTextFrame2)
        textView2.text = "Rating: \(score ?? 0)"
        textView2.textAlignment = .center
        view.addSubview(textView2)
        let theTextFrame3 = CGRect(x: 0, y: 600, width: view.frame.width, height: 120)
        let textView3 = UILabel(frame: theTextFrame3)
        textView3.lineBreakMode = .byWordWrapping
        textView3.numberOfLines = 0
        textView3.text = "Overview: \(overview ?? "not available")"
        textView3.textAlignment = .center
        view.addSubview(textView3)
        let theTextFrame4 = CGRect(x: view.frame.midX-50, y: 730, width: 100, height: 30)
        let theButton = UIButton(frame: theTextFrame4)
        theButton.setTitle ("Like!", for: .normal)
        theButton.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        theButton.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(theButton)
        newVideo()
    }
    func newVideo(){
        let newButton = UIButton(frame: CGRect(x: view.frame.midX-50, y: 450, width: 100, height: 30))
        newButton.setTitle("See Trailer", for: .normal)
        newButton.addTarget(self, action:#selector(self.seeVideo), for: .touchUpInside)
        newButton.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(newButton)
    }
    func loadImage(){
        var str1 = "https://image.tmdb.org/t/p/w500"
        str1 += posterPath
        let url = URL(string: str1)
        if let data = try? Data(contentsOf:url!){
            image = UIImage(data: data)
        }else{
            image = UIImage(named: "Movie")
        }
        if image == nil{
            image = UIImage(named: "Movie")
        }
    }
    @objc func seeVideo(){
        let videoVC = WebViewController()
        videoVC.id = id
        navigationController?.pushViewController(videoVC, animated: true)
    }
    @objc func buttonClicked(){
        
        let path = Bundle.main.path(forResource: "Data", ofType: "plist")
        let movieDictionary = NSMutableDictionary(contentsOfFile: path!)
        let NamesArray = movieDictionary?.object(forKey: "MyArray") as! NSMutableArray
        if !NamesArray.contains(name){
        NamesArray.add(name)
        }
        movieDictionary?.write(toFile: path!, atomically: true)
        
    }
  

}
