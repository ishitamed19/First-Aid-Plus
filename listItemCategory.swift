//
//  listItemCategory.swift
//  Ishita Mediratta
//
//  Created by Ishita Mediratta on 27/04/16.
//  Copyright © 2016 Ishita Mediratta. All rights reserved.
//

import UIKit

class listItemCategory: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var categoryLabel: UILabel!
    

var listItem: listitem? {
    didSet {
        if let item = listItem {
            categoryLabel.text = item.category.toString()
            
        }
        else {
            categoryLabel.text = nil
           
             }
        }
    }
    
       
}
