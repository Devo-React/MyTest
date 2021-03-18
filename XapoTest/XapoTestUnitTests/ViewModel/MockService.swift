//
//  MockService.swift
//  XapoTest
//

import Foundation
import XCTest
@testable import XapoTest

/**
 MockService updates the mock data with success and fail so we can verify the value of data or state in the view model.
 */
class MockService : ServiceProtocol {
    
    let mockData: [Repository]?
    
    init(mockData: [Repository]?) {
        self.mockData = mockData
    }
    
    func fetchTrendingRepositories(completion: @escaping ([Repository]?) -> Void) {
        completion(mockData)
    }
}
