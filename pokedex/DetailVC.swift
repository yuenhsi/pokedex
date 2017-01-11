//
//  DetailVC.swift
//  pokedex
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var evoTextLabel: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        thumbImg.image = UIImage(named: "\(pokemon.id)")
        pokemonLabel.text = pokemon.name
        pokemon.getDetails {
            self.updateUI()
        }
    }
    
    func updateUI() {
        pokedexIdLabel.text = "\(pokemon.id)"
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.pokeDescription
        evoTextLabel.text = pokemon.evoText
        currentEvoImg.image = UIImage(named: "\(pokemon.id)")
        if pokemon.evoID != 0 {
            
            nextEvoImg.image = UIImage(named:  "\(pokemon.id + 1)")
        } else {
            nextEvoImg.isHidden = true
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
