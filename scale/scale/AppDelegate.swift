
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        
//        var scale01 = Scale().linear()
//        println(scale01(c: 2.5)) // 2.5
//        
//        var scale02 = Scale(domain: [0, 5], range: [0, 100]).linear()
//        println(scale02(c: 2.5)) // 50
//        
//        var scale03 = Scale(range: [0, 100]).linear()
//        println(scale03(c: 2.5)) // 250
//        
//        var colors = Scale().category10()
//        self.window!.backgroundColor = colors(x: 2)
//        
        var scale04 = Scale(range: [5, 6]).ordinal()
        println(scale04(c: 1))
        
        var colors = Scale().category10()
        if let color = colors(x: 0) as? Int {
            self.window!.backgroundColor = UIColorFromHex(color)
        }
        
        var awesome = Scale(range: ["one", "two"]).ordinal()
        println(awesome(c: 2))
        
        var alphabet = Scale(domain: ["A", "B", "C", "D"], range: [0, 1, 2, 3]).ordinal()
        println(alphabet(c: "A"))
        
//        println(alphbet)
//        x("A") is 0, x("B") is 1
        
//        var x = d3.scale.ordinal()
//            .domain(["A", "B", "C", "D", "E", "F"])
//            .range([0, 1, 2, 3, 4, 5]);
        
        
        return true
    }
    
    func UIColorFromHex(hex: Int) -> UIColor {
        var red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        var green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        var blue = CGFloat((hex & 0xFF)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {}

    func applicationWillTerminate(application: UIApplication) {}


}

