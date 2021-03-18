//
//  ReposAPI.swift
//  ModernMVVM
//

import Foundation
import Combine

/**
 APIs provides trending github repositories.
 */
class APIService: ServiceProtocol {
    
    private static let base = "https://api.github.com/search/repositories?q=any&sort=stars"
    
    func fetchTrendingRepositories(completion: @escaping ([Repository]?) -> Void) {
        loadTrendingRepos(completion)
    }
    
    private func loadTrendingRepos(_ completion: @escaping ([Repository]?) -> Void) {
        guard let url = URL(string: APIService.base) else { return }
                URLSession.shared.dataTask(with: url){ (data, _, _) in
                    guard let data = data else {
                        completion(nil)
                        return
                    }
                    guard let repos = try? JSONDecoder().decode(RepositoryList.self, from: data) else {
                        completion(nil)
                        return
                    }
                    DispatchQueue.main.async {
                        completion(repos.items)
                    }
                }.resume()
    }
    
}
    
 
