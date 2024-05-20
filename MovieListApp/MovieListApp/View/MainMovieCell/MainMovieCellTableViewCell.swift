//
//  MainMovieCellTableViewCell.swift
//  MovieListApp
//
//  Created by shanmuga srinivas on 01/05/24.
//

import UIKit

class MainMovieCellTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var packVIew: UIView!
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        packVIew.addBoarder(.label, 1)
        packVIew.round()
        
        ImageView.round(5)
        
        
    }
    
    

}
