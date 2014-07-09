
import UIKit

class d3_Map {
    
    var d3_map_prefix = "\x00"
    var store: Dictionary<String, NSNumber> = [:]
    
    init() {}
    
    /**
     * Returns true if and only if this map has an entry for the specified key string. 
     * Note: the value may be null or undefined.
     */
    func has(key: String) -> Bool? {
        var value = self.store[key]
        return value ? true : nil
    }
    
    /**
     * Returns the value for the specified key string. 
     * If the map does not have an entry for the specified key, returns undefined.
     */
    func get(key: String) -> NSNumber? {
        return self.store[key]
    }
    
    /**
     * Sets the value for the specified key string; returns the new value.
     * If the map previously had an entry for the same key string, 
     * the old entry is replaced with the new value.
     */
    func set(key: String, value: NSNumber) -> NSNumber {
        self.store[key] = value
        return value
    }
    
}