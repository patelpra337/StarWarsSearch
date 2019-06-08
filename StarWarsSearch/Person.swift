//
//  Person.swift
//  StarWarsSearch
//
//  Created by patelpra on 6/6/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import Foundation

struct Person: Decodable {
    var name: String
    var gender: String
    var birthYear: String
}

struct PersonSearch: Decodable {
    var results: [Person]
}
