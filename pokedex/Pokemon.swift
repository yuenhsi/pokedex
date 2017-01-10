//
//  Pokemon.swift
//  pokedex
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import Foundation

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _id: Int!
    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    
    init(name: String, id: Int) {
        self._name = name
        self._id = id
    }
    
}
