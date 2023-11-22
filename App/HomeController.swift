//
//  HomeController.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
    
    var liveMatches = LiveMatchViewModel()
    var upcomingMatches = LeagueViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
   // @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var upcomingTable: UITableView!
    
    @IBOutlet weak var LiveCollection: UICollectionView!
    override func viewDidLoad() {
    
    super.viewDidLoad()
        
        upcomingMatches.parseJSON()
        
        upcomingTable.reloadData()
        
    liveMatches.getPathURL()
        liveMatches.fetchItems()
        liveMatches.fetchItems2()
        
        LiveCollection.reloadData()
        
        
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
    LiveCollection.dataSource = self
    LiveCollection.delegate = self
        searchBar.delegate = self
            
        LiveCollection.register(UINib(nibName: "ShowLiveCell", bundle: nil), forCellWithReuseIdentifier: "ShowLiveCell")
        
        upcomingTable.register(UINib(nibName: "UpcomingCell", bundle: nil), forCellReuseIdentifier: "UpcomingCell")
        
        }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return liveMatches.items.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowLiveCell", for: indexPath) as! ShowLiveCell
            cell.image1Field.image = UIImage(named: liveMatches.items[indexPath.item].clubImage)
            cell.name1Field.text = liveMatches.items[indexPath.item].clubName
            cell.image2Field.image = UIImage(named: liveMatches.items2[indexPath.item].clubImage)
            cell.name2Field.text = liveMatches.items2[indexPath.item].clubName
            return cell
           }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingMatches.upcomingGames[section].count
       }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingCell", for: indexPath) as! UpcomingCell
                    let game = upcomingMatches.upcomingGames[indexPath.section][indexPath.row]
            cell.teamName1.text = game.team1
            cell.teamName2.text = game.team2
            cell.image1.image = UIImage(named: game.team1Image )
            cell.image2.image = UIImage(named: game.team2Image)
            cell.timeLabel.text = game.gameTime
                    
            return cell
       }
    func numberOfSections(in tableView: UITableView) -> Int {
            return upcomingMatches.upcomingGames.count
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
        
    }
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return upcomingMatches.upcomingGames[section].first?.leagueName
        }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          filteredData = data.filter { $0.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
        }
    }
    

