
import UIKit

class Scale {
    
    var domain: NSArray = []
    var range: NSArray = []
    
    init(domain: NSArray = [0, 1], range: NSArray = [0, 1]) {
        self.domain = domain
        self.range = range
    }
    
    func linear() -> (c: NSNumber) -> NSNumber {
        return scale_bilinear(self.domain, range: self.range, uninterpolate: uninterpolate, interpolate: interpolate)
    }
    
    func ordinal() -> (c: AnyObject) -> AnyObject? {
        return scale_ordinal
    }
    
    func scale_ordinal(c: AnyObject) -> AnyObject? {
        // find index for c in first array
        println(self.domain)
        println(c)
        var test = self.domain.indexOfObject(String(c as NSString))
        println("test: \(test)")
        
        if c.integerValue < self.range.count {
            return self.range[c.integerValue]
        }
        return nil
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
        var u: (c: NSNumber) -> NSNumber = uninterpolate(a: domain[0] as NSNumber, b: domain[1] as NSNumber)
        var i: (c: NSNumber) -> NSNumber = interpolate(a: range[0] as NSNumber, b: range[1] as NSNumber)
        func test(d: NSNumber) -> NSNumber {
            return i(c: u(c: d))
        }
        return test
    }
    
    var d3_category10: Array<NSNumber> = [
        0x1f77b4,
        0xff7f0e,
        0x2ca02c,
        0xd62728,
        0x9467bd,
        0x8c564b,
        0xe377c2,
        0x7f7f7f,
        0xbcbd22,
        0x17becf
    ]
    
    func category10() -> (x: AnyObject) -> AnyObject? {
        self.range = d3_category10
        return scale_ordinal
    }

    
}
