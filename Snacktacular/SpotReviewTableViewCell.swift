//
//  SpotReviewTableViewCell.swift
//  Snacktacular
//
//  Created by Derek Marble on 4/11/22.
//

import UIKit

class SpotReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewTitleLabel: UILabel!
    
    @IBOutlet weak var reviewTextLabel: UILabel!
    
    var review: Review! {
        didSet {
            reviewTitleLabel.text = review.title
            reviewTextLabel.text = review.text
        }
    }
}
