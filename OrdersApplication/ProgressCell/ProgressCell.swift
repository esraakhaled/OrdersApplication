//
//  ProgressCell.swift
//  OrdersApplication
//
//  Created by Esraa Khaled   on 24/09/2022.
//

import UIKit
import FlexibleSteppedProgressBar

class ProgressCell: UITableViewCell , FlexibleSteppedProgressBarDelegate{
    
    @IBOutlet weak var view: UIView!
    var progressBarWithoutLastState: FlexibleSteppedProgressBar!
    var back = UIColor(red: 52.0 / 255.0, green: 165.0 / 255.0, blue: 19.0 / 255.0, alpha: 1.0)
    var progressColor = UIColor(red: 52.0 / 255.0, green: 165.0 / 255.0, blue: 19.0 / 255.0, alpha: 1.0)
    var textColorHere = UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
    var maxIndex = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        setupProgressBarWithoutLastState()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupProgressBarWithoutLastState() {
        progressBarWithoutLastState = FlexibleSteppedProgressBar()
        progressBarWithoutLastState.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressBarWithoutLastState)
        
        // iOS9+ auto layout code
        let horizontalConstraint = progressBarWithoutLastState.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = progressBarWithoutLastState.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: 0
        )
        let widthConstraint = progressBarWithoutLastState.widthAnchor.constraint(equalToConstant: 300)
        let heightConstraint = progressBarWithoutLastState.heightAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        // Customise the progress bar here
        configureProgressBar()
        
    }
    func configureProgressBar() {
        progressBarWithoutLastState.numberOfPoints = 3
        progressBarWithoutLastState.lineHeight = 3
        progressBarWithoutLastState.radius = 20
        progressBarWithoutLastState.progressRadius = 25
        progressBarWithoutLastState.progressLineHeight = 3
        progressBarWithoutLastState.delegate = self
        progressBarWithoutLastState.selectedBackgoundColor = progressColor
        progressBarWithoutLastState.selectedOuterCircleStrokeColor = backgroundColor
        progressBarWithoutLastState.currentSelectedCenterColor = progressColor
        progressBarWithoutLastState.stepTextColor = textColorHere
        progressBarWithoutLastState.currentSelectedTextColor = progressColor
        progressBarWithoutLastState.currentIndex = 0
    }
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     didSelectItemAtIndex index: Int) {
        progressBar.currentIndex = index
        if index > maxIndex {
            maxIndex = index
            progressBar.completedTillIndex = maxIndex
        }
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     canSelectItemAtIndex index: Int) -> Bool {
        return true
    }
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if  progressBar == self.progressBarWithoutLastState {
            if position == FlexibleSteppedProgressBarTextLocation.bottom {
                switch index {
                    
                case 0: return "Ended request"
                case 1: return "accepted request"
                case 2: return "under review"
                default: return "Date"
                }
                
            } else if position == FlexibleSteppedProgressBarTextLocation.center {
                switch index {
                    
                case 0: return "➖"
                case 1: return "➖"
                case 2: return "☑️"
                default: return "0"
                    
                }
            }
        }
        return ""
    }
}
