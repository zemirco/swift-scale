
import UIKit

class Scale {
    
    var _domain: NSArray = [0, 1]
    var _range: NSArray = [0, 1]
    
    init() {
        
    }
    
    func domain(domain: NSArray) -> Self {
        self._domain = domain
        return self
    }
    
    func range(range: NSArray) -> Self {
        self._range = range
        return self
    }
    
    func linear() -> (c: NSNumber) -> NSNumber {
        return scale_bilinear(self._domain, range: self._range, uninterpolate: uninterpolate, interpolate: interpolate)
    }
    
    func mx(data: Array<NSNumber>) -> NSNumber {
        return data.reduce(Int.min, { max(Int($0), Int($1)) })
    }
    
    func interpolate(a: NSNumber, b: NSNumber) -> (c: NSNumber) -> NSNumber {
        var diff = b.doubleValue - a.doubleValue
        func test(c: NSNumber) -> NSNumber {
            return (a.doubleValue + diff) * c.doubleValue
        }
        return test
    }
    
    func uninterpolate(a: NSNumber, b: NSNumber) -> (c: NSNumber) -> NSNumber {
        var diff = b.doubleValue - a.doubleValue
        var re = diff != 0 ? 1 / diff : 0
        func test(c: NSNumber) -> NSNumber {
            return (c.doubleValue - a.doubleValue) * re
        }
        return test
    }
    
    func scale_bilinear(domain: NSArray, range: NSArray, uninterpolate: (a: NSNumber, b: NSNumber) -> (c: NSNumber) -> NSNumber, interpolate: (a: NSNumber, b: NSNumber) -> (c: NSNumber) -> NSNumber) -> (c: NSNumber) -> NSNumber {
        var uFn: (c: NSNumber) -> NSNumber = uninterpolate(a: domain[0] as NSNumber, b: domain[1] as NSNumber)
        var iFn: (c: NSNumber) -> NSNumber = interpolate(a: range[0] as NSNumber, b: range[1] as NSNumber)
        func test(d: NSNumber) -> NSNumber {
            return iFn(c: uFn(c: d))
        }
        return test
    }
    
}
