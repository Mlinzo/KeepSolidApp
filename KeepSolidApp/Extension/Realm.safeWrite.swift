//
//  File.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/24/21.
//

import Foundation
import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
