//
//  AppDelegate.swift
//  SubmitValue-Back
//
//  Created by icoinnet on 2021/06/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /**
                AppDelegate는 UIApplication 객체로부터 생명 주기 관리를 위임받아 커스텀 코드를 처리하는 역할을 한다. 하지만 이 객체는 앱 전체를 통틀어 단 하나만 존재하므로 여러 뷰 컨트롤러에서 모두 접근할 수 있고. 앱 프로세스의 생성/소멸과 운명을 함께 하므로 이 객체에 값을 저장하면 앱이 종료되지 않는 한 값을 계속 유지할 수 있다.
     */

    
    //값을 저장할 변수를 정의
    var paramEmail : String?
    var paramUpdate : Bool?
    var paramInterval : Double?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

