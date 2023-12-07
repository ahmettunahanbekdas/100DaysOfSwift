//
//  FeedViewController.swift
//  Project 21- BasicInstagramClone
//
//  Created by Ahmet Tunahan Bekdaş on 5.12.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - @IBOutlet and Variables
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var userLikeArray = [Int]()
    var userImageArray = [String]()
    var documentIDArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getFireStoreData()
        
    }
    
    
    //MARK: - getFireStoreData()
    
    func getFireStoreData() {
        let fireStoreDataBase = Firestore.firestore()
        
        fireStoreDataBase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { [self] snapShot, error in
            if error != nil {
                print("DATABASE IS EMPTY")
            }else {
                if snapShot?.isEmpty != true && snapShot != nil {
                    
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.userLikeArray.removeAll(keepingCapacity: false)
                    self.userImageArray.removeAll(keepingCapacity: false)
                    
                    
                    for document in snapShot!.documents {
                        
                         let documentID = document.documentID
                            self.documentIDArray.append(documentID)
                        print(documentIDArray)
                        if let postedBy = document.get("postBy") as? String{
                            self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String{
                            self.userCommentArray.append(postComment)
                        }
                        if let postLike = document.get("like") as? Int {
                            self.userLikeArray.append(postLike)
                        }
                        if let postImage = document.get("imageUrl") as? String{
                            self.userImageArray.append(postImage)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    
    //MARK: - numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    
    //MARK: - cellForRowAt
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.userView.text = userEmailArray[indexPath.row]
        cell.likeCountLabel.text = String(userLikeArray[indexPath.row])
        cell.customImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        cell.documentIDLabel.text = documentIDArray[indexPath.row]
        return cell
    }
    
}
