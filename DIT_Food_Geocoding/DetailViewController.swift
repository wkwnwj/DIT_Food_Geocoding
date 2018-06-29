//
//  DetailViewController.swift
//  DIT_Food_Geocoding
//
//  Created by D7703_22 on 2018. 6. 29..
//  Copyright © 2018년 D7703_22. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var cellImageView: UITableView!
    @IBOutlet weak var detailTableView: UIImageView!
    
    var cellImage: String = ""
    var name: String = ""
    var kind: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        
        self.title = name
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "이름 : " + name
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "종류 : " + kind
            return cell
        default :
           
            cell.configure(location: kind)
            return cell
        }
    }
    
    //
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMapView" {
            if detailTableView.indexPathForSelectedRow != nil {
                let destinationController = segue.destination as! MapViewController
                destinationController.location = local1
                destinationController.name = name
                destinationController.tel = tel1
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
