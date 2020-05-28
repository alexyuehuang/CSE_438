//
//  File.swift
//  Lab4
//
//  Created by 黄越 on 10/19/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import Foundation
import UIKit
import WebKit
class WebViewController: UIViewController, WKNavigationDelegate{
    var id: Int = 33
    var key: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if getkey(){
        let webview = WKWebView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height))
        webview.navigationDelegate = self
        var str = "https://www.youtube.com/watch?v="
        str += key
        print(str)
        let url = URL(string: str)!
        let myURLRequest = URLRequest(url: url)
        webview.load(myURLRequest)
        webview.allowsBackForwardNavigationGestures = true
        view.addSubview(webview)
        }
        else{
            let myLabel = UILabel(frame: CGRect(x: view.frame.midX-100, y: view.frame.midY-20, width: 200, height: 30))
            view.backgroundColor = UIColor.white
            myLabel.text = "this trailer is not available"
            myLabel.textColor = UIColor.black
            view.addSubview(myLabel)
        }
    }
    func getkey()->Bool{
        var cando = true
        var str = "https://api.themoviedb.org/3/movie/"
        str += "\(id)"
        str += "/videos?api_key=fc0afbf717b82f78804c0c619c29a099&language=en-US"
        print(id)
        do{
            let url = URL(string: str)
        let data = try Data(contentsOf: url!)
        let MyVideo = try JSONDecoder().decode(VideoResults.self, from: data)
            if !(MyVideo.results.count == 0){
                key = MyVideo.results[0].key
            }
            else{
                cando = false
            }
            
        }
        catch{
            cando = false
        }
        
        return cando
    }
}
