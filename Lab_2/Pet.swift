//
//  Pet.swift
//  Lab_2
//
//  Created by 黄越 on 9/15/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import Foundation
class Pet{
    enum Kind{
        case dog
        case bird
        case cat
        case fish
        case rabbit
    }
    private (set) var food:Int = 0
    var happy:Int = 0
    var name: Kind?
    var fedNum:Int = 0
    var playNum: Int = 0
    func feed(){
        if(food<10){
            food += 1
            fedNum += 1
        }
    }
    func getFood()->Int{
        return food;
    }
    func getHap()->Int{
        return happy;
    }
    func play(){
        if(food>1){
            happy += 1
            playNum += 1
            food -= 1
        }
    }
    init (a: Kind){
        self.name=a
    }
}
