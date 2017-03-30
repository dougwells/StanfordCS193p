//
//  readingAssigment3.swift
//  
//
//  Created by Doug Wells on 3/29/17.
//
//

/*
 
 TableViews - CS193p, L9
 How Create?
 Drag out TableViewController onto Main.storyboard
 Attribute Inspector
 Content
 Static - we have all our data & will input it via storyboard
 usually static content is Grouped
 Dynamic - data comes from a database
 
 
 Style
 Grouped (subgroups obvious visually)
 usually static datasets
 Plain
 
 
 Dynamic & Plain TableViews
 Prototype Cells
 “templates” - repeated for however many rows needed
 Attribute Inspector
 click on any cell
 Accessory - displays on rhs of cell
 Checkmark,
 Disclosure Indicator (grey arrow)
 use if segues to new view,
 Detail Disclosure (“i” in circle)
 Click on i → different segue than clicking on the row
 
 
 Style (Custom | Basic, Right Detail, Left Detail, Subtitle)
 Custom - design your own cell
 Caution: proper autolayout constraints so resize properly
 
 
 
 Can’t wire outlets from these rows to UITableViewController (b/c 100s of them)
 Instead wire up outlets to UIView that contains these UI elements/rows → UITableViewCell.
 UITableViewCell - Just like w/controller, need to subclass UITableViewCell to have outlets in it.
 File-New-File → CocoaTouch class
 select UITableViewCell
 name myTableViewCell
 click on cell - Identity Inspector -  myTableViewCell
 
 
 Recap
 Static cells UI Elements
 Outlets wired to UITableViewController
 Dynamic cells UI Elements
 Outlets wired to UITableViewCell containing them
 
 
 Example: Prototype cell (w/Style of “Subtitle” - see above. Set in Attribute Inspector)
 Making a view is expensive.  Prototype cell allows us to re-use cells that have rolled off screen
 Template for cell (UITableViewCell)
 Identifier - (attrib inspector). Tell TableView which prototype cell to use
 
 
 Example: Prototype cell w/Style of “Custom” (set in Attrib)
 
 
 Summary
 Set table view’s data source
 (set automatically w/UITableViewController)
 implement numberOfSections & numberOfRows
 implement cellForRowAt (above image)
 returns loaded up UITableViewCell

 Segue from row (or “accessory item” - arrow or circle-i at end of row) to a view
 control-drag from row to view
 black box appears.  “Selection Segue” or “Accessory Action”
 give segue a name (attrib inspector - Identifier)
 prepareForSeque (sender is UITableViewCell)
 
 
 
 TableView Delegate
 Focus is on how data is DISPLAYED
 NOT the data displayed - that dataSource’s job
 Also lets you watches for TableView activities
 cell “was Selected”, “should display”, etc
 lots of “will”/”did” methods offered by Delegate
 didSelectRowAt(indexPath: IndexPath) { …}
 accessoryButtonTappedForRowAt(indexPath: IndexPath)
 etc
 Usually dataSource and dataDelegate are same object
 the controller of the MVC that contains the UITableView
 Setting dataSource & dataDelegate is set up automagically for us if we use UITableViewController
 
 
 Controlling height of rows
 If use autolayout (ie, set constraints w/in UITableViewCell)
 BE SURE TO USE “ESTIMATE”
 Otherwise, if have 100k cells, does it for all of them
 With Estimate, only does it for cells in visible view area
 
 
 
 
 What if your model changes?
 TELL YOUR TABLEVIEW EVERY TIME YOU CHANGE YOUR MODEL
 If # sections/rows or display of a cell changes, tell the TableView
 Mantra: “Change your model, tell the TableView”
 
 
 func reloadData()
 BIG Hammer.  Goes back to how many sections/rows
 redraws cell UIViews. Expensive
 
 
 What if only changed 1 row (or a few rows)?
 func reloadRowsAt(indexPaths: [IndexPath] …

 
*/
