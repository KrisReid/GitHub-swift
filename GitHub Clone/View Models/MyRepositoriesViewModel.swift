//
//  MyRepositoriesViewModel.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import Foundation

class MyRepositoriesViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var repo = [Repository]()
    @Published var errorMessage = ""
    
    init() {
        
        let urlString = "https://api.github.com/users/KrisReid/repos"
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data else { return }
            print(data)
            
            DispatchQueue.main.async {
                do {
                    print(data)
                    self.repo = try JSONDecoder().decode([Repository].self, from: data)
                } catch {
                    print("Failed to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }.resume()
    }
    
}
