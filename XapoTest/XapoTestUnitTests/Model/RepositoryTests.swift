//
//  RepositoryTests.swift
//  XapoTestUnitTests
//

import XCTest
@testable import XapoTest

/**
 Repository parser from JSON.
 */
class RepositoryTests: XCTestCase {
    
    func testSuccessParser() {
        let json = """
        {
            "id": 44838949,
            "name": "swift",
            "owner": {
                       "avatar_url": "https://avatars.githubusercontent.com/u/10639145?v=4"
                },
            "description": "The Swift Programming Language",
            "language": "swift",
            "html_url": "https://github.com/apple",
            "forks_count": 8858,
            "watchers_count": 55217,
            "stargazers_count": 55217
        }
        """.data(using: .utf8)!
        
        let repo = try! JSONDecoder().decode(Repository.self, from: json)
        
        XCTAssertNotNil(repo)
        XCTAssertEqual(repo.id, Repository.with().id)
    }
    
}
