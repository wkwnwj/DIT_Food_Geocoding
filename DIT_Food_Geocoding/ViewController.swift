//
//  ViewController.swift
//  DIT_Food_Geocoding
//
//  Created by D7703_22 on 2018. 6. 29..
//  Copyright © 2018년 D7703_22. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{

    

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var animalArray = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimals()
        setUpsearchBar()
    }
    
    private func setUpAnimals(){
        animalArray.append(Animal(name: "Amber", category: .cat, image: "1"))
        animalArray.append(Animal(name: "James", category: .cat, image: "2"))
        animalArray.append(Animal(name: "Peter", category: .cat, image: "3"))

        animalArray.append(Animal(name: "Haywood", category: .cat, image: "4"))
        animalArray.append(Animal(name: "Shell", category: .cat, image: "5"))
        animalArray.append(Animal(name: "James", category: .cat, image: "6"))


    }
    
    private func setUpsearchBar(){
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else{
            return UITableViewCell()
        }
        cell.nameLbl.text = animalArray[indexPath.row].name
        cell.categoryLbl.text = animalArray[indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named:animalArray[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class Animal{
    let name: String
    let image: String
    let category: AnimaType
    
    init(name: String, category: AnimaType, image: String){
        self.name = name
        self.category = category
        self.image = image
    }
}

enum AnimaType: String{
    case cat = "Cat"
    case dog = "Dog"
}
