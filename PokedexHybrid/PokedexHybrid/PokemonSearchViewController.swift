//
//  PokemonSearchViewController.swift
//  PokedexHybrid
//
//  Created by Bradley GIlmore on 5/4/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
}

// MARK: - SearchBar Delegate

extension PokemonSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        DMNPokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokmeon) in
            DispatchQueue.main.async {
                guard let pokemon = pokmeon else { return }
                self.nameLabel.text = pokemon.name.capitalized
                self.idLabel.text = "ID: \(pokemon.identifier)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
    
}
