//
//  L17 Accessibility.swift
//  
//
//  Created by Doug Wells on 5/19/17.
//
//

import Foundation

/*
 Guest lecturer from Apple's accessibility team
 
A) UIAccessibility Protocol
 
 1) Accessibility Traits Protocol
    5 Main Accessibility Traits
        isAccessibilityElement: Bool
        accessibilityLabel: String?
        accessibilityTraits: UIAccessibilityTraits
        accessibilityValue: String?
        accessibilityHint: String?
 
    Example 1:
        @IBOutlet weak var imageView: MyImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
 
            imageView.isAccessibilityElement = true
            imageView.accessibilityLabel = "My Image Label"
            imageView.accessibilityTraits = UIAccessibilityTraitImage
        }
 
    Better way to do example 1 above is with "get set" (w/all properties:)
 
        override var isAccessibilityElement: Bool {
            get {
                return true
            }
 
    Developer needs to review code/app to ensure flow makes sense to sight
    impaired user (example of trash & refresh icons not properly labeled.
        titleLabel.accessibilityTraits != UIAccessibilityTraitHeader
        shuffleButton.accessibilityLabel = "Shuffle"
        deleteButton.accessibilityLabel = "Delete"
 
 2) Accessibility Container Protocol
    UIAccessibilityElement(accessibilityContainer: self)
 
B) Color (for color blind users) - Uses color AND shape to convey meaning
C) Motion
D) Dynamic Type (user can make font larger)
    class func preferredFont(forTextStyle style: UIFontTextStyle) -> UIFont 
        8 distinct styles you can pass this method:
            Title1, Title2, Title3
            Headline, Body
            Callout, Subhead, Footnote
            Caption1, Caption2
 
        let label: UILabel
        required init?(coder aDecoder: NSCoder) {
            label = UILabel()
            label.numberOfLines = 0 //expand to whatever # of lines needed
            label.adjustsFontForContentSizeCategory = true
            label.font = UIFont.preferedFont(forTextStyle: .body)
        
            super.init(coder: aDecoder)
            addSubView(label)
        }
 
*/
