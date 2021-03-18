//
//  Spinner.swift
//  ModernMVVM
//

import SwiftUI
import UIKit

/**
 Created animation of the Spinner.
 */
struct Spinner: UIViewRepresentable {
    
    /// Is the animation set to true or false.
    let isAnimating: Bool
    
    /// The style value.
    let style: UIActivityIndicatorView.Style
    
    /**
     Creates the spinner view.
     */
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        return spinner
    }
    
    /**
     Updates the view according to the given animation bool value.
     */
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
