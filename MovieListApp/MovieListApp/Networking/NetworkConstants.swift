//
//  NetworkConstants.swift
//  MovieListApp
//
//  Created by shanmuga srinivas on 21/04/24.
//

import Foundation

class NetworkConstants {
    
    static var shared = NetworkConstants()
    
    public var apiKey: String {
        get {
            //https://www.themoviedb.org/
            //Put your own API key here
            return "b1f5861b70953b2dd649ff0cea5d8f83"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
