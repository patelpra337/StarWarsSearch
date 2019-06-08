//
//  StarWarsSearchTableViewController.swift
//  StarWarsSearch
//
//  Created by patelpra on 6/6/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import UIKit

class StarWarsSearchTableViewController: UITableViewController, UISearchBarDelegate {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let personController = PersonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        
    }
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = self.searchBar.text else { return }
        
        self.personController.searchForPeopleWith(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personController.people.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else
        { return UITableViewCell() }
        
        let person = self.personController.people[indexPath.row]
        
        cell.person = person

        return cell
    }

}
