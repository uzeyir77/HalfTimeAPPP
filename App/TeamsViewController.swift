//
//  TeamsViewController.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//

import UIKit

import UIKit

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    static var favoriteTeams: [Team] = []
    
        var league: League?
        var teams: [Team] {
            return league?.teams ?? []
        }

        @IBOutlet weak var tableView: UITableView!

        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.dataSource = self
            tableView.delegate = self
        }
    
    @IBAction func addToFavorites(_ sender: Any) {
        if let button = sender as? UIButton,
                let cell = button.superview?.superview as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) {
                    
                    let favoriTakim = teams[indexPath.row]
                    TeamsViewController.favoriteTeams.append(favoriTakim)

                    tableView.reloadData()
            print(favoriTakim.teamName)
            }
        if let button = sender as? UIButton {
            button.tintColor = .orange
        }

    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return teams.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamcell", for: indexPath)
            
            cell.textLabel?.text = teams[indexPath.row].teamName
            cell.imageView?.image = UIImage(named: teams[indexPath.row].teamImage)

            return cell
        }
    }

