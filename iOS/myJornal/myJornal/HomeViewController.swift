//
//  ViewController.swift
//  myJornal
//
//  Created by Grazielli Berti on 26/03/22.
//

import UIKit

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Post"
        navigationItem.rightBarButtonItem = .init(title: "Create Post",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(handleCreatePost)
        )
    }
    
    @objc fileprivate func handleCreatePost() {
       print("Create Post...")
    }
}

