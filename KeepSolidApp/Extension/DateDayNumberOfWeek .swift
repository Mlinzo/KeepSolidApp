//
//  Date.dayNumberOfWeek .swift
//  KeepSolidApp
//
//  Created by user201878 on 7/27/21.
//

import Foundation

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
