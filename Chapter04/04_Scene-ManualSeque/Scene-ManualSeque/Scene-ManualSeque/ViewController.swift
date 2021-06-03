//
//  ViewController.swift
//  Scene-ManualSeque
//
//  Created by icoinnet on 2021/06/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func wind(_ sender: Any) {
        //매뉴얼 세그웨이를 실행한다
        self.performSegue(withIdentifier: "ManualWind", sender: self)
        
    }//end of wind
    
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue){
        
    }//end of unwindToVC
    
}//end of class

