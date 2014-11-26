
public class Linear {
    
    var domain: Array<Double>
    var range: Array<Double>
    
    public init(domain: Array<Double> = [0, 1], range: Array<Double> = [0, 1]) {
        self.domain = domain
        self.range = range
    }
    
    public func scale() -> (c: Double) -> Double {
        return bilinear(self.domain, range: self.range, uninterpolate: uninterpolate, interpolate: interpolate)
    }
    
    public func invert() -> (x: Double) -> Double {
        return bilinear(self.range, range: self.domain, uninterpolate: uninterpolate, interpolate: interpolate)
    }
    
    func interpolate(a: Double, b: Double) -> (c: Double) -> Double {
        var diff = b - a
        func test(c: Double) -> Double {
            return (a + diff) * c
        }
        return test
    }
    
    func uninterpolate(a: Double, b: Double) -> (c: Double) -> Double {
        var diff = b - a
        var re = diff != 0 ? 1 / diff : 0
        func test(c: Double) -> Double {
            return (c - a) * re
        }
        return test
    }
    
    func bilinear(domain: Array<Double>, range: Array<Double>, uninterpolate: (a: Double, b: Double) -> (c: Double) -> Double, interpolate: (a: Double, b: Double) -> (c: Double) -> Double) -> (c: Double) -> Double {
        var u: (c: Double) -> Double = uninterpolate(a: domain[0], b: domain[1])
        var i: (c: Double) -> Double = interpolate(a: range[0], b: range[1])
        func test(d: Double) -> Double {
            return i(c: u(c: d))
        }
        return test
    }
    
}
