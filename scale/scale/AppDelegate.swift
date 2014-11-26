
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        var scale01 = Linear().scale()
        println(scale01(c: 2.5)) // 2.5

        var scale02 = Linear(domain: [0, 5], range: [0, 100])
        var linear02 = scale02.scale()
        var invert02 = scale02.invert()
        println(linear02(c: 2.5)) // 50
        println(invert02(x: 50)) // 2.5

        var scale03 = Linear(range: [0, 100]).scale()
        println(scale03(c: 2.5)) // 250
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {}

    func applicationWillTerminate(application: UIApplication) {}


}

