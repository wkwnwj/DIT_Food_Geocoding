//
//  TableCell.swift
//  DIT_Food_Geocoding
//
//  Created by D7703_22 on 2018. 6. 29..
//  Copyright © 2018년 D7703_22. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var categoryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = imgView.frame.width / 5.0
        imgView.clipsToBounds = true
        //radios 둥글기
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
