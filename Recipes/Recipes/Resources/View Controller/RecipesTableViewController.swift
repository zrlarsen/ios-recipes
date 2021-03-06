//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Zack Larsen on 12/2/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    var recipes: [Recipe] = [] {
        didSet{
            tableView.reloadData()
        }
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipe", for: indexPath)
        
        cell.textLabel?.text = recipes[indexPath.row].name

        return cell
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetails" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let detailVC = segue.destination as! RecipeDetailViewController
            detailVC.recipe = recipes[indexPath.row]
        }
    }
}
