//
//  ViewController.swift
//  MovieListApp
//
//  Created by shanmuga srinivas on 21/04/24.
//

import UIKit

class ViewController: UIViewController {

    //IBoutlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicater: UIActivityIndicatorView!
    // viewModel
    var mainViewModel: MainViewModel = MainViewModel()
    var cellDataSource:[Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mainViewModel.getData()
    }
    
    func configView() {
        setUpTableView()
    }
    
    func bindViewModel() {
        mainViewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicater.startAnimating()
                } else {
                    self.activityIndicater.stopAnimating()
                }
            }
        }
        
        mainViewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
}


