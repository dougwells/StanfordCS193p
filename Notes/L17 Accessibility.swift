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
 
 UIAccessibility Protocol
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
 
 
 
*/
