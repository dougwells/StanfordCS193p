//
//  TweetTableViewController.swift
//  SmashTag
//
//  Created by Doug Wells on 3/30/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit
import Twitter



class TweetTableViewController: UITableViewController, UITextFieldDelegate {
    
    private var tweets = [Array<Twitter.Tweet>]() {
        didSet{
            //print(tweets)
        }
    }
    
    var searchText: String? {
        didSet {
            searchTextField?.text = searchText
            searchTextField?.resignFirstResponder() // hide keyboard
            lastTwitterRequest = nil
            tweets.removeAll()
            tableView.reloadData()  //reloads entire table. OK since model empty
            searchForTweets()
            title = searchText
        }
    }
    
    func insertTweets(_ newTweets: [Twitter.Tweet]) {
        self.tweets.insert(newTweets, at: 0) //Changed model, must reload
        //just want to reload the inserted tweets
        self.tableView.insertSections([0], with: .fade)

    }
    
    private func twitterRequest() -> Twitter.Request? {
        if let query = searchText, !query.isEmpty {
            return Twitter.Request(search: "\(query) -filter:safe -filter:retweets", count: 100)
        }
        return nil
    }
    
    private var lastTwitterRequest: Twitter.Request?
   
    private func searchForTweets() {
        if let request = lastTwitterRequest?.newer ?? twitterRequest() { //done off of maine queue
            lastTwitterRequest = request
            request.fetchTweets{ [weak self] newTweets in
                DispatchQueue.main.async {  //get back on main queue to do UI work below
                    if request == self?.lastTwitterRequest {
                        self?.insertTweets(newTweets)
                    }
                    self?.refreshControl?.endRefreshing()
                }
            }
        } else {
            self.refreshControl?.endRefreshing()
        }
    }
    

    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchTextField {
            searchText = searchTextField.text
        }
        return true
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        searchForTweets()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        searchText = "@paulg"
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tweet", for: indexPath)
        let tweet: Twitter.Tweet = tweets[indexPath.section][indexPath.row]
        
        //configure the cell (Prototype cell = subtype)
//        cell.textLabel?.text = tweet.text
//        cell.detailTextLabel?.text = tweet.user.name
        
        //configure the cell (Prototype cell = "custom")
        
        if let tweetCell = cell as? TweetTableViewCell {
            tweetCell.tweet = tweet
            
        }
        
        return cell
        }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(tweets.count - section)"
    }
}
