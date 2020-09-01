//
//  FetchImages.swift
//  Eatzy
//
//  Created by HankLee on 31/8/20.
//  Copyright © 2020 Michael Yue. All rights reserved.
//

import Foundation
import UIKit

class FetchURLImages {
    
    static func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
            
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error fetching the image! 😢")
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
            
        dataTask.resume()
    }
    
    static func setImageToImageView(imageUrl urlString: String, imageView: UIImageView) {
        fetchImage(from: urlString) {(imageData) in
            if let data = imageData {
                // referenced imageView from main thread
                // as iOS SDK warns not to use images from
                // a background thread
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            } else {
                    // show as an alert if you want to
                print("Error loading image");
            }
        }
    }
    
}
