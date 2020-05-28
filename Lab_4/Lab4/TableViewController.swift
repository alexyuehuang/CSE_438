//
//  TableViewController.swift
//  Lab4
//
//  Created by 黄越 on 10/14/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import UIKit

class TableViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {

    var theData: [String]=[]{
        didSet{
            setupTableview()
        }
    }
    var dict:AnyObject! {
        didSet{
            setupTableview()
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let thename = theData[indexPath.row]
            let path = Bundle.main.path(forResource: "Data", ofType: "plist")
            let movieDictionary = NSMutableDictionary(contentsOfFile: path!)
            let NamesArray = movieDictionary?.object(forKey: "MyArray") as! NSMutableArray
            if NamesArray.contains(thename){
                NamesArray.remove(thename)
            }
            movieDictionary?.write(toFile: path!, atomically: true)
            self.theData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBOutlet var tableview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default, reuseIdentifier: "mycell")
        cell.textLabel!.text = theData[indexPath.row]
        return cell
    }
    func setupTableview(){
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "mycell")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "Data", ofType: "plist")
        dict = NSDictionary(contentsOfFile: path!)!
        theData = dict!.object(forKey: "MyArray")as! Array<String>
        setupTableview()
    }
    override func viewWillAppear(_ animated: Bool) {
        let path = Bundle.main.path(forResource: "Data", ofType: "plist")
        dict = NSDictionary(contentsOfFile: path!)!
        theData = dict!.object(forKey: "MyArray")as! Array<String>
        tableview.reloadData()
    }


}
