//
//  PersonController.swift
//  StarWarsSearch
//
//  Created by patelpra on 6/6/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import Foundation

class PersonController {
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    var people: [Person] = []
    
    // let baseURL = URL(string: "https://swapi.co/api/people")!
    var baseURL: URL? {
        guard let url = URL(string: "https://swapi.co/api/people") else { return nil }
        return url
    }
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        // 1. Base URL
        // 2. Set up URL Compoents and Query Items
        // 3.  Add query items to URL Compoents
        // 4.  Get final URL from URL Compoents
        // 5.  Create URL Request with URL
        // 6.  Set HTTP Method
        // 7.  Create data task with URL Request
        //      a.  handle errors
        //      b.  safely unwrap data
        //      c.  decode data (set strategy if necessary)
        //      d.  set self.people = decodedData
        
        
        
        // Ensure Base URL
        guard let baseURL = baseURL else {
            completion()
            return
        }
        
        // Add URL Components if Necessary
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let searchTermQueryItem = URLQueryItem(name: "search", value: "search")
        
        urlComponents?.queryItems = [searchTermQueryItem]
        
        // RequestURL
        guard let requestURL = urlComponents?.url else {
            NSLog("requestURL is nil")
            completion()
            return
        }
        
        // Create request
        var request = URLRequest(url: requestURL)
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        // Create a data task
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            // Handle Error Case
            if let error = error {
                NSLog("Error fetching data \(error)")
                completion()
                return
            }
            
            // Handle Data
            guard let data = data else {
                NSLog("No data returned from data task")
                completion()
                return
            }
            
            // Create a Decoder and Decode
            let jsonDecoder = JSONDecoder()
            
            do {
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
            } catch {
                NSLog("Unable to decode data into object of type [Person]: \(error)")
                completion()
            }
            completion()
        }.resume()
    }
}
