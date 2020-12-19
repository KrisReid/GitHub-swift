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
    @State private var showDetails: Bool = false
    
    var body: some View {
        
        VStack {
            NotificationView()
                .offset(y: self.showNotification ? 0 : -200)
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10.0, initialVelocity: 0.0))
            
            Spacer()
            
            Text("💍")
                .font(.custom("Ariel", size: 100))
                .scaleEffect(self.showDetails ? 2 : 0)
                .rotationEffect(.degrees(self.showDetails ? 360.0 : 0.0))
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10.0, initialVelocity: 0.0))
            
            Text("Will you marry me?")
                .scaleEffect(self.showDetails ? 2 : 0)
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 100.0, initialVelocity: 0.0))
                .padding(.top, 60)
            
            Spacer()
            
            HStack {
                Button("Press Me") {
                    self.showNotification.toggle()
                }
                .padding()
                .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                .foregroundColor(.white)
                
                Button("Click for a question") {
                    self.showDetails.toggle()
                }
                .padding()
                .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .foregroundColor(.white)
            }
        }
    }
}

struct ChooseRepoView_Previews: PreviewProvider {
    static var previews: some View {
        
        ChooseRepoView(isPresented: .constant(false))
        
    }
}
