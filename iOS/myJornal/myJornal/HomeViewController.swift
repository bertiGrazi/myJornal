//
//  ViewController.swift
//  myJornal
//
//  Created by Grazielli Berti on 26/03/22.
//

import UIKit

class HomeViewController: UITableViewController {
    //MARK: - Variable
    var post = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Post"
        navigationItem.rightBarButtonItem = .init(title: "Create Post",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(handleCreatePost)
        )
        
        fetchPost()
    }
    
    fileprivate func fetchPost() {
        Service.shared.fetchPost { res in
            switch res {
            case .failure(let error):
                print("Failed to fetch post: ", error)
                
            case .success(let posts):
                print(posts)
            }
        }
    }
    
    @objc fileprivate func handleCreatePost() {
       print("Create Post...")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return post.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        return cell
    }
}

