//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by icoinnet on 2021/06/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//end of viewDidLoad()
    
    //전처리 메소드
    //세그웨이를 이용하여 화면을 전환하는 과정에서 뭔가 특별한 처리를 해 주어야 할 때 코코아 터치 프레임워크는 세그웨이가 실행되기 전에 전처리 메소드(prepare())를 호출하도록 설계되어 있다.
    //전처리 메소드는 대부분 다음 화면으로 값을 전달하는 데에 사용된다. 현재의 화면에서 입력된 값을 넘기거나, 혹은 사용자 선택한 값을 넘기는 데 전처리 메소드가 사용 된다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("segueway identifier \(segue.identifier!)") //세그웨이의 아이디를 출력
    
        if(segue.identifier == "custom_segue"){
            NSLog("커스텀 세그가 실행됩니다")
        }else if(segue.identifier == "action_segue"){
            NSLog("액션 세그가 실행됩니다")
        }else{
            NSLog("알수 없는 세그입니다.")
        }
        
        
    }//end of prepare()
    

}//end of class

