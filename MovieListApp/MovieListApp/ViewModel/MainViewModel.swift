//
//  MainViewModel.swift
//  MovieListApp
//
//  Created by shanmuga srinivas on 21/04/24.
//

import Foundation

class MainViewModel {
    
    var isLoading: ObserVable<Bool> = ObserVable(false)
    let cellDataSource:ObserVable<[Movies]> = ObserVable(nil)
    var dataSource:TrendingMoviesModel?

    func numberOfSections() -> Int {
        return 1
    }

    func numberOfRows(in section:Int) -> Int {
        return self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        ApiCaller.getTrendingMovies { [weak self] result in
           // self?.isLoading.value = false
            switch result {
            case.success(let data):
                print("top trending counts \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    func getMovietitles(_ movie: Movies) -> String {
        return movie.name ?? movie.title ?? ""
    }
}
