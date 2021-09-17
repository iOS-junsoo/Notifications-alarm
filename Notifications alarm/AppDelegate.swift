//
//  AppDelegate.swift
//  Notifications alarm
//
//  Created by 준수김 on 2021/09/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //-STEP 1: 승인 신청-
        let center = UNUserNotificationCenter.current()
        //UNUserNotificationCenter: 개체를 사용하여 앱 또는 앱 확장의 모든 알림 관련 동작을 관리할 수 있음.
        //경고, 소리 및 아이콘 배지를 통해 사용자와 상호 작용할 수 있는 권한을 요청.
        
        //current: 앱 또는 앱 확장에 대한 공유 사용자 알림 센터 개체를 반환.
        
        center.requestAuthorization(options: [.alert, .sound]) { (grated, error) in
        }
        //로컬 및 원격 통지가 사용자의 장치에 전달될 때 사용자와 상호 작용할 수 있는 권한을 요청.
        //options: 앱이 요청하는 권한 부여 옵션.
        //granted: 권한 여부를 나타내는 Bool 값.
        
        //-STEP 2: 알림 내용 생성-
        let content = UNMutableNotificationContent()
        //UNMutableNotificationContent: 알림에 대한 편집 가능한 내용.
        //이 개체를 사용하여 경고의 제목과 메시지, 재생할 소리 또는 앱 배지에 할당할 값을 지정.
        content.title = "Korean"
        content.body = "한국어"
            
        //-STEP 3: 알림 트리거 생성-
        //트리거(Trigger)는 어느 특정한 동작에 반응해 자동으로 필요한 동작을 실행하는 것
        let date = Date().addingTimeInterval(10)
        //이 date에 시간 간격을 추가해서 새 date값을 만든다.
        //시간, 일, 월과 같은 일정관리 개념을 추가하려면 달력을 사용해야함. / 추가할 값(초)
            
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        //달력 표준시를 사용하여 날짜의 모든 날짜 구성 요소를 반환
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        //특정 날짜 및 시간에 알림이 배달되도록 하는 트리거 조건
        
        //-STEP 4: 요청 생성-
        let uuidString = UUID().uuidString
        //UUID: 유형, 인터페이스 및 기타 항목을 식별하는 데 사용할 수 있는 보편적으로 고유한 값
        //uuidString: UUID에서 생성된 문자열을 반환
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        //UNNotificationRequest: 알림내용 및 전달 트리거 조건이 포함된 로컬 통지 예약 요청
        
        //-STEP 5: 요청 등록-
        center.add(request) { (error) in
            
        }
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

