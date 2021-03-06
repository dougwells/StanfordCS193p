//
//  L10 Notes - Core Data.swift
//  
//
//  Created by Doug Wells on 4/3/17.
//
//

/*
 Core Data
 
 -- if forgot to click "Core Data" on project setup --
 If project did NOT initially have Core Data
 Set up a dummy project w/Core Data
 In AppDelegate.swift, copy section marked Core Data
 Also copy line above it w/saveContext from func applicationWillTerminate
 copy this code into AppDelegate of project w/o Core Data
 be sure to import CoreData
 change name of NSPersistantContainer
 let container = NSPersistentContainer(name: "SmashModel")
 create the data model itself
 File-New File - Core Data - Data Model
 name whatever (SmashModel)
 Done - That is it!  Easy

 ----
 
 Set up Model in storyboard like interface
 Add Entities (like classes)
 Add Attributes (like vars/prop w/in Entitites)
 Remember to set Type
 Create relationships (each side)
 
 
 How access (insert, delete, edit, etc) the model?
 Need the var viewContext from NSManagedObjectContext
 get this from NSPersistantContainer
 (UIApplication.shared.delegate as! AppDelegate).persistentContainer
 
 Interacting w/database
 Inserting Objects into the database
 (sloppy. better way below)
 let context = AppDelegate.viewContext
 let tweet: NSManagedObject =
 NSEntitityDescription.insertNewObject(forEntityName: "Tweet", into: context)
 
 
 Note: All attributes (vars) are set to ‘nil’ unless set up default values (when setup in storyboard interface)
 
 
 Better way
 Model Storyboard - Entity - Inspector (RHS panel)
 Module - select “Current Product Module”
 Codgen
 Manual/None - we code (like above)
 Class Definition - default
 “Category/Extension” - Paul’s sugg.
 Since extension, we write the class
 
 
 New File (Cocoa Touch Class)
 Name:  EXACTLY the same as the Entity
 Subclass of NSManagedObject
 Note: All Entities are subclasses of NSManagedObject
 must “import CoreData” in this file
 
 
 Now, code to create new tweets is much cleaner
 let context = AppDelegate.viewContext
 if let tweet = Tweet(context: context) {
	tweet.text = "140 characters of pure joy!"
	tweet.created = Date()
	let joe = TwitterUser(context: tweet.managedObjectContext)
	joe.addToTweets(tweet)
	tweet.tweeter = joe 	//happens automagically for us (see below)
	tweet.tweeter.name = "Joe Schmoe"
 }
 
 Why better?
 Avoids NSEntityDescription method
 maintains database integrity.  If change one side of Relationship, other side changes
 
 
 Deletion
 managedObjectContext.delete(_ object: tweet)
 func prepareForDeletion(){ … }  // called just before delete
 
 
 MUST SAVE or data/changes are lost
 .save() can throw errors
 code
 do {
	try context.save() {
 
	} catch {
 //handle error
	}
 }
 
 === Queries ===
 Querying the database
 Do queries using NSFetchRequest
 3 parts to a NSFetchRequest
 Entity to fetch - returns an array of fetched objects
 NSSortDescriptors - order of fetched array
 NSPredicate - which of th Entities to fetch
 Optional part.  Default is all of them
 Code example
 let request: NSFetchRequest<Tweet> = Tweet.fetchRequest() //rare case. Swift can’t infer type
 request.sortDescriptors = [sortDesc1, sortDesc2, ...]
 request.predicate = …
 
 ----
 Example:
 let request: NSFetchRequest<Tweet> = Tweet.fetchRequest() //fetches ALL tweets
 
 let sortDescriptor = NSSortDescriptor(			//Sorts returning array
	key: “twitterUser”,
 ascending: true,
 selector: #selector(NSString.localizedStandardCompare(_:))
 //what method to do sort?
 //usually just “compare” but strings have lots of options (one above is common)
 //Must be exposed to the Obj-C runtime thus NSString not String
 //Optional.  Default is “compare” (greater than, less than, same)
 //Array of sort descr b/c sort by one thing then another (first then last name)
 
 
 NSPredicate		//Find tweets that meet criteria.  Use %@ for search term (see docs)
 //Ultimately, Swift builds a Sequel statement to do the fetch
 
--- MultiThreading & Core Data ---
 Multi-Thread searches using Core Data
 normally not a problem Core Data is fast - main thread OK
 AppDelegate.viewContext is done on Main Queue (view)
 Question is how to do search off Main queue?
 NSManagedObjectContext is NOT THREADSAFE
 a context can ONLY BE USED ON THE THREAD IT IS CREATED ON.  So … how do multi-thread searches?
 Each database can have multiple contexts
 But, need to be sure each context stays on the que it was created it.  How ensure this?
 put all code in context.performBlock { … }
 or context.performBlockAndWait { ... }
 Generally good idea to wrap all Core Data code in one of these two block
 How get off Main Queue (for context other than .viewContext?)
 Use to be hard.  Now easy b/c new iOS10 method
 persistantContainer has a simple method
 
 
 AppDelegate.persistantContainer.performBackgroundTask { context in
	//perform background task w/passed in context
	try? context.save()	//DON’T FORGET TO SAVE!!
 }
 
 Core Data and UITableView (match made in heaven)
 Core Data can generate lots of data
 UITableView can display this data nicely
 NSFetchedResultsController (NSFRC)
 hooks NSFetchRequest UITableViewController
 if something in DB changes, updates the view
 usually have an NSFRC var in UIViewController
 use NSFRC as UITableViewDataSource
 How implement.  See code in 2 slides below
 create an NSFRC variable
 numberOfSections, numberOfRows
 cellForRowAt

 New Files & Inheriting
 When create Cocoa Class, can inherit from Apple’s supplied UIView, UIViewController, NSManagedObject, etc
 On pull down menu
 
 
 Or, from files/classes we have custom coded like TwiterTableViewController
 Simply type in that name instead of pull-down menu choices

--- Core Data Thread Safety ---
 (making sure methods run on correct que)
 How call a function when on backgroundQue but run that method on the main que?  context.perform { … }
 Some people say always wrap your function in context.perform block so it ALWAYS funs on correct que regardless of where it is called.
 
 //want to update DB OFF OF the main Que
 private func updateDatabase(with tweets: [Twitter.Tweet]) {
 print("Starting DB Load")
 container?.performBackgroundTask{ [weak self] context in
 for twitterInfo in tweets {
 _ = try? Tweet.findOrCreateTweet(matching: twitterInfo, in: context)
 }
 try? context.save()
 print("new tweets saved")
 self?.printDatabaseStatistics() //called off main que
 }
 }
 
 private func printDatabaseStatistics() {
 if let context = container?.viewContext {
 context.perform {
 //perform on the “right que” for that context
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

 
 
 
 
*/
