//
//  MyRepositoriesView.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyRepositoriesView: View {
    
    let mockedRepos: [Repository] = [
        
        .init(id: 1, node_id: "1", name: "Mush", full_name: "Mushington", private: true, watchers_count: 45, archived: false, disabled: false, open_issues_count: 5, forks: 987, open_issues: 5, watchers: 46, default_branch: "main", owner: Owner.init(login: "KrisReid", avatar_url: "https://avatars1.githubusercontent.com/u/12406866?v=4")),
        .init(id: 2, node_id: "2", name: "LollyPop", full_name: "LolllllyyPopsticle", private: true, watchers_count: 45, archived: false, disabled: false, open_issues_count: 68, forks: 567, open_issues: 18, watchers: 106, default_branch: "main", owner: Owner.init(login: "KrisReid", avatar_url: "https://avatars1.githubusercontent.com/u/12406866?v=4"))
    ]
    
    
    @ObservedObject var vm: MyRepositoriesViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("My Repositories")
                    .font(.title)
                Spacer()
            }.padding(.horizontal)
            
            
            ScrollView (.horizontal) {
                HStack (spacing: 10) {
                    ForEach(vm.repo, id: \.self) {num in
//                    ForEach(mockedRepos, id: \.self) {num in
                        VStack {
                            
                            WebImage(url: URL(string: num.owner.avatar_url))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(30)
                                .padding(.vertical, 6)
                                
                            HStack {
                                Text(num.name)
                                    .font(.system(size: 14))
                            }
                                    
                            RepoMetricsView(repo: num)

                        }
                    }
                    .frame(width: 120)
                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .cornerRadius(8)
                    .shadow(color: .init(.sRGB, white: 0.4, opacity: 1), radius: 2, x: 2, y: 2)
                }.padding([.bottom, .horizontal])
            }
        }
    }
}


struct RepoMetricsView: View {
    
    let repo: Repository
    
    var body: some View {
        VStack (spacing: 2) {
            HStack {
                Image(systemName: "ant.circle.fill")
                    .foregroundColor(.red)
                Text("\(repo.open_issues_count)")
                    .font(.system(size: 10))
                Spacer()
            }
            
            HStack {
                Image(systemName: "binoculars.fill")
                    .foregroundColor(.gray)
                Text("\(repo.watchers)")
                    .font(.system(size: 10))
                Spacer()
            }
            
            HStack {
                Image(systemName: "tuningfork")
                    .foregroundColor(.blue)
                Text("\(repo.forks)")
                    .font(.system(size: 10))
                Spacer()
            }
        }.padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
    }
}

struct MyRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        MyRepositoriesView(vm: MyRepositoriesViewModel())
        
        ContentView()
    }
}
