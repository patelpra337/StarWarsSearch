//
//  PersonTableViewCell.swift
//  StarWarsSearch
//
//  Created by patelpra on 6/6/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    var person: Person? {
        didSet {
        updateViews()
        }
    }
    
    // MARK: - IBOutlets & Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    // MARK: - Methods
    private func updateViews() {
    guard let person = person else { return }
    self.nameLabel.text = person.name
    self.genderLabel.text = "Gender: \(person.gender)"
    self.birthYearLabel.text = "Birth Year: \(person.birthYear)"
    }

}
