//
//  ChooseRepoView.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import SwiftUI

struct ChooseRepoView: View {
    
    @Binding var isPresented: Bool
    @State private var showNotification: Bool = false
    
    var body: some View {
        
        NotificationView()
            .offset(y:self.showNotification ? -UIScreen.main.bounds.height / 3 : -UIScreen.main.bounds.height)
            .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10.0, initialVelocity: 0.0))
        
        Button("Press Me") {
            self.showNotification.toggle()
        }
        
    }
}

struct ChooseRepoView_Previews: PreviewProvider {
    static var previews: some View {
        
        ChooseRepoView(isPresented: .constant(false))
        
    }
}
