//
//  User.swift
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

class User: Object, Mappable {
    @objc dynamic var email: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var avatar_url: String = ""
    
    required convenience init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        email <- map["email"]
        name <- map["name"]
        avatar_url <- map["avatar_url"]
    }
}
