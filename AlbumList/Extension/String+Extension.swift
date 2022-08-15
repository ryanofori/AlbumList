//
//  String+Extension.swift
//  AlbumList
//
//  Created by Ryan Ofori on 8/14/22.
//

import Foundation
import UIKit
extension String {
    
    var toImage: UIImage {
        if let imageURL = URL(string: self) {
            if let data = try? Data(contentsOf: imageURL) {
                let image = UIImage(data: data)
                if let imageData = image {
                    return imageData
                }
                return UIImage()
            }
        }
        return UIImage()
    }
}
