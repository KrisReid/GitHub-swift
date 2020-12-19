//
//  MyRepositoriesView.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import SwiftUI

struct MyRepositoriesView: View {
    
    @ObservedObject var vm: MyRepositoriesViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("My Repositories")
                    .font(.title)
                Spacer()
            }.padding(.horizontal)
            
            
            ScrollView (.horizontal) {
                HStack (spacing: 20) {
//                    ForEach(0..<10, id: \.self) {num in
                    ForEach(vm.repo, id: \.self) {num in
                        VStack {
                            Spacer()
                                .frame(width: 125, height: 150)
                                .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                            
                            Text("Hello")
                            Text(num.name)
                                .font(.system(size: 24))
                        }
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct MyRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRepositoriesView(vm: MyRepositoriesViewModel())
    }
}
