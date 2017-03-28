//
//  ImageViewController.swift
//  Cassini
//
//  Created by Doug Wells on 3/26/17.
//  Copyright © 2017 Doug Wells. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate
{
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            
            scrollView.delegate = self  //sets delegate to self/ImageViewController (same as cntrl-drag to yellow box in storyboard)
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 3.0
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)

        }
    }
    
    
    
    //Mark: Model
    
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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private func fetchImage(){
        if let url = imageURL {
            
            spinner?.startAnimating()  //stops anytime var image is set
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url) //nil if throws
                if let imageData = urlContents, url == self?.imageURL {
                    
                    DispatchQueue.main.async {  //once data is back on the main queue
                        self?.image = UIImage(data: imageData)
                    }
                    
                }
            }

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageURL = URL(string: "http://stanford.edu/about/images/intro_about.jpg")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
    //create our Image View programatically
    //fileprivate makes private outside of this controller (ImageViewController)
    fileprivate var imageView = UIImageView(frame: CGRect.zero) //same as UIImageView()
    
    private var image: UIImage? {   //? b/c imageView.image can be nil
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            //careful.  scrollview might not be set yet.
            //optional chaining so it does nothing if it is not set
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
} //End Class ImageViewController

/*
extension ImageViewController: UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
*/
