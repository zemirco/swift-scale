
import scale
import XCTest

class scaleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDefaultDomainRange() {
        var linear = Linear().scale()
        var result = linear(c: 2.5)
        XCTAssertEqual(result, 2.5)
    }
    
    func testDomain() {
        var linear = Linear(domain: [0, 100]).scale()
        var result = linear(c: 50)
        XCTAssertEqual(result, 0.5)
    }
    
    func testRange() {
        var linear = Linear(range: [0, 100]).scale()
        var result = linear(c: 0.5)
        XCTAssertEqual(result, 50)
    }
    
    func testRangeAndDomain() {
        var linear = Linear(domain: [2, 10], range: [2, 100]).scale()
        var result = linear(c: 3)
        var expected: Double = 12.5
        XCTAssertEqual(result, expected)
    }
    
    func testInvert() {
        var invert = Linear(domain: [0, 10], range: [0, 100]).invert()
        var result = invert(x: 75)
        var expected: Double = 7.5
        XCTAssertEqual(result, expected)
    }
    
}
