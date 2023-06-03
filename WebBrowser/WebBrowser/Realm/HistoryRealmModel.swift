//
//  HistoryRealmModel.swift
//  WebBrowser
//
//  Created by admin on 18/5/23.
//

import Foundation
import RealmSwift

class HistoryRealmModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var created: String
    
    convenience init(name: String, created: String) {
        self.init()
        self.name = name
        self.created = created
    }
}
