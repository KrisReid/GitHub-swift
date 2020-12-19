//
//  Repository.swift
//  GitHub Clone
//
//  Created by Kris Reid on 12/12/2020.
//

import Foundation

struct Repository: Codable, Hashable {
    let id: Int
    let node_id : String
    let name : String
    let full_name : String
    let `private` : Bool
    let watchers_count : Int
//    let language : String
    let archived : Bool
    let disabled : Bool
    let open_issues_count : Int
    let forks : Int
    let open_issues : Int
    let watchers : Int
    let default_branch : String
    var owner : Owner
}

struct Owner: Codable, Hashable {
    let login : String
    let avatar_url : String
}
