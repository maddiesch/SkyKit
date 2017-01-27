//
//  AutoLayout.swift
//  SkyKit
//
//  Created by Skylar Schipper on 10/29/16.
//  Copyright © 2016 Skylar Schipper. All rights reserved.
//

import UIKit

public protocol AutoLayout {
    var translatesAutoresizingMaskIntoConstraints: Bool { get set }

    init(frame: CGRect)
}

public extension AutoLayout {
    /// Create a new view and set its `translatesAutoresizingMaskIntoConstraints` to false.
    ///
    /// - Returns: A new view instance.
    static func createAutoLayoutView() -> Self {
        var view = Self.init(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

extension UIView : AutoLayout { }
