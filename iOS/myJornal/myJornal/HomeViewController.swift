//
//  ViewController.swift
//  myJornal
//
//  Created by Grazielli Berti on 26/03/22.
//

import UIKit

class HomeViewController: UITableViewController {
    //MARK: - Variable
    var posts = [Post]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            printContent("Delete Post")
        }
    }
    
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
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }
    
    @objc fileprivate func handleCreatePost() {
        Service.shared.createPost(title: "iOS Title", body: "iOS Body") { err in
            if let err = err {
                print("Failed to create post object: ", err)
                return 
            }
            
            print("Finish Create Post")
            self.fetchPost()
        }
    }
}

