//
//  ViewController.swift
//  pokedex
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pokemonList = [Pokemon]()
    var filteredPokemonList = [Pokemon]()
    var searchMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        
        getPokemon()
    }
    
    func getPokemon() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                let pokemon = Pokemon.init(name: row["identifier"]!, id: Int(row["id"]!)!)
                pokemonList.append(pokemon)
            }
            
        } catch let err as NSError {
            print("\(err.localizedDescription)")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchMode = false
        } else {
            searchMode = true
            filteredPokemonList = pokemonList.filter({$0.name.range(of: searchText.lowercased()) != nil})
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchMode {
            return filteredPokemonList.count
        } else {
            return pokemonList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            if searchMode {
                cell.configureCell(filteredPokemonList[indexPath.row])
            } else {
                cell.configureCell(pokemonList[indexPath.row])
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

}

