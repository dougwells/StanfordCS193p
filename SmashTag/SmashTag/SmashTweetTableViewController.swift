//
//  SmashTweetTableViewController.swift
//  SmashTag
//
//  Created by Doug Wells on 4/8/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit
import Twitter
import CoreData

class SmashTweetTableViewController: TweetTableViewController {
    
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    
    override func insertTweets(_ newTweets: [Twitter.Tweet]) {
        super.insertTweets(newTweets)
        updateDatabase(with: newTweets)
    }
    
    //want to update DB OFF OF the main Que
    private func updateDatabase(with tweets: [Twitter.Tweet]) {
        print("Starting DB Load")
        container?.performBackgroundTask{ [weak self] context in
            for twitterInfo in tweets {
                _ = try? Tweet.findOrCreateTweet(matching: twitterInfo, in: context)
            }
            try? context.save()
            print("new tweets saved")
            self?.printDatabaseStatistics()
        }
    }
    
    private func printDatabaseStatistics() {
        if let context = container?.viewContext {
            context.perform { //perform on 'right' que for this context
                if Thread.isMainThread {
                    print("on main thread")
                } else {
                    print("off main thread")
                }
                // good way to count
                if let tweeterCount = try? context.count(for: TwitterUser.fetchRequest()) {
                    print("\(tweeterCount) Twitter users")
                }
            }
        }
    }
}
