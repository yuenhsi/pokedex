//
//  ViewController.swift
//  pokedex
//
//  Created by Yuen Hsi Chang on 1/9/17.
//  Copyright © 2017 Yuen Hsi Chang. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
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
        searchBar.returnKeyType = .done
        
        getPokemon()
    }
    
    func getPokemon() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                let pokemon = Pokemon.init(name: row["identifier"]!.capitalized, id: Int(row["id"]!)!)
                pokemonList.append(pokemon)
            }
            
        } catch let err as NSError {
            print("\(err.localizedDescription)")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchMode = false
            collectionView.reloadData()
            view.endEditing(true)
        } else {
            searchMode = true
            filteredPokemonList = pokemonList.filter({$0.name.range(of: searchText.lowercased()) != nil})
            collectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selectedPokemon: Pokemon!
        if searchMode {
            selectedPokemon = filteredPokemonList[indexPath.row]
        } else {
            selectedPokemon = pokemonList[indexPath.row]
        }
        performSegue(withIdentifier: "DetailVC", sender: selectedPokemon)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            if let segueVC = segue.destination as? DetailVC {
                if let selectedPokemon = sender as? Pokemon {
                    segueVC.pokemon = selectedPokemon
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchMode {
            return filteredPokemonList.count
        } else {
            return pokemonList.count
        }
    }

}

