//
//  Circle.swift
//  Lab_3
//
//  Created by 黄越 on 9/26/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import Foundation
import UIKit

struct Circle {
    var center: CGPoint
    var radius: CGFloat
    init(cent:CGPoint, rad: CGFloat){
        center = cent
        radius = rad
    }
}
struct Path{
    init(path: UIBezierPath, stroke: Int, color: UIColor) {
        self.path = path
        self.stroke = stroke
        self.color = color
    }
    var pointSet: [CGPoint]?
    var startPoint: CGPoint?
    var endPoint: CGPoint?
    var path: UIBezierPath
    var stroke: Int
    var color: UIColor
}
