//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by icoinnet on 2021/06/02.
//

import UIKit

/**
        커스텀 세그웨이
 */
class NewSegue: UIStoryboardSegue {
    
    
    /**
     UIStroyboardSegue 클래스에서 세그웨이의 실행을 처리하는 메소드는 perform()이기 때문에 커스텀 세그웨이에서도 원하는 화면 전환 기능을 구현하기 위해서는
     perform() 메소드를 오버라이드해야 한다.
     */
    override func perform() {
        
        //세그웨이의 출발지 뷰 컨트롤러
        let srcUVC = self.source
        
        //세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destination
        
        // fromView에서 toView로 뷰를 전환한다
        // 이 메소드에 적절한 인자값을 넣어주면 커스텀 세그웨이가 실행될 때 perform() 메소드가 호출되면서 출발지 뷰 컨트롤러의 뷰를 목저지 뷰 컨트롤러의 뷰로 대체한다.
        // 만약 화면 전환이 오나전히 끝난 후에 뭔가 처리할 내용이 있다면, 이를 위한 클로저나 함수를 인자값으로 전달할 수 있도록 completion: 매개변수가 추가되어 있는 메소드를 사용하면 된다.
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
        
    
    }//end of perform
    
    
}//end of class
