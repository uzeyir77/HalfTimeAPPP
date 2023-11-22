//
//  CompetitionController.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//


import UIKit

class CompetitionController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    @IBOutlet weak var leagueTable: UITableView!
    
    var leagueAndClub = [League]()
    var parser = JSONParser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.parseJSON { [weak self] leagues in
            self?.leagueAndClub = leagues?.leagues ?? [League]()
            DispatchQueue.main.async {
                self?.leagueTable.reloadData()
            }
        }
        leagueTable.delegate = self
        leagueTable.dataSource = self
        leagueTable.register(UINib(nibName: "ShowLeagueCell", bundle: nil), forCellReuseIdentifier: "ShowLeagueCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueAndClub.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowLeagueCell", for: indexPath) as! ShowLeagueCell
        cell.fillCell(CountryName: leagueAndClub[indexPath.row].CountryName,
                      LeagueName: leagueAndClub[indexPath.row].leagueName,
                      CountryImage: leagueAndClub[indexPath.row].CountryImage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedLeague = leagueAndClub[indexPath.row]
        
        if let teamsViewController = storyboard?.instantiateViewController(withIdentifier: "TeamsViewController") as? TeamsViewController {
            teamsViewController.league = selectedLeague
            navigationController?.pushViewController(teamsViewController, animated: true)
        }
    }
}
