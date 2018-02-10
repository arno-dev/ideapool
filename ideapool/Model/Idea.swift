//
//  Idea.swift
//  ideapool
//
//  Created by Arnaud Phommasone on 10/02/18.
//  Copyright © 2018 Arnaud Phommasone. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import Realm
import RealmSwift

class Idea: Object, Mappable {
    @objc dynamic var id: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var impact: Int = 0
    @objc dynamic var ease: Int = 0
    @objc dynamic var confidence: Int = 0
    @objc dynamic var average_score: Double = 0.0
    @objc dynamic var created_at: Int = 0
    
    required convenience init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        content <- map["content"]
        impact <- map["impact"]
        ease <- map["ease"]
        confidence <- map["confidence"]
        average_score <- map["average_score"]
        created_at <- map["created_at"]
    }
}

