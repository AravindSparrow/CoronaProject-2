//
//  JsonModels.swift
//  CoronaProject
//
//  Created by Jaffar on 03/12/20.
//  Copyright © 2020 Jaffar. All rights reserved.
//

import Foundation
struct Root : Codable  {
    var exceededTransferLimit : Bool?
    var features : [Feature]?
    var fields : [Field]?
    var geometryType : String?
    var globalIdFieldName : String?
    var objectIdFieldName : String?
    var spatialReference : SpatialReference?
    var uniqueIdField : UniqueIdField?
}
struct UniqueIdField : Codable {
    var isSystemMaintained : Bool?
    var name : String?
}
struct SpatialReference : Codable {
    var latestWkid : Int?
    var wkid : Int?
}
struct Field : Codable {
    var alias : String?
    var defaultValue : Int?
    var domain : Int?
    var name : String?
    var sqlType : String?
    var type : String?
}
struct Feature : Codable {
    public var attributes : Attribute?
}
struct Attribute : Codable {
    var CumCase : Int?
    var CumDeath : Int?
    var OBJECTID : Int?
}
