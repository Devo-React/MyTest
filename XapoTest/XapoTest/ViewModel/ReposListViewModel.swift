//
//  RepoListViewModel.swift
//  ModernMVVMList
//

import Foundation
import Combine

/**
 A view model for the repository list.
 */
class ReposListViewModel: ObservableObject {
    
    @Published var repos = RepositoryList(items: [])
    
    @Published var loading = false
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadData() {
        self.loading = true
        service.fetchTrendingRepositories { repos in
            self.loading = false
            guard let repos = repos else {
                return
            }
            self.repos.items = repos
        }
    }
}
