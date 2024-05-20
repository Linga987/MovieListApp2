//
//  Observable.swift
//  MovieListApp
//
//  Created by shanmuga srinivas on 21/04/24.
//

import Foundation
import UIKit

class ObserVable<T> {
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener:((T?) -> Void)?
    func bind(_ listener: @escaping ((T?) -> Void)){
        listener(value)
        self.listener = listener
    }
}
