//
//  Service.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import Foundation

class Service {
    
    func getAllRepositories() {
        let urlString = "https://api.github.com/users/KrisReid/repos"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data else { return }
            
            print(data)
            
            DispatchQueue.main.async {
                do {
                    let orders = try JSONDecoder().decode([Order].self, from: data)
                    completion(orders)
                } catch {
                    print("Failed to decode JSON:", error)
                    completion(nil)
                }
            }
        }.resume()
        
    }
    
}
