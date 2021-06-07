//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by icoinnet on 2021/06/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    //화면에 값을 표시하는데 사용될 레이블
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    //값을 전달받을 프로퍼티 정의
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    
    //화면이 메모리에 로드되고 난 시점에 viewDidLoad() 메소드 호출
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
        
    }//end of viewDidLoad
    
    //화면복귀
    @IBAction func onBack(_ sender: Any) {
        //프레젠테이션 방식의 화면 복귀
        self.presentingViewController?.dismiss(animated: true)
    }//end of onBack()
    
}//end of class
