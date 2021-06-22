//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by icoinnet on 2021/06/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var tf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //텍스트 필드 속성 설정
        self.tf.placeholder = "값을 입력하세요!" // 안내 메시지
        self.tf.keyboardType = UIKeyboardType.alphabet //키보드 타입 영문자 패드로
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark //키보드 스타일 어둡게
        self.tf.returnKeyType = UIReturnKeyType.join //리턴키 타입은 "Join"
        self.tf.enablesReturnKeyAutomatically = true //리턴키 자동 활성화 "On"
        /**
                스타일 설정
         */
        //테두리 스타일 - 직선
        self.tf.borderStyle = UITextField.BorderStyle.line
        //배경 색상 (16진수 컬러#DFDFDF를 UIColor 타입으로 변환한 것)
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        //수직 방향으로 텍스트가 가운데 정렬되도록
        self.tf.contentVerticalAlignment = .center
        //수평 방향으로 텍스트가 가운데 정렬되도록
        self.tf.contentHorizontalAlignment = .center
        // 테두리 색상을 회색으로
        self.tf.layer.borderColor = UIColor.darkGray.cgColor
        // 테두리 두께 설정(단위 : Pt)
        self.tf.layer.borderWidth = 2.0
        
        //텍스트 필드를 최초 응답자로 지정
        self.tf.becomeFirstResponder()
        
        //텍스트 필드 델리게이트 패턴 지정
        self.tf.delegate = self
        
    }//end of viewDidLoad
    
    @IBAction func confirm(_ sender: Any) {
        //텍스트 필드를 최초 응답자 객체에서 해제
        self.tf.resignFirstResponder()
    }//end of confirm
    
    @IBAction func input(_ sender: Any){
        //텍스트 필드를 최초 응답자 객체로 지정
        self.tf.becomeFirstResponder()
    }//end of input
    
    //텍스트필드의 편집을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다.")
        return true //false를 리턴하면 편집되지 않는다.
    }//end of textFieldShouldBeginEditing
    
    //텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다")
        return true// false를 리턴하면 삭제되지 않는다.
    }//end of textFieldShouldClear
    
    //텍스트 필드의 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스튼 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil { //입력된 값이 숫자가 아니라면 true를 리턴
            //현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영하지 않음
            if(textField.text?.count)! + string.count > 10 {
                return false
            } else {
                return true
            }
        } else { //입력된 값이 숫자라면 false를 리턴
            return false
        }//end of if ~ else
       // return true //false를 리턴하면 내용이 변경되지 않는다.
    }//end of textField
    
    //텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }//end of textFieldShouldReturn
    
    //텍스트 필드 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        return true //false를 리턴하면 편집이 종료되지 않는다.
    }//end of textFieldShouldEndEditing
    
    //텍스트 필드의 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }//end of textFieldDidEndEditing
    
    
    
}//end of class

