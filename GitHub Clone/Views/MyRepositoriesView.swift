//
//  MyRepositoriesView.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import SwiftUI

struct MyRepositoriesView: View {
    
    @ObservedObject var vm: MyRepositoriesViewModelMore
    
    var body: some View {
        VStack {
            HStack {
                Text("My Repositories")
                    .font(.title)
                Spacer()
            }.padding(.horizontal)
            
            
            ScrollView (.horizontal) {
                HStack (spacing: 20) {
                    ForEach(0..<10, id: \.self) {num in
                        VStack {
                            Spacer()
                                .frame(width: 125, height: 150)
                                .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                            
                            Text(vm.repositoryDetails?.name ?? "")
                        }
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}


class MyRepositoriesViewModelMore: ObservableObject {
    @Published var isLoading = true
    @Published var repositoryDetails: RepositoryDetails?
    
    init(name: String) {
        
        let urlString = "https://api.github.com/users/KrisReid/repos"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    self.repositoryDetails = try JSONDecoder().decode(RepositoryDetails.self, from: data)
                } catch {
                    print("Failed to decode JSON", error)
                }
            }
        }.resume()
    }
}

struct RepositoryDetails: Decodable {
    let name: String
}


struct MyRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRepositoriesView(vm: MyRepositoriesViewModelMore(name: "Kris Repo"))
    }
}
