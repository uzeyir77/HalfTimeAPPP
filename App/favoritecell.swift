//
//  favoritecell.swift
//  App
//
//  Created by Uzeyir on 21.11.23.
//

import UIKit

class favoritecell: UITableViewCell {
    
    
    @IBOutlet weak var favimage: UIImageView!
    
    @IBOutlet weak var favName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
