//
//  NotificationView.swift
//  GitHub Clone
//
//  Created by Kris Reid on 19/12/2020.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        Text("Success")
            .padding()
            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            .frame(width: UIScreen.main.bounds.width - 10, height: 100)
            .background(Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
            .cornerRadius(20)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
