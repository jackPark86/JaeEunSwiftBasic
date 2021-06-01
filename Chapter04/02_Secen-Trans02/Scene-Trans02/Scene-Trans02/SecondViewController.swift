//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by icoinnet on 2021/06/01.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender : Any){
        self.presentingViewController?.dismiss(animated: true)
    }//end of back
    
    
    @IBAction func navigationBack(_ sender: Any) {
        //스위프트에서 언더바는 "값을 대입할 변수가 필요한 것을 알고 있지만, 나는 그 값이 필요하지 않으니 굳이 변수에 값을 할당하지 말아 주세요" 라고 쓰인다. 
       _ = self.navigationController?.popViewController(animated: true)
    }//end of navigationBack()
    
    
}//end of class
