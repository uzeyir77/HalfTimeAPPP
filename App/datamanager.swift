//
//  datamanager.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//


import Foundation
import RealmSwift

class Club: Object {
    
    
    @Persisted var leagueName: String = ""
    @Persisted var clubName: String = ""
    @Persisted var isFavorite: Bool = false
    @Persisted var clubImage: String = ""
    @Persisted var leagueImage: String = ""
    //@Persisted var gameDetails: String = ""
}

class Club2: Object {
    @Persisted var leagueName: String = ""
    @Persisted var clubName: String = ""
    @Persisted var isFavorite: Bool = false
    @Persisted var clubImage: String = ""
    @Persisted var leagueImage: String = ""
    
}

