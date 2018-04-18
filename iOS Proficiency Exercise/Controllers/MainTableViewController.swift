//
//  MainTableViewController.swift
//  iOS Proficiency Exercise
//
//  Created by Nick Moignard on 17/4/18.
//  Copyright © 2018 Nick Moignard. All rights reserved.
//

import UIKit

/// Main Application Controller
class MainTableViewController: UITableViewController {
    // Mark: Data Members
    let networkManager = NetworkManager()
    
    /// Data array to populate the table view
    var posts: [Post] = []
    
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        
        // Configure the cell...
        cell.titleLabel.text = post.title
        cell.descriptionLabel.text = post.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    // MARK: - Helper Methods
    private func setTitle(title: String) {
        if let nav = self.navigationController, let top = nav.navigationBar.topItem {
            top.title = title
        }
    }
    
    private func setupView() {
        
        // Get data to populate table view with
        networkManager.getJSON {
            response in
            if let (title, _posts) = response {
                self.setTitle(title: title)
                self.posts = _posts
                self.tableView.reloadData()
            }
        }
        
        // Retain cell selection
        self.clearsSelectionOnViewWillAppear = false
        
        // Resize table views cells automatically
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 140
    }
}
