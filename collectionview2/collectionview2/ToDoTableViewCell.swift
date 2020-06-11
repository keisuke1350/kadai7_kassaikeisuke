//
//  ToDoTableViewCell.swift
//  collectionview2
//
//  Created by 葛西　佳祐 on 2020/06/10.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var toDoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected
            , animated: animated)
    }
    
}
