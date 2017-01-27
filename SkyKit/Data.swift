//
//  Data.swift
//  SkyKit
//
//  Created by Skylar Schipper on 1/27/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

public extension Data {
    /// The base16 representation of the data.
    public var base16: String {
        return self.map() { String(format: "%02hhx", $0) }.joined()
    }
}
