//
//  ChooseRepoView.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import SwiftUI

struct ChooseRepoView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChooseRepoView_Previews: PreviewProvider {
    static var previews: some View {
        
        ChooseRepoView(isPresented: .constant(false))
        
    }
}
