//
//  Pokemon.swift
//  pokedex
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _id: Int!
    private var _attack: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _type: String!
    private var _description: String!
    private var _evoID: Int!
    private var _evoLvl: String!
    private var _evoName: String!
    private var _evoText: String!
    
    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var evoID: Int {
        if _evoID == nil {
            _evoID = 0
        }
        return _evoID
    }
    
    var evoLvl: String {
        if _evoLvl == nil {
            _evoLvl = ""
        }
        return _evoLvl
    }
    
    var evoName: String {
        if _evoName == nil {
            _evoName = ""
        }
        return _evoName
    }
    
    var evoText: String {
        if _evoText == nil {
            _evoText = ""
        }
        return _evoText
    }
    
    
    init(name: String, id: Int) {
        self._name = name
        self._id = id
    }
    
    func getDetails(completed: @escaping DownloadComplete) {
        let pokemonURL = "\(URL_PREFIX)\(POKEMON_URL_SUFFIX)/\(self.id)"
        Alamofire.request(pokemonURL).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, Any> {
                if let attack = JSON["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defense = JSON["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                if let height = JSON["height"] as? String {
                    self._height = height
                }
                if let weight = JSON["weight"] as? String {
                    self._weight = weight
                }
                if let types = JSON["types"] as? [Dictionary<String, String>] {
                    var typeArray = [String]()
                    for type in types {
                        if let name = type["name"] {
                            typeArray.append(name)
                        }
                    }
                    self._type = typeArray.joined(separator: ",")
                }
                if let descriptions = JSON["descriptions"] as? [Dictionary<String, String>], descriptions.count > 0 {
                    let descriptionUri = descriptions[0]["resource_uri"]
                    Alamofire.request("\(URL_PREFIX)\(descriptionUri)").responseJSON { response in
                        if let JSON = response.result.value as? Dictionary<String, Any> {
                            if let description = JSON["description"] as? String {
                                self._description = description
                            }
                        }
                    }
                }
                print(self._attack)
                print(self._defense)
                print(self._height)
                print(self._weight)
                print(self._type)
                
                // type, description, evo stuff
            }
            completed()
        }
    }
    
}
