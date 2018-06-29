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
    var currentAnimalArray = [Animal]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimals()
        setUpsearchBar()
    }

    private func setUpAnimals(){
        //animalArray에 이름, 종류, 이미지 추가
        animalArray.append(Animal(name: "Data", category: .Dog, image: "1"))
        animalArray.append(Animal(name: "번개반점", category: .Cat, image: "2"))
        animalArray.append(Animal(name: "아딸", category: .Cat, image: "3"))

        animalArray.append(Animal(name: "홍콩반점", category: .Cat, image: "4"))
        animalArray.append(Animal(name: "토마토도시락", category: .Dog, image: "5"))
        animalArray.append(Animal(name: "왕짜장", category: .Cat, image: "6"))
        
        
        animalArray.append(Animal(name: "8첩", category: .Dog, image: "7"))
        animalArray.append(Animal(name: "불고기", category: .Dog, image: "8"))
        animalArray.append(Animal(name: "비빔밥", category: .Dog, image: "9"))

        currentAnimalArray = animalArray
    }
    
    private func setUpsearchBar(){
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAnimalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else{
            return UITableViewCell()
        }
        cell.nameLbl.text = currentAnimalArray[indexPath.row].name
        cell.categoryLbl.text = currentAnimalArray[indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named:animalArray[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        guard !searchText.isEmpty else {
            
            currentAnimalArray = animalArray
            table.reloadData()
            return
        }
        currentAnimalArray = animalArray.filter({ animal -> Bool in
            animal.name.lowercased().contains(searchText.lowercased())
        })
        table.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        switch selectedScope {
        case 0:currentAnimalArray = animalArray
        case 1:currentAnimalArray = animalArray.filter({ (animal) -> Bool in animal.category == AnimaType.Dog
        })
        case 2:currentAnimalArray = animalArray.filter({ (animal) -> Bool in animal.category == AnimaType.Cat
        })
        default:
            break
        }
        table.reloadData()
        //0, 1일 때는 AnimaType으로 한식, 분식을 구분
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

    case Cat = "분식"
    case Dog = "한식"
    
}
