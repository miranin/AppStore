//
//  Service.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 12.09.2022.
//

import UIKit

class Service {
    
    
    static let shared = Service()
    
    func fetchApps(completion: @escaping ([Results], Error?)->() ) {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error occured during fetching, \(error)")
                completion([], nil)
                return
            }
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)

                completion(searchResult.results, nil)
                
            } catch {
                print("Failed to decode data in AppSearchController, \(error)")
            }
            
        }.resume()
        
    }
}

