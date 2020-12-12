//
//  MyRepositoriesViewModel.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import Foundation

class MyRepositoriesViewModel: ObservableObject {
    
//    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchRepositories()
    }
    
    func fetchRepositories() {
        Service.getAllRepositories()
//        Service().getAllRepositories() { orders in
//            if let orders = orders {
//                self.orders = orders.map(OrderViewModel.init)
//            }
//        }
    }
    
}
