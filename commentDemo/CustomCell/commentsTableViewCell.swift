//
//  commentsTableViewCell.swift
//  commentDemo
//
//  Created by mac on 3/21/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class commentsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var curCode: UILabel!
    
    @IBOutlet weak var curName: UILabel!
    @IBOutlet weak var curSymbol: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
