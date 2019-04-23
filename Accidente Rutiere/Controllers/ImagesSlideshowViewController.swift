//
//  ImagesSlideshowViewController.swift
//  Accidente Rutiere
//
//  Created by Paul-Cristian Vasile on 20/04/2019.
//  Copyright © 2019 Paul-Cristian Vasile. All rights reserved.
//

import UIKit
import ImageSlideshow

class ImagesSlideshowViewController: UIViewController{
    
    var images = [UIImage()]
    
    @IBOutlet weak var imagesView: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var array: [ImageSource] = [ImageSource(image: images[0])]
        
        for i in 1...(images.count-1)
        {
            //print(images.count)
            array.append(ImageSource(image: images[i]))
        }
        
        array.remove(at: 0)
        
        imagesView.setImageInputs(array)
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
        pageIndicator.pageIndicatorTintColor = UIColor.black
        imagesView.pageIndicator = pageIndicator
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
