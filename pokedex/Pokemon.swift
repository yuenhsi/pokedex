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
    private var _defence: String!
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
    
    var defence: String {
        if _defence == nil {
            _defence = ""
        }
        return _defence
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
    
}
