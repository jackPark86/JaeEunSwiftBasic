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

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            //1)앱이 구동되어 필요한 초기 실행 과정이 완료되기 직전에 호출되는 메소드 p81
        return true
    }
    /**
            이 메소드는 앱이 처음 실행될 때, 필요한 시스템적 처리를 모두 끝내고 메인 화면을 표시하기 직전에 호출 됨.
             다시 말해, 앱이 맨 처음 실행될 때 시작 화면이 모바일 기기의 스크린에 표시된 후 이 메소드가 호출되고,이 메소드 내부에 작성된
             내용이 모두 실행되고 나면 Main.storyboard 파일의 화면이 스크린에 표시 됨.
            - p60
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        
        //2)앱이 사용자에게 화면으로 표시되기 직전에 호출되는 메소드. 앱이 실행된 후에 진행할 커스터마이징이나 초기화를 위한 코드를 여기에 작성하면 됨.p81
        
        // 이 부분은 프로세스의 진행을 멈춰 시작 화면이 표시되는 시간을 늘려주는 역할을 함
        sleep(5) //5초 간 지연 시킴
        
        return true
    }

    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //3) 실행된 앱이 포그라운드, 즉 화면 전면에 표시될 때 호출되는 메소드. 앱이 Inactive 상태에 들어가면서 일시 중지된 작업이 있다면 이를 재시작하는 코드를 여기에 작성해 주어야 한다.
        //예를 들어 타이머나 스톱워치 앱의 경우, Inactive 상태로 들어가면 더 이상 화면 갱신이 이루어지지 않고 예전 화면 이 유지되므로 이 메소드를 통해 화면과 남은 시각 등을 갱신해 주어야 한다. p81
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //4) 앱이 백그라운드 상태에 진입했을 때 호출된다. 이 메소드가 호출된다는 것은 미래의 어느 순간에 앱이 종료된다는 의미이미로, 잃어서는 안 되는 사용자 데이터를 종료 전에 미리 저장하거나, 공유 자원을 점유하고 있ㅆ었다면 이를 해젱해 주어야 한다. 종료된 앱이 다시 실행될 때 현재의 상태를 복구할 수 있도록 필요한 상태 정보도 이 메소드에서 저장 처리하는 것이 좋다 p81
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //5) 앱이 종료되기 직전에 호출되는 메소드. 사용자 데이터 등을 종료 전에 한 번 더 저장해 두는 것이 좋다. p81
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

