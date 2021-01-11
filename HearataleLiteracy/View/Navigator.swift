//
//  Navigator.swift
//  HearataleLiteracy
//
//  Created by Andrew Jeffers on 11/13/20.
//  Copyright © 2020 Andrew Jeffers. All rights reserved.
//

import UIKit

public class Navigator: UINavigationController {
    private struct Metrics {
        /// Image height/width for Large NavBar state
        static let ImageSizeForLargeState: CGFloat = 40
        /// Margin from right anchor of safe area to right anchor of Image
        static let ImageRightMargin: CGFloat = 16
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 12
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
        /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
        /// Height of NavBar for Small state. Usually it's just 44
        static let NavBarHeightSmallState: CGFloat = 44
        /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
        static let NavBarHeightLargeState: CGFloat = 96.5
        static let Spacing: CGFloat = 52
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        navigationBar.prefersLargeTitles = true
    }
    
//    public func setTitle(image: UIImage?) {
//        navigationItem.titleView = UIImageView(image: image)
//    }
    
    public func add(view: UIView, index: Int = 0) {
        navigationBar.addSubview(view)
        view.layer.cornerRadius = Metrics.ImageSizeForLargeState / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Metrics.ImageRightMargin - Metrics.Spacing * CGFloat(index)),
            view.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Metrics.ImageBottomMarginForLargeState),
            view.heightAnchor.constraint(equalToConstant: Metrics.ImageSizeForLargeState),
            view.widthAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    public func moveAndResize(image view: UIView, index: Int = 0) {
        let coeff: CGFloat = {
            let delta = navigationBar.frame.height - Metrics.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Metrics.NavBarHeightLargeState - Metrics.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = Metrics.ImageSizeForSmallState / Metrics.ImageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        // Value of difference between icons for large and small states
        let sizeDiff = Metrics.ImageSizeForLargeState * (1.0 - factor) // 8.0

        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Metrics.ImageBottomMarginForLargeState - Metrics.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Metrics.ImageBottomMarginForSmallState + sizeDiff))))
        }()

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        view.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
}
