//
//  File.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//

import Foundation

class LeagueViewModel {
    struct Game {
        var leagueName: String
        var gameTime: String
        var team1: String
        var team2: String
        var team1Image: String
        var team2Image: String
    }

    var upcomingGames: [[Game]] = []

    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "upcoming", ofType: "json") else {
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

            if let jsonDict = jsonResult as? [String: Any], let gamesArray = jsonDict["upcomingGames"] as? [[String: Any]] {

                for league in gamesArray {
                    var leagueGames: [Game] = []

                    if let leagueName = league["leagueName"] as? String, let games = league["games"] as? [[String: Any]] {

                        for game in games {
                            if
                                let gameTime = game["gameTime"] as? String,
                                let team1 = game["team1"] as? String,
                                let team2 = game["team2"] as? String,
                                let team1Image = game["team1Image"] as? String,
                                let team2Image = game["team2Image"] as? String {

                                let newGame = Game(leagueName: leagueName, gameTime: gameTime, team1: team1, team2: team2, team1Image: team1Image, team2Image: team2Image)
                                leagueGames.append(newGame)
                            }
                        }

                        upcomingGames.append(leagueGames)
                    }
                }

            } else {
                print("Invalid JSON format")
            }

        } catch {
            print(error.localizedDescription)
        }
    }
}
