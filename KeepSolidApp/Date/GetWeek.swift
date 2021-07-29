//
//  GetWeek.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/28/21.
//

import Foundation

func getWeek(locale: String)->[String]{
    var week = Array<String>()
    let weekDayNumber = Date().dayNumberOfWeek()!
    for i in 0...6{
        let currentday = Date().addingTimeInterval(TimeInterval(86400*i-86400*(weekDayNumber-1)+86400))
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.dateFormat = "dd MMMM yyyy"
        formatter.locale = Locale(identifier: locale)
        let dateString = formatter.string(from: currentday)
        week.append(dateString)
    }
    return week
}
