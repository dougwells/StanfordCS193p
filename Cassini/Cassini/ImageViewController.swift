//
//  ImageViewController.swift
//  Cassini
//
//  Created by Doug Wells on 3/26/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)

        }
    }
    
    var imageURL: URL? {
        didSet {
            image = nil     //clears out any image we might have already
            
            /*
            if not nil, means we are on screen so cannot rely on viewWillAppear to fetchImage.  Must do it here instead
            */
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private func fetchImage(){
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url) //nil if throws
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageURL = URL(string: "http://stanford.edu/about/images/intro_about.jpg")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
        
    }
    
    
    //create our Image View programatically
    private var imageView = UIImageView(frame: CGRect.zero) //same as UIImageView()
    
    private var image: UIImage? {   //? b/c imageView.image can be nil
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    
}
