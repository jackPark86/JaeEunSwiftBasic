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
    
    //
    @IBAction func onSubmit(_ sender: Any) {
      //VC2의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
            }
        
        //값 전달
        rvc.paramEmail = self.email.text! //이메일
        rvc.paramUpdate = self.isUpdate.isOn //자동갱신 여부
        rvc.paramInterval = self.interval.value //갱신주기
        
        //화면이동
        self.present(rvc, animated: true)

        
    }//end of onSubmit
    
    
}//end of class

