//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by icoinnet on 2021/06/08.
//

import UIKit

class ViewController: UIViewController {

    //값을 화면에 표시하기 위한 아울렛 변수들
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    //1)뷰 컨트롤러를 이용한 값 전달 방식
    //값을 직접 전달받을 프로퍼티들
    //var paramEmail: String? // 이메일 값을 전달받을 속성
    //var paramUpdate: Bool? // 자동 갱신 여부를 전달받을 속성
    //var paramInterval: Double? // 갱신주기 값을 전달받을 속성
    
    
    
     //viewDidLoad() 는 뷰 컨트롤러의 화면이 처음 만들어질 때 호출 됨
    //AOS의 onCreate()와 같음
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad Enter!!")

        // Do any additional setup after loading the view.
    }//end of viewDidLoad

    
    //viewWillAppear()는 뷰 컨트롤러의 뷰가 화면에 표시될 때마다 실해오디는 메소드, 즉 다른 화면으로 기존 화면을 가렸다가 다시 표시하면 이 메소드가 호출된다는 뜻
    //AOS의 onResume()과 같음
    override func viewWillAppear(_ animated: Bool) {
        NSLog("viewWillAppear Enter!!")
        //nil 여부를 체크하여 값이 있을 경우 핻강하는 레이블 객체에 표시해 준다.
        
        //1)뷰 컨트롤러를 이용한 값 전달 방식(AOS Intent 방식)
        /*if let email = paramEmail {
            resultEmail.text = email
        }
        
        if let update = paramUpdate {
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        }*/
        
        
        //2)AppDelegate 글로벌 변수를 이용한 값 전달 방식(글로벌 변수 저장 방식)
        /*let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let email = ad?.paramEmail {
            resultEmail.text = email
        }
        
        if let update = ad?.paramUpdate {
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = ad?.paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        }*/
        
        //3)UserDefaults를 이용한 값 저장(AOS의 SharedPreferences와 같음)
        //UserDefaults 객체의 인스턴스를 가져온다
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
        
    
    }//end of viewWillAppear
    
  
    override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear Enter!!")

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NSLog("viewWillDisappear Enter!!")
    }

    @IBAction func onRegister(_ sender: Any) {
      
        
        /**
         ios13부터  기본값이 fullscreen이 아니라서
          모달형식은 이전화면으로 돌아올 때 viewWillAppear가 다시 시작 되지 않는다.
            전체화면으로 뷰를 이동하면 다시 이전화면으로 돌아왔을 때 viewWillAppear가 작동이 된다.
         */
        
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }

    
        uvc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(uvc, animated: true, completion: nil)
    }
}

