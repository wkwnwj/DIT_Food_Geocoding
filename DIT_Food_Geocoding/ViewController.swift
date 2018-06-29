//
//  ViewController.swift
//  DIT_Food_Geocoding
//
//  Created by D7703_22 on 2018. 6. 29..
//  Copyright © 2018년 D7703_22. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var animalArray = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpAnimals(){
        animalArray.append(Animal(name: "Amber", category: .cat, image: "1"))
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
