//
//  ReposListView.swift
//  ModernMVVM
//

import Combine
import SwiftUI

/**
 A view to display the trending repository list.
 */
struct ReposListView: View {
    
    @ObservedObject var viewmodel = ReposListViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            if viewmodel.loading {
                Spinner(isAnimating: true, style: .large).eraseToAnyView()
            }
            else {
                if (viewmodel.repos.items.count > 0) {
                    List {
                        ForEach(viewmodel.repos.items, id: \.self) { repo in
                            VStack() {
                                RepoListItemView(repo: repo)
                                NavigationLink(
                                    destination: RepoDetailView(repo: repo)
                                ){
                                    EmptyView()
                                }
                                .opacity(0.0)
                                .buttonStyle(PlainButtonStyle())
                                
                            }
                        }.listRowBackground(Color.primaryColor)
                        .cornerRadius(20, corners: [.topLeft, .bottomRight])
                    }
                } else {
                    VStack(alignment: .center) {
                        Text("No repositiry or error")
                    }
                }
            }
        }
        .onAppear {
            self.viewmodel.loadData()
        }
        .navigationBarTitle("Trending Repositories", displayMode: .inline)
        .font(.custom("Fabriga", size: 20))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: goBack) {
                                    HStack {
                                        Image(systemName: "arrow.left.circle").foregroundColor(.secondaryColor)
                                    }
                                }
        )
    }
    
    // To go back to the previous view.
    func goBack(){
        self.presentationMode.wrappedValue.dismiss()
    }
    
}
/**
 A view to display repository list item.
 */
struct RepoListItemView: View {
    
    // A repository item.
    let repo: Repository
    
    // An image cache.
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        VStack() {
            title
        }
        .frame(height: 40)
        .background(Color.primaryColor)
    }
    
    
    // Title view of a repository item.
    private var title: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                .foregroundColor(.secondaryColor)
                .font(.custom("Fabriga", size: 18))
            
        }
        
    }
    
    
    // Spinner view.
    private var spinner: some View {
        Spinner(isAnimating: true, style: .medium)
    }
    
}


