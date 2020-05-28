//
//  ViewController.swift
//  Lab4
//
//  Created by 黄越 on 10/14/19.
//  Copyright © 2019 黄越. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate, UIAlertViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var myPicker2: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == myPicker{
        return pickerData1.count
        }else{
        return pickerData2.count
        }
    }
    var index1:Int = 0
    var index2:Int = 0
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if !theSpinner.isAnimating{
        if pickerView == myPicker{
            if row == 0{
                isFilter = false
                index1 = 0
            }
            if row == 1{
                isFilter = true
                index1 = 1
            }
            if row == 2{
                isFilter = true
                index1 = 2
            }
            if row == 3{
                isFilter = true
                index1 = 3
            }
        }
        if pickerView == myPicker2{
        if row == 0{
            isFilter2 = false
            index2 = 0
        }
        if row == 1{
            isFilter2 = true
            index2 = 1
        }
        if (row == 2){
            isFilter2 = true
            index2 = 2
        }
            if (row == 3){
                isFilter2 = true
                index2 = 3
            }
            }
            if (index1 == 0)&&(index2 == 0){
                DispatchQueue.global().async {
                    self.myMovies = self.popular.results
                    self.theImages = self.popularImages
                }
                movieCollection.reloadData()
            }else{
                var str1 = ""
                var str2 = ""
                print(index1)
                if(index1 == 1){
                    str1 = "fr"
                }
                if(index1 == 2){
                    str1 = "de"
                }
                if(index1 == 3){
                    str1 = "es"
                }
                if(index2 != 0){
                    str2 = pickerData2[index2]
                }
                if (str1 == ""){
                    var str = "https://api.themoviedb.org/3/discover/movie?api_key=fc0afbf717b82f78804c0c619c29a099&sort_by=popularity.desc&page=1&year="
                    str += str2
                    theSpinner.startAnimating()
                    print("done0")
                    DispatchQueue.global(qos:.userInitiated).async {
                        let url = URL(string: str)
                        let data = try! Data(contentsOf: url!)
                        let filter = try! JSONDecoder().decode(APIResults.self, from: data)
                        self.myMovies = filter.results
                        self.cacheImage()
                        print("done1")
                    
                    DispatchQueue.main.async {
                        print(self.myMovies)
                    print("start")
                    self.movieCollection.reloadData()
                    print("Done2")
                    self.theSpinner.stopAnimating()
                    }
                    }
                }
                if (str2 == ""){
                    var str = "https://api.themoviedb.org/3/discover/movie?api_key=fc0afbf717b82f78804c0c619c29a099&sort_by=popularity.desc&page=1&language="
                    str += str1
                    theSpinner.startAnimating()
                    DispatchQueue.global().async {
                        let url = URL(string: str)
                        let data = try! Data(contentsOf: url!)
                        let filter = try! JSONDecoder().decode(APIResults.self, from: data)
                        self.myMovies = filter.results
                        self.cacheImage()
                    
                    DispatchQueue.main.async {
                        self.movieCollection.reloadData()
                        self.theSpinner.stopAnimating()
                    }
                    }
                }
                if (str2 != "")&&(str1 != ""){
                    var str = "https://api.themoviedb.org/3/discover/movie?api_key=fc0afbf717b82f78804c0c619c29a099&sort_by=popularity.desc&page=1&language="
                    str += str1
                    str += "&year="
                    str += str2
                    theSpinner.startAnimating()
                    DispatchQueue.global().async {
                        let url = URL(string: str)
                        let data = try! Data(contentsOf: url!)
                        let filter = try! JSONDecoder().decode(APIResults.self, from: data)
                        self.myMovies = filter.results
                        self.cacheImage()
                        DispatchQueue.main.async {
                            self.movieCollection.reloadData()
                        
                            self.theSpinner.stopAnimating()
                        }
                    }
                }
            }
    }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == myPicker{
        return pickerData1[row]
        }
        else{
        return pickerData2[row]
        }
    }
    var isWorking = false
    var isFilter = false
    var isFilter2 = false
    var searching = false
    let pickerData1 = ["","French", "German", "Spanish"]
    let pickerData2 = ["", "2018", "2017", "2016"]
    var myMovies: [Movie] = []
    var theImages: [UIImage] = []
    var popularImages: [UIImage] = []
    var searchImages: [UIImage] = []
    var results: APIResults = APIResults(page: 0, total_results: 0, total_pages: 0, results: [])
    var popular: APIResults = APIResults(page: 0, total_results: 0, total_pages: 0, results: [])
   
    @IBOutlet var theSpinner: UIActivityIndicatorView!
    @IBAction func Cinema(_ sender: Any) {
        let mapView = MapViewController()
        navigationController?.pushViewController(mapView, animated: true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if theSpinner.isAnimating{
            print("sleep")
            sleep(UInt32(1))
        }
        if theSpinner.isAnimating{
            print("sleep")
            sleep(UInt32(1))
        }
        
        if (searchBar.text == nil) || (searchBar.text == ""){
            searching = false
            view.endEditing(true)
            movieCollection.reloadData()
        }
        else{
            theSpinner.startAnimating()
            DispatchQueue.global().async {
        var str1 = "https://api.themoviedb.org/3/search/movie?api_key=fc0afbf717b82f78804c0c619c29a099&query="
        var str2 = searchText.replacingOccurrences(of: " ", with: "+")
            while str2.last! == "+"{
                str2.remove(at:str2.index(before: str2.endIndex))
            }
            str1 += str2
                self.searching = true
            let url = URL(string: str1)
        var data: Data?
            do{
                data = try Data(contentsOf: url!)
            }
            catch{
        }
            do{
                self.results = try JSONDecoder().decode(APIResults.self, from: data!)
            }
            catch{
                }
                self.myMovies = self.results.results
                self.cacheSearchImage()
            
            DispatchQueue.main.async {
            self.theImages = self.searchImages
            self.movieCollection.reloadData()
                self.theSpinner.stopAnimating()
            }
            }
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myMovies.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath)
        if (!searching)&&(!isFilter)&&(!isFilter2){
            myMovies = popular.results
            theImages = popularImages
        }
        if (theImages.count != 0)&&(myMovies.count != 0) && !theSpinner.isAnimating{
        let rect = CGRect(x: 0, y: 0, width: cell.frame.width, height: 120)
        let imageView = UIImageView(frame: rect)
        imageView.backgroundColor = UIColor.white
        cell.addSubview(imageView)
        imageView.image = theImages[indexPath.row]
        let rect2 = CGRect(x: 0, y: 70, width: cell.frame.width, height: 50)
        let text = UILabel(frame: rect2)
        text.lineBreakMode = .byWordWrapping
        text.numberOfLines = 2
        text.textAlignment = .center
        cell.addSubview(text)
        text.text = myMovies[indexPath.row].title
        text.backgroundColor = UIColor.white
        text.alpha = 0.7
        text.textAlignment = NSTextAlignment.center
        }
        return cell
    }
    
    
    @IBOutlet var movieCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.theSpinner.center = CGPoint(x: view.frame.midX, y: 230)
        self.theSpinner.hidesWhenStopped = true
        self.view.addSubview(self.theSpinner)
        self.theSpinner.startAnimating()
        DispatchQueue.global(qos:.userInitiated).async{
            
            print("begin")
            do{
            self.fetchdata()
            self.cacheImage()
                self.popularImages = self.theImages
            }
            
            
            print("end")
            DispatchQueue.main.async {
                self.theSpinner.stopAnimating()
                let alertController = UIAlertController(title: "Notice", message: "This app uses TMDB Database as the data source.", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "OK",
                                             style: .default,
                                             handler: nil)
                alertController.addAction(actionOk)

                self.present(alertController, animated: true, completion: nil)
                print("thisbegin")
                self.myPicker.delegate = self
                self.myPicker.dataSource = self
                self.myPicker2.delegate = self
                self.myPicker2.dataSource = self
                
                self.movieCollection.reloadData()
                print("thisend")
            }
        }
        self.setupCollectionview()

    }
    func setupCollectionview(){
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        movieCollection.dataSource = self
        movieCollection.delegate = self
        movieCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mycell")
    }
    func fetchdata(){
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=fc0afbf717b82f78804c0c619c29a099&sort_by=popularity.desc&page=1&year=2019")
        let data = try! Data(contentsOf: url!)
            self.popular = try! JSONDecoder().decode(APIResults.self, from: data)
            self.myMovies = self.popular.results
    }
    
    func cacheImage(){
        theImages = []
        
            for item in self.myMovies{
            var str1 = "https://image.tmdb.org/t/p/w185"
            str1 += item.poster_path!
            let url = URL(string: str1)
            let data = try? Data(contentsOf:url!)
            let image = UIImage(data: data!)
            self.theImages.append(image!)
            
        }
    }
    func cacheSearchImage(){
        searchImages = []
        let otherimage = UIImage(named: "Movie")
            for item in self.results.results{
            var str1 = "https://image.tmdb.org/t/p/w185"
            var image = UIImage(named: "Movie")
            
            if let posterpath = item.poster_path{
                str1 += posterpath
                let url = URL(string: str1)
            if let data = try? Data(contentsOf:url!){
                image = UIImage(data: data)
            }
            }
            if image == nil{
                image = otherimage
            }
                self.searchImages.append(image!)
        
        }
    }
    
    @IBOutlet var searchBar: UISearchBar!
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = DetailedViewController()
        detailedVC.name = myMovies[indexPath.row].title
        detailedVC.posterPath = myMovies[indexPath.row].poster_path ?? ""
        detailedVC.dateRelease = myMovies[indexPath.row].release_date
        detailedVC.score = myMovies[indexPath.row].vote_average
        detailedVC.overview = myMovies[indexPath.row].overview
        detailedVC.id = myMovies[indexPath.row].id!
        navigationController?.pushViewController(detailedVC, animated: true)
    }
    

}

