//
//  ContentView.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    SearchView()
                    
                    VStack {
                        MyRepositoriesView(vm: MyRepositoriesViewModel())
                        
                    }
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: Button(action: showChooseRepoView) {
                Image(systemName: "plus.circle")
                    .foregroundColor(Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
                    .font(.system(size: 24))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            })
            .sheet(isPresented: $showModal) {
                ChooseRepoView(isPresented: self.$showModal)
            }
        }
    }
    
    private func showChooseRepoView() {
        self.showModal = true
    }
}

extension Color {
    static let background = Color(.init(white: 0.95, alpha: 1))
}

struct SearchView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text("Search GitHub")
            Spacer()
        }
        .font(.system(size: 16, weight: .regular))
        .foregroundColor(.black)
        .padding()
        .background(Color(.init(white: 0, alpha: 0.1)))
        .cornerRadius(10)
        .padding(16)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
