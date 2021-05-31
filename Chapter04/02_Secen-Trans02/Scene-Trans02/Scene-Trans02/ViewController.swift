//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by icoinnet on 2021/05/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveByNavy(_ sender: Any) {
        
    //두번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        //화면을 전홚나다.
        self.navigationController?.pushViewController(uvc, animated: true)
        
    }//end of moveByNavy()
    
    
}//end of class



