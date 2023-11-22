//
//  leagueAndClubsViewModel.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//


import Foundation

struct Leagues: Codable {
    var leagues: [League]
}

struct League: Codable {
    var leagueName: String
    var CountryName : String
    var CountryImage : String
    var teams : [Team]
    
    //var teams: [Team]
}

struct Team: Codable {
    var teamName: String
    var teamImage: String
}

class JSONParser {
    
    
    
    
    
    func parseJSON(completion: @escaping (Leagues?) -> Void) {
        if let path = Bundle.main.path(forResource: "League&clubs", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let leagues = try decoder.decode(Leagues.self, from: data)
                completion(leagues)
            } catch {
                print("Error parsing JSON: \(error)")
                completion(nil)
            }

        } else {
            print("JSON file not found:1212")
            completion(nil)
        }
    }
}
