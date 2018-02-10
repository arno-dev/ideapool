//
//  Token.swift
//  Idea Pool
//
//  Created by Arnaud Phommasone on 9/02/18.
//  Copyright © 2018 Arnaud Phommasone. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import Realm
import RealmSwift

class Token: Object, Mappable {
    @objc dynamic var jwt: String = ""
    @objc dynamic var refresh_token: String = ""
    
    required convenience init?(map: Map){
        self.init()
    }
    
    func mapping(map: Map) {
        jwt <- map["jwt"]
        refresh_token <- map["refresh_token"]
    }
}
