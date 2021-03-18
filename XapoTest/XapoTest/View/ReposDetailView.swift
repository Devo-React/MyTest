//
//  RepoDetailView.swift
//  ModernMVVMList
//
import SwiftUI
import Combine

/**
 A view to display details of a repository list.
 */
struct RepoDetailView: View {
    
    let repo: Repository
    
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.imageCache) var cache: ImageCache
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                repoDetails()                }
            
        }   .navigationBarBackButtonHidden(true)
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
    
    // All the details of a particular repository.
    private func repoDetails() -> some View {
        
        VStack(spacing: 20) {
            
            titleView
            
            
            logo.frame(width: 60, height: 60, alignment: .center)
            
            
            descriptionView
            
            
            otherDetailsView
            
            visitButton
            
            Spacer()
            
        }.cornerRadius(15)
        .padding(.all, 20)
    }
    
    var titleView: some View {
        Text(repo.name)
            .foregroundColor(.white)
            .font(.custom("Fabriga", size: 34))
            .multilineTextAlignment(.center)
    }
    
    var descriptionView: some View {
        Text(repo.description )
            .foregroundColor(.white)
            .font(.custom("Fabriga", size: 16))
            .multilineTextAlignment(.center)
        
    }
    
    var otherDetailsView: some View {
        VStack {
            if let language = repo.language {
                HStack(alignment: .center) {
                    
                    Text("language: ")
                        .foregroundColor(.secondaryColor)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)
                    
                    Text(language)
                        .foregroundColor(.white)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)
                }
            }
            
            
            HStack {
                VStack {
                    Text("\(repo.forks_count)")
                        .foregroundColor(.white)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("forks")
                        .foregroundColor(.secondaryColor)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)
                }
                
                Divider().background(Color.white).frame(height: 80).padding()
                VStack {
                    Text(String(repo.watchers_count))
                        .foregroundColor(.white)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("watchers")
                        .foregroundColor(.secondaryColor)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)                }
                
                Divider().background(Color.white).frame(height: 80).padding()
                
                VStack {
                    Text(String(repo.stargazers_count))
                        .foregroundColor(.white)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("stars")
                        .foregroundColor(.secondaryColor)
                        .font(.custom("Fabriga", size: 16))
                        .multilineTextAlignment(.center)
                }
            }
            
            
        }
    }
    
    var logo: some View {
        let poster = URL(string: repo.owner.avatar_url)
        return poster.map { url in
            AsyncImage(
                url: url,
                cache: cache,
                placeholder: self.spinner,
                configuration: { $0.resizable() }
            )
            .aspectRatio(contentMode: .fit)
        }
    }
    
    var visitButton: some View {
        HStack {
            Spacer()
            Button("Visit", action: {
                guard let xapoUrl = URL(string: repo.html_url),
                      UIApplication.shared.canOpenURL(xapoUrl) else {
                    return
                }
                UIApplication.shared.open(xapoUrl,
                                          options: [:],
                                          completionHandler: nil)
            }) .foregroundColor(.white)
            .font(.custom("Fabriga", size: 16))
            .frame(width: 100, height: 48, alignment: .center)
            .background(Color.secondaryColor)
            .cornerRadius(100)
            
            Spacer()
        }
        
    }
    
    private var spinner: Spinner { Spinner(isAnimating: true, style: .large) }
    
}

