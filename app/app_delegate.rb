class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Parse.setApplicationId("SBji06Gle3II2Z5MROyMoBJhXE1wXqjm3BYmVXxV", clientKey: "hA7W2yB9b3tItysQdwYM8ofKpZnX2jdFdrq6zHbT")

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [ContactCreateController.alloc.initForm, ContactListController.alloc.init]
    tabbar.selectedIndex = 0
    @window.rootViewController = tabbar
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
