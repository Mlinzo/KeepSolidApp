//
//  TodayString.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/28/21.
//

import Foundation

func todayString()->String{
    let today =  DateFormatter()
    today.dateStyle = .medium
    today.timeStyle = .none
    return today.string(from: Date())
}
