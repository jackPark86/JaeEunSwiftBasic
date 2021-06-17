//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by icoinnet on 2021/06/16.
//

import UIKit
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    //앱이 처음 실행될 때 호출되는 메소드
    //애플리케이션에서 사용할 클래스와 리소스들이 모두 메모리에 로드되고 아직 애플리케이션의 첫 화면을 모바일 디바이스에 띄우기 직전, 그러니깐 시작 화면이 스크린에 표시되고 있는 동안 호출된다.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NSLog("didFinishLaunchingWithOptions Enter!!")

        // Override point for customization after application launch.
        if #available(iOS 10.0, *){
            //경고창, 배지, 사운드를 사용하는 알림 환경 정보를 생성하고, 사용자 동의 여부 창을 실행
            let notiCenter = UNUserNotificationCenter.current()
            notiCenter.requestAuthorization(options: [.alert, .badge, .sound]){(didAllow, e) in}
            notiCenter.delegate = self //알림 센터 이벤트 발생시 앱 델리게이트에게 알려주는 코드
        } else {
            
            
        }
        
        return true
    }//end of application

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

    
    /**
     iOS 13 이후 변경된 생명주기 이벤트 전달 방식 때문임.
     백그라운드에 들어갔을 때 호출되는 메소드는
     AppDelegate.swift의 applicationWillResignActive(_:)가 아닌,
     SceneDelegate.swift의 sceneWillResignActive(_:)임.
     */
    //앱이 활성화 상태를 잃었을 때 실행되는 메소드
    func applicationWillResignActive(_ application: UIApplication) {
        NSLog("applicationWillResignActive Enter!!")
       /* if #available(iOS 10.0, *){
            //알림 동의 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings{ settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized {
                    //알림 콘텐츠 객체
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요!"
                    nContent.body = "앗! 왜 나갔어요?? 어서 들어오세요!!"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name" : "홍길동"]
                    
                    //알림 발송 조건 객체
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    //알림 요청 객체
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    
                    //노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request)
                }else{
                    print("사용자가 동의하지 않음!!!")
                }
                
            }
            
        } else { //ios 9 이하
            
        }*/
        
    }//end of applicationWillResignActive

    //앱 실행 도중에 알림 메시지가 도착할 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }

        //알림 배너 띄워주기
        //completionHandler([.alert, .badge, .sound])//.alert ios14 deprecated
        completionHandler([.banner, .badge, .sound])
    
    }//end of userNotificationCenter
    
    //사용자가 알림 메시지를 클릭했을 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"]!)
        }

        completionHandler()
    }//end of userNotificationCenter
    
    
    
    
    

}//end of class

