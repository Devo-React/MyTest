//
//  View.swift
//  XapoTest
//

import SwiftUI

/**
 View extension to add custom functionality.
 */
extension View {
    
    /**
     Type-erase view.
     */
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    /**
     View to create corner radius for given corners.
      
     - Parameter radius: the value for the corner radius.
     - Parameter corners: the corners which has to be rounded.
     
     - Returns: the rounded corner view.
     */
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
}

/**
 The rounded corner shape
 */
struct RoundedCorner: Shape {
    
    /// The radius of the rounded corner.
    var radius: CGFloat = .infinity
    
    /// The corners which has to be rounded.
    var corners: UIRectCorner = .allCorners
    
    /**
     Created rounded corner view with the given values.
      
     - Parameter rect: the value for the rect.
     
     - Returns: the path.
     */
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
