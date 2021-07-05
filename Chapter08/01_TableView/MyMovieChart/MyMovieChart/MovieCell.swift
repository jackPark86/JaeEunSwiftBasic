//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by icoinnet on 2021/07/01.
//

import UIKit

//프로토타입 셀을 제어하기 위한 커스텀 클래스
 
/**
 커스텀 클래스를 이용하여 프로토타입 셀을 제어하는 과정
 1. 스토리보드에서 테이블 뷰 컨트롤러를 추가하고, 프로토타입 셀을 [Custom] 스타일로 지정한 다음, 원하는 대로 디자인합니다.
 2. UITableViewCell을 상속받는 커스텀 클래스를 정의합니다.
 3. 스토리보드에서 프로토타입 셀과 커스텀 클래스를 서로 연결합니다. 아이덴티티 인스펙터 탭에서 연결 정보를 설정할 수 있습니다.
 4. 보조 에디터를 열고 프로토타입 셀에 디자인된 객체를 커스텀 클래스로 드래그하여 아울렛 변수를 생성합니다.
 5. 테이블 뷰 컨트롤러 클래스에서 커스텀 클래스를 이용하여 화면 데이터를 처리합니다.
 */
class MovieCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!//영화제목
    
    @IBOutlet var desc: UILabel!//영화 설명
    
    @IBOutlet var opendate: UILabel!//개봉일
    
    @IBOutlet var rating: UILabel!//평점
    
    @IBOutlet var thumbnail: UIImageView!//섬네일 이미지
    
    
    
}//end of class
