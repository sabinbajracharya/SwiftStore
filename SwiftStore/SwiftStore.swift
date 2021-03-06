//
//  SwiftStore.swift
//  SwiftStore
//
//  Created by Hemanta Sapkota on 4/05/2015.
//  Copyright (c) 2015 Hemanta Sapkota. All rights reserved.
//

import Foundation

open class SwiftStore {
  
  var db:Store!
  
  public init(storeName: String) {
    db = Store(dbName: storeName)
  }
  
  public subscript(key: String) -> String? {
    get {
      return db.get(key)
    }
    
    set(newValue) {
      db.put(key, value: newValue!)
    }
  }
  
  public func delete(key: String) -> Bool {
    return db.delete(key)
  }
  
  public func collect(key: String) -> [String] {
    return db.iterate(key) as! [String]
  }
    
  public func findKeys(key: String, limit: Int) -> [String] {
    return db.findKeys(key, limit: limit) as! [String]
  }
    
  public func find(matchingKeys: String, limit: Int) -> [String] {
    return db.find(matchingKeys: matchingKeys, limit: limit) as! [String]
  }
    
  public func findKeys(withIndex key: String) -> [String: String] {
    return db.findKeys(withIndex: key) as! [String: String]
  }

  
  public func deleteCollection(keys: [String]) -> Bool {
    return db.deleteBatch(keys)
  }
  
  public func close() {
    db.close()
  }
}
