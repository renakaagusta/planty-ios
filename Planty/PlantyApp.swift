//
//  PlantyApp.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

extension PlantyApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

@main
struct PlantyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
      setupAuthentication()
           UITableView.appearance().separatorStyle = .none
           UITableView.appearance().backgroundColor = UIColor.clear
           UITableViewCell.appearance().backgroundColor = UIColor.clear
           UITableView.appearance().separatorColor = .clear
           UITableView.appearance().backgroundView = nil
           UITableViewCell.appearance().backgroundView = nil
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
