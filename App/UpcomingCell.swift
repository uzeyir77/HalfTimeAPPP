//
//  UpcomingCell.swift
//  App
//
//  Created by Uzeyir on 21.11.23.
//

import UIKit

class UpcomingCell: UITableViewCell {
    
    @IBOutlet weak var image1: UIImageView!
    
    
    @IBOutlet weak var teamName1: UILabel!
    

    @IBOutlet weak var image2: UIImageView!
    
    
    @IBOutlet weak var teamName2: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
