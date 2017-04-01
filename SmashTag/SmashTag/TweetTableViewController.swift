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
            print(tweets)
        }
    }
    
    var searchText: String? {
        didSet {
            tweets.removeAll()
            tableView.reloadData()  //reloads entire table. OK since model empty
            searchForTweets()
            title = searchText
        }
    }
    
    private func twitterRequest() -> Twitter.Request? {
        if let query = searchText, !query.isEmpty {
            return Twitter.Request(search: query, count: 100)
        }
        return nil
    }
    
    private var lastTwitterRequest: Twitter.Request?
   
    private func searchForTweets() {
        if let request = twitterRequest() { //done off of maine queue
            lastTwitterRequest = request
            request.fetchTweets{ [weak self] newTweets in
                DispatchQueue.main.async {  //get back on main queue to do UI work below
                    if request == self?.lastTwitterRequest {
                        self?.tweets.insert(newTweets, at: 0) //Changed model, must reload
                        //just want to reload the inserted tweets
                        self?.tableView.insertSections([0], with: .fade)
                    }
                }
            }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText = "#stanford"
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
        let tweet: Tweet = tweets[indexPath.section][indexPath.row]
        cell.textLabel?.text = tweet.text
        cell.detailTextLabel?.text = tweet.user.name
        return cell
        }
}
