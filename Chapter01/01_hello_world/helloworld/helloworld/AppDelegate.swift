//
//  AppDelegate.swift
//  helloworld
//
//  Created by icoinnet on 2021/05/12.
//

import UIKit
/**
    앱 전체의 생명 주기 관리를 위임받은 객체인 앱 델리게이트를 구현한 클래스
    쉽게 말해 앱 전체에 적용해야 할 기능을 담당하는 클래스.
    앱이 실행되고 종료될 때, 활성화 상태가 되거나 비활성화 상태가 될 때,
     백그라운드 상태로 들어가는 등의 다양한 상태 변화를 감지하고 이에 대한 처리를 해 주어야할 때 이 클래스를 이용
    - p17
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    /**
            이 메소드는 앱이 처음 실행될 때, 필요한 시스템적 처리를 모두 끝내고 메인 화면을 표시하기 직전에 호출 됨.
             다시 말해, 앱이 맨 처음 실행될 때 시작 화면이 모바일 기기의 스크린에 표시된 후 이 메소드가 호출되고,이 메소드 내부에 작성된
             내용이 모두 실행되고 나면 Main.storyboard 파일의 화면이 스크린에 표시 됨.
            - p60
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        
        // 이 부분은 프로세스의 진행을 멈춰 시작 화면이 표시되는 시간을 늘려주는 역할을 함
        sleep(5) //5초 간 지연 시킴
        
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

