//
//  ApiCaller.swift
//  MovieListApp
//
//  Created by shanmuga srinivas on 21/04/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}
class ApiCaller {
    static func getTrendingMovies(completionHandler: @escaping(_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
        
        let urlString = "https://jsonplaceholder.typicode.com/photos?"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, result, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
