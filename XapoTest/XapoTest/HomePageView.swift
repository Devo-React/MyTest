//
//  HomePageView.swift
//  ModernMVVM
//

import SwiftUI

/**
 A view to display the home/landing screen.
 */
struct HomePageView: View {
    
    var body: some View {
        
        NavigationView {
            VStack() {
                VStack() {
                    self.infoView
                    Spacer()
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    
                    Spacer()
                    self.loginButton
                    
                    policyView.padding()
                    
                }
            }
            .background(Color.primaryColor)
            .navigationBarTitle("", displayMode: .automatic)
            .navigationBarHidden(true)
            
        }
        .padding(.vertical)
    }
    
  
    var infoView: some View {
        VStack(spacing: 80) {
            
            xapoLinkButton
            
            VStack(){
                
                Spacer()
                logoImage
                
                Spacer()
              
                welcomeTxt
                
                Spacer()
                
                descriptionTxt
            }
        }
        
    }
    
    var xapoLinkButton: some View {
        VStack() {
            
            HStack {
                Spacer()
                
                Button("Go to Xapo", action: {
                    guard let xapoUrl = URL(string: "https://xapo.com/"),
                          UIApplication.shared.canOpenURL(xapoUrl) else {
                        return
                    }
                    UIApplication.shared.open(xapoUrl,
                                              options: [:],
                                              completionHandler: nil)
                }) .foregroundColor(.white)
                .font(.custom("Fabriga", size: 16))
                .padding(.trailing, 8)
                .padding(.top, 32)
                
            }
        }
    }
    
    var logoImage: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode:.fit)
            .frame(width: 99, height: 71)
            .padding([.top], 37)
    }
    
    var welcomeTxt: some View {
        Text("Welcome to iOS Test")
            .fontWeight(.medium)
            .foregroundColor(.white)
            .font(.custom("Fabriga", size: 40))
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .padding([.leading, .trailing], 34)
            .padding(.bottom, 5)
    }
    
    var descriptionTxt: some View {
        Text("""
        iOS Test for Xapo bank


        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.
        """)
            .foregroundColor(.white)
            .font(.custom("Fabriga", size: 16))
            .fontWeight(.regular)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding([.leading, .trailing], 34)
    }
    
    var loginButton: some View {
        NavigationLink(destination: ReposListView(viewmodel: ReposListViewModel())) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Enter the app").foregroundColor(.white).font(.custom("Fabriga", size: 16))
                    Spacer()
                }
                Spacer()
            }.frame(width: 280, height: 48)
            .background(Color.secondaryColor)
            .cornerRadius(100)
        }
    }
    
    
    var policyView: some View {
        VStack(){
            Text("Privacy policy").underline()
                .foregroundColor(.white)
                .font(.custom("Fabriga", size: 13))
                .fontWeight(.regular)
                +
                Text(" and")
                .foregroundColor(.white)
                .font(.custom("Fabriga", size: 13))
                .fontWeight(.regular)
                +
                Text(" Terms of use").underline()
                .font(.custom("Fabriga", size: 13))
                .foregroundColor(.white)
                .fontWeight(.regular)
        }
        
    }
    
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

