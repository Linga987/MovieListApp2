//
//  UIVeiw.swift
//  MovieListApp
//
//  Created by shanmuga srinivas on 02/05/24.
//

import Foundation
import UIKit

extension UIView {
    func round(_ radius:CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBoarder(_ color:UIColor, _ width:CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
