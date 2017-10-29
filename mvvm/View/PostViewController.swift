//
//  PostViewController.swift
//  mvvm
//
//  Created by Arthur Rocha on 28/10/17.
//  Copyright © 2017 DatIn. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchingLabel: UILabel!
    
    //MARK: - Variables
    let postViewModel : PostViewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postViewModel.getAll {
            self.searchingLabel.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
}

extension PostViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = postViewModel.posts[indexPath.row].title!
        
        return cell
    }
}
