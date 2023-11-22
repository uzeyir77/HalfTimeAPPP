//
//  ShowLeagueCell.swift
//  App
//
//  Created by Uzeyir on 21.11.23.
//

import UIKit

class ShowLeagueCell: UITableViewCell {
    
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var leagueNameField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fillCell(CountryName: String, LeagueName: String, CountryImage: String) {
            countryName.text = CountryName
            leagueNameField.text = LeagueName
            countryImage.image = UIImage(named: CountryImage)
        }
    
}
