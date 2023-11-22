//
//  liveMatchesViewModel.swift
//  App
//
//  Created by Uzeyir on 20.11.23.
//


import Foundation
import RealmSwift


class LiveMatchViewModel {
    var items = [Club]()
    var items2 = [Club2]()
    let realm: Realm
    
    var completion: (() -> Void)?
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Error initializing Realm: \(error)")
        }
    }
    
    func fetchItems() {
        
        let clubs = realm.objects(Club.self)
        items = Array(clubs)
     
        completion?()
    }
    func fetchItems2() {
        
        let clubs2 = realm.objects(Club2.self)
        items2 = Array(clubs2)
     
        completion?()
    }
    
    
    func getPathURL() {
        do {
            if let url = realm.configuration.fileURL {
                print(url)
            }
        }
    }
//    func fillCell(CountryName: String, LeagueName: String, CountryImage: String) {
//        countryName.text = CountryName
//        LeagueNameLabel.text = LeagueName
//        CountryIMage.image = UIImage(named: CountryImage)
//    }
}
