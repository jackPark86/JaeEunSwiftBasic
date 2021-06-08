//
//  ViewController.swift
//  SubmitValue
//
//  Created by icoinnet on 2021/06/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }//end of viewDidLoad()

    //자동 갱신 여부가 바뀔 때마다 호출되는 메소드
    @IBAction func onSwitch(_ sender: UISwitch) {
        
        if(sender.isOn == true){
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }//end of onSwitch
    
    //갱신주기가 바뀔 때마다 호출되는 메소드
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    
    }//end of onStepper
    
    // 세그웨이 사용하지 않고 값 전달 방법 
    @IBAction func onSubmit(_ sender: Any) {
      //VC2의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
            }
        
        //값 전달
        rvc.paramEmail = self.email.text! //이메일
        rvc.paramUpdate = self.isUpdate.isOn //자동갱신 여부
        rvc.paramInterval = self.interval.value //갱신주기
        
        //프리젠테이션 방식의 값 전달 방법
        //self.present(rvc, animated: true)
        
        //네비게이션 컨트롤러를 이용한 값 전달 방법
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }//end of onSubmit
    
    
    
    //세그웨이를 이동한 값 전달
    
    /**
            prepare  메소드는 세그웨이가 실행되기 직전에 호출되는 메소드
        이 메소드는 우리가 직접 호출하는 것이 아니라 필요한 내용을 작성해 둔 다음 가만히 놔두면 iOS 시스템이 알아서 적절한 시점에 호출함
     매뉴얼 세그웨이나, 액션 세그웨이에 구분없이 모든 세그웨이가 실행되기 전에 ios는 prepare() 메소드를 먼저 호출한다.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
        //목적지 뷰 컨트롤러 인스턴스 읽어오기
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        //값 전달
        rvc.paramEmail = self.email.text! //이메일
        rvc.paramUpdate = self.isUpdate.isOn //자동갱신 여부
        rvc.paramInterval = self.interval.value //갱신주기
        
    }//end of prepareprepare
    
    @IBAction func onPerformSegue(_ sender:Any){
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
        
    }//end of onPerformSegue()
    
}//end of class

