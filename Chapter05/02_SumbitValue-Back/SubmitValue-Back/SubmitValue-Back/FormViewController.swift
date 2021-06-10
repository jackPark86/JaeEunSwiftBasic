//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by icoinnet on 2021/06/09.
//

import UIKit

class FormViewController: UIViewController {
    
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    
    //Submit 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func onSubmit(_ sender: Any) {
        NSLog("onSubmit Enter!!")
        //1)뷰 컨트롤러를 이용한 값 전달 방식(AOS Intent 방식)
        //presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다.
       /* let preVC = self.presentingViewController
        
        guard let vc = preVC as? ViewController else {
            return
        }
        
        //값을 전달한다.
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value */
        //1)뷰 컨트롤러를 이용한 값 전달 방식 끝
        
        //2)AppDelegate 글로벌 변수를 이용한 값 전달 방식(글로벌 변수 방식)
        //AppDelegate  객체의 인스턴스를 가져온다.
        /*let ad = UIApplication.shared.delegate as? AppDelegate
    
        //값을 저장한다
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value*/
        
        
        
        //3)UserDefaults를 이용한 값 저장(AOS의 SharedPreferences와 같음)
        //UserDefault 객체의 인스턴스를 가져온다
        let ud = UserDefaults.standard
        
        //값을 저장한다
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        NSLog("onSubmit : \(String(describing: self.email.text)) \\ \(self.isUpdate.isOn) \\ \(self.interval.value)" )
        
        //이전 화면으로 복귀한다.
        self.presentingViewController?.dismiss(animated: true)
        
        
        
        
    }//end of onSubmit()
    
}//end of class
