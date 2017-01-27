//
//  Locking.swift
//  SkyKit
//
//  Created by Skylar Schipper on 1/26/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

public protocol Locking {
    @discardableResult
    func lock() -> Bool

    @discardableResult
    func unlock() -> Bool
}

public extension Locking {
    public final func sync<T>(_ block: (Void) throws -> (T)) rethrows -> T {
        self.lock()
        defer {
            self.unlock()
        }
        return try block()
    }
}
