//
//  Constraints.swift
//  SkyKit
//
//  Created by Skylar Schipper on 1/5/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation
import UIKit

infix operator <<|

public func <<|(lhv: UIView, rhv: NSLayoutConstraint) {
    lhv.addConstraint(rhv)
}

public func <<|(lhv: UIView, rhv: [NSLayoutConstraint]) {
    lhv.addConstraints(rhv)
}

public extension NSLayoutConstraint {
    /// Creates a set of constraints offset from the passed view's superview's edges
    ///
    /// - Parameters:
    ///   - view: The view to inset in the superview
    ///   - edges: The edges to offset
    ///   - offset: The ammount of the offset
    /// - Returns: The constraints
    public class func offset(view: UIView, edges: UIRectEdge, offset: CGFloat = 0.0) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []

        if edges.contains(.left) {
            let constraint = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: view.superview, attribute: .left, multiplier: 1.0, constant: offset)
            constraints.append(constraint)
        }

        if edges.contains(.right) {
            let constraint = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: view.superview, attribute: .right, multiplier: 1.0, constant: -offset)
            constraints.append(constraint)
        }

        if edges.contains(.top) {
            let constraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: view.superview, attribute: .top, multiplier: 1.0, constant: offset)
            constraints.append(constraint)
        }

        if edges.contains(.bottom) {
            let constraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: view.superview, attribute: .bottom, multiplier: 1.0, constant: -offset)
            constraints.append(constraint)
        }

        return constraints
    }

    public class func center(viewInSuperview view: UIView, offset: CGPoint = CGPoint.zero) -> [NSLayoutConstraint] {
        return [
            NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: view.superview, attribute: .centerX, multiplier: 1.0, constant: offset.x),
            NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: view.superview, attribute: .centerY, multiplier: 1.0, constant: offset.y)
        ]
    }
}
