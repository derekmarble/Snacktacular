//
//  SpotTableViewCell.swift
//  Snacktacular
//
//  Created by Derek Marble on 3/31/22.
//

import UIKit
import CoreLocation

class SpotTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var currentLocation: CLLocation!
    var spot: Spot! {
        didSet {
            nameLabel.text = spot.name
            let averageRating = ((spot.averageRating * 10).rounded())/10
            ratingLabel.text = "Avg. Rating: \(averageRating)"
            
            guard let currentLocation = currentLocation else {
                distanceLabel.text = "Distance: -.-"
                return
            }
            let distanceInMeters = spot.location.distance(from: currentLocation)
            let distanceInMiles = ((distanceInMeters * 0.00062137) * 10).rounded() / 10
            distanceLabel.text = "Distance: \(distanceInMiles) miles"
        }
    }
}
