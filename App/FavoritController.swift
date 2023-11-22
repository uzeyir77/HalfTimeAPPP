//
//  FavoritController.swift
//  App
//
//  Created by Uzeyir on 21.11.23.
//

import UIKit

class FavoriteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var favoriteTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            favoriteTable.reloadData()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.dataSource = self
        favoriteTable.delegate = self
        favoriteTable.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return TeamsViewController.favoriteTeams.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = favoriteTable.dequeueReusableCell(withIdentifier: "favoritecell", for: indexPath) as! favoritecell
            
            cell.favName.text = TeamsViewController.favoriteTeams[indexPath.row].teamName
            cell.favimage.image = UIImage(named: TeamsViewController.favoriteTeams[indexPath.row].teamImage)

            return cell
        }
    }


