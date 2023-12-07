//
//  FeedCell.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 7.12.2023.
//

import UIKit

class FeedCell: UITableViewCell {


    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var userView: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {

    }
    
    
    @IBAction func likeButton(_ sender: Any) {
               print("Tapped Like")
    }
    

}
