//
//  MockRepo.swift
//  XapoTest
//

import Foundation
@testable import XapoTest

extension Repository {
    
    static func with(id: Int = 44838949,
                     name: String = "swift",
                     owner: Owner = Owner(avatar_url: "https://avatars.githubusercontent.com/u/10639145?v=4"),
                     description: String = "The Swift Programming Language",
                     language: String = "swift",
                     html_url: String = "https://github.com/apple",
                     forks_count: Int = 8858,
                     watchers_count: Int = 55217,
                     stargazers_count: Int = 55217) -> Repository {
        return Repository(
            id: id,
            name: name,
            owner: owner,
            description: description,
            language: language,
            html_url: html_url,
            forks_count: forks_count,
            watchers_count: watchers_count,
            stargazers_count: stargazers_count
        )
    }
}
