//
//  FeedCell.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 7.12.2023.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {
    
    
    //MARK: - @IBOutlet
    
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var userView: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var documentIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    
    //MARK: - likeButton
    
    @IBAction func likeButton(_ sender: Any) {
        print("Tapped Like")
        let fireStoreDataBase = Firestore.firestore()
        
        
        if let likeCount = Int(likeCountLabel.text!){
            let likeStore =  ["like" : likeCount + 1] as! [String : Any]
            fireStoreDataBase.collection("Posts").document(documentIDLabel.text ?? "Error").setData(likeStore, merge: true)
            print(likeStore)

        }
        
        
    }
    
}
