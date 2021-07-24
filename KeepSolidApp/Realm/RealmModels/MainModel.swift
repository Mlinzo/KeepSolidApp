//
//  MainModel.swift
//  KeepSolidApp
//
//  Created by user201878 on 7/22/21.
//

import Foundation
import RealmSwift

class MainModel: Object{
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var current: CurrentModel? = CurrentModel()
    @Persisted var daily: List<DailyModel> = List()
}
