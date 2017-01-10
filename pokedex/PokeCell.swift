//
//  PokeCell.swift
//  pokedex
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(_ pokemon: Pokemon) {
        
        self.pokemon = pokemon
        self.thumbImage.image = UIImage(named: "\(pokemon.id)")
        self.nameLabel.text = pokemon.name
        
    }

}
