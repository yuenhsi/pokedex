//
//  DetailVC.swift
//  pokedex
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var pokemonLabel: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonLabel.text = pokemon.name
    }
}
