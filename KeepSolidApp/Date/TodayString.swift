//
//  TodayString.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/28/21.
//

import Foundation

func todayString(locale:String)->String{
    let today =  DateFormatter()
    today.dateStyle = .long
    today.timeStyle = .none
    today.dateFormat = "dd MMMM yyyy"
    today.locale = Locale(identifier: locale)
    return today.string(from: Date())
}
