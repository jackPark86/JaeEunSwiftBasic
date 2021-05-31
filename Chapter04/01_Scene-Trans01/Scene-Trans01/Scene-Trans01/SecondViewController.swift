//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by icoinnet on 2021/05/31.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back (_sender :Any) {
        //이전 화면으로 돌아가기
        self.presentingViewController?.dismiss(animated: true)
        
    }//end of back
}
