//
//  Repository.swift
//  XapoTest
//

import Foundation

/**
 A Repository is something where projects are stored.
 */
struct Repository: Decodable, Identifiable, Hashable {
    
    let id: Int
    let name: String
    let owner: Owner
    let description: String
    let language: String?
    let html_url: String
    let forks_count: Int
    let watchers_count: Int
    let stargazers_count: Int
    
    static func == (lhs: Repository, rhs: Repository) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

/**
 An owner of the repository.
 */
struct Owner: Codable {
    let avatar_url: String
}

