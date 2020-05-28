//
//  CircleView.swift
//  Lab_3
//
//  Created by 黄越 on 9/25/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import Foundation
import UIKit
class CircleView: UIView{
    var thisColor = UIColor.black
    var stroke = 10
    var thePoint:CGPoint? {
        didSet {
            setNeedsDisplay()
        }
    }
    var endPoint:CGPoint? {
        didSet {
            setNeedsDisplay()
        }
    }
    var myPath: [Path]?
    var path = UIBezierPath()
    var points:[CGPoint] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    func setColor(color: UIColor){
        thisColor = color
    }
    func setStroke(stro: Int){
        self.stroke = stro
    }
    func new(point: CGPoint, stroke: Int, color: UIColor){
        thePoint = point
        self.stroke = stroke
        thisColor = color
        points = []
    }
    func end(){
        var newPath = Path.init(path: path, stroke: stroke, color: thisColor)
        
            newPath.startPoint = thePoint
        newPath.endPoint = self.endPoint
        newPath.pointSet = self.points
        
        if myPath != nil{
            myPath?.append(newPath)
        }else{
            myPath = []
            myPath?.append(newPath)
        }
        endPoint = CGPoint(x: 1000, y: 1000)
        //print(myPath)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    func drawCircle(_ circle: Circle, color: UIColor) {
        color.setFill()
        let path = UIBezierPath()
        path.addArc(withCenter: circle.center, radius: circle.radius/2, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        path.fill()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func undo(){
        if myPath != nil {
            if !myPath!.isEmpty{
                myPath?.removeLast()
            }
        }
        
        self.path = UIBezierPath()
        points = []
        thePoint = CGPoint(x: 1000, y: 1000)
        endPoint = CGPoint(x: 1000, y: 1000)
    }
    func clear(){
        points = []
        path = UIBezierPath()
        myPath = []
        thePoint = CGPoint(x: 1000, y: 1000)
        endPoint = CGPoint(x: 1000, y: 1000)
    }
    func setStart(_start: CGPoint){
        thePoint = _start
    }
    func setEnd(_end: CGPoint){
        endPoint = _end
    }
    override func draw(_ rect: CGRect) {
        //UIColor.green.setFill()
//        if points.count == 1 {
//            drawCircle(Circle(cent: points[0], rad: CGFloat(stroke)), color: thisColor)
//        }
        path = createQuadPath(points: points)
//        if (thePoint != nil){
//            path.addArc(withCenter: thePoint!, radius: 20, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
//        }
        //path.fill()
        
        if let somePath = myPath{
            for thispath in somePath{
                thispath.color.setStroke()
                thispath.path.lineWidth = CGFloat(thispath.stroke)
                thispath.path.stroke()
                if let thePoint = thispath.startPoint{
                    drawCircle(Circle(cent: thePoint, rad: CGFloat(thispath.stroke)), color: thispath.color)
                }
                if let thePoint = thispath.endPoint{
                    drawCircle(Circle(cent: thePoint, rad: CGFloat(thispath.stroke)), color: thispath.color)
                }
//                if let thePoint = thispath.pointSet{
//                    for point in thePoint{
//                        drawCircle(Circle(cent: point, rad: CGFloat(thispath.stroke)), color: thispath.color)
//                    }
//                }
            }
        }
            thisColor.setStroke()
            path.lineWidth = CGFloat(stroke)
            path.stroke()
            if let aPoint = thePoint{
                drawCircle(Circle(cent: aPoint, rad: CGFloat(stroke)), color: thisColor)
            }
            if let aPoint = endPoint{
                drawCircle(Circle(cent: aPoint, rad: CGFloat(stroke)), color: thisColor)
            }
        
    }
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let x = (first.x+second.x)/2
        let y = (first.y+second.y)/2
        let pt = CGPoint.init(x: x, y: y)
        return pt
    }
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath() //Create the path object
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        if(points.count < 2){ //There are no points to add to this path
            return path
        }
        path.move(to: points[0]) //Start the path on the first point
        for i in 1..<points.count - 1{
            let firstMidpoint = midpoint(first: path.currentPoint, second:
                points[i]) //Get midpoint between the path's last point and the next one in
            //the array
            let secondMidpoint = midpoint(first: points[i], second:
                points[i+1]) //Get midpoint between the next point in the array and the one
            //after it
            path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint,
                          controlPoint2: points[i]) //This creates a cubic Bezier curve using math!
        }
        return path
    }

}
