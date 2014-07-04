
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        
        var scale01 = Scale().linear()
        println(scale01(c: 2.5)) // 2.5
        
        var scale02 = Scale(domain: [0, 5], range: [0, 100]).linear()
        println(scale02(c: 2.5)) // 50
        
        var scale03 = Scale(range: [0, 100]).linear()
        println(scale03(c: 2.5)) // 250
        
        var colors = Scale().category10()
        self.window!.backgroundColor = colors(x: 2)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {}

    func applicationDidEnterBackground(application: UIApplication) {}

    func applicationWillEnterForeground(application: UIApplication) {}

    func applicationDidBecomeActive(application: UIApplication) {}

    func applicationWillTerminate(application: UIApplication) {}


}

