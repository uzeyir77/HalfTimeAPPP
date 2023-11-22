//
//  ShowLiveCell.swift
//  App
//
//  Created by Uzeyir on 21.11.23.
//

import UIKit

class ShowLiveCell: UICollectionViewCell {
    
    @IBOutlet weak var image1Field: UIImageView!
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var image2Field: UIImageView!
    
    
    @IBOutlet weak var name1Field: UILabel!
    
    @IBOutlet weak var name2Field: UILabel!
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background.layer.cornerRadius = 20
    }

}
