//
//  SpotPhotoCollectionViewCell.swift
//  Snacktacular
//
//  Created by Derek Marble on 4/23/22.
//

import UIKit
import SDWebImage

class SpotPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var spot: Spot!
    var photo: Photo! {
        didSet {
            
            if let url = URL(string: self.photo.photoURL) {
                self.photoImageView.sd_imageTransition = .fade
                self.photoImageView.sd_imageTransition?.duration = 0.2
                self.photoImageView.sd_setImage(with: url)
            } else {
                print("url didn't work \(self.photo.photoURL)")
                self.photo.loadImage(spot: self.spot) { success in
                    self.photo.saveData(spot: self.spot) { success in
                        print("image updated with url \(self.photo.photoURL)")
                    }
                }
            }
            
            
        }
    }
    
}
