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
    
    //값을 직접 전달받을 프로퍼티들
    var paramEmail: String? // 이메일 값을 전달받을 속성
    var paramUpdate: Bool? // 자동 갱신 여부를 전달받을 속성
    var paramInterval: Double? // 갱신주기 값을 전달받을 속성
    
    
    
     //viewDidLoad() 는 뷰 컨트롤러의 화면이 처음 만들어질 때 호출 됨
    //AOS의 onCreate()와 같음
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//end of viewDidLoad

    
    //viewWillAppear()는 뷰 컨트롤러의 뷰가 화면에 표시될 때마다 실해오디는 메소드, 즉 다른 화면으로 기존 화면을 가렸다가 다시 표시하면 이 메소드가 호출된다는 뜻
    //AOS의 onResume()과 같음
    override func viewWillAppear(_ animated: Bool) {
        
        //nil 여부를 체크하여 값이 있을 경우 핻강하는 레이블 객체에 표시해 준다.
        
        if let email = paramEmail { resultEmail.text = email
            
        }
        
        if let update = paramUpdate {
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        }
        
        
    }//end of viewWillAppear

}

