//
//  ServiceProtocol.swift
//  XapoTest
//
import Foundation

/**
 Service protocol is the decouple connection so we can mock for the unit testing.
 */
protocol ServiceProtocol {
    
    func fetchTrendingRepositories(completion: @escaping ([Repository]?) -> Void)
    
}
