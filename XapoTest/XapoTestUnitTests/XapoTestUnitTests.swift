//
//  XapoTestUnitTests.swift
//  XapoTestUnitTests
//

import XCTest
@testable import XapoTest

class XapoTestUnitTests: XCTestCase {

    func testSuccessFetchData() {
            let expectedList = [Repository.with()]
            let service = MockService(mockData: expectedList)
            
            let viewModel = ReposListViewModel(service: service)
            
            
            viewModel.loadData()
            
            XCTAssertTrue(!viewModel.loading)
            XCTAssertEqual(viewModel.repos.items.count, 1)
        }
        
        func testEmptyData() {
            let expectedList = [Repository]()
            let service = MockService(mockData: expectedList)
            
            let viewModel = ReposListViewModel(service: service)
            
            
            viewModel.loadData()
            
            XCTAssertTrue(!viewModel.loading)
            XCTAssertEqual(viewModel.repos.items.count, 0)
        }
        
        func testNilData() {
            let expectedList: [Repository]? = nil
            let service = MockService(mockData: expectedList)
            
            let viewModel = ReposListViewModel(service: service)
            
            
            viewModel.loadData()
            
            XCTAssertTrue(!viewModel.loading)
            XCTAssertEqual(viewModel.repos.items.count, 0)
        }


}
