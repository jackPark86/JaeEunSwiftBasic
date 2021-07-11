//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by icoinnet on 2021/06/24.
//

import UIKit


class ListViewController: UITableViewController {
    //현재까지 읽어온 데이터의 페이지 정보
    var page = 1
    
    
    @IBOutlet var moreBtn: UIButton!
    
    
    //튜플 아이템으로 구성된 데이터 세트
//    var dataset = [
//        ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
//        ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpg"),
//        ("말할 수 없는 비밀","여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpg")
//    ]
    
    //테이블 뷰를 구성할 리스트 데이터
    //lazy 키워드를 붙여서 변수를 정의하면 참조되는 시점에 맞추어 초기화되므로 메모리 낭비를 줄일 수 있다.
    //lazy 키워드를 붙이지 않은 프로퍼티는 다른 프로퍼티를 참조할 수 없다.
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
//        for(title, desc, opendate, rating, thumbnail) in self.dataset {
//            let mvo = MovieVO()
//            mvo.title = title
//            mvo.description = desc
//            mvo.opendate = opendate
//            mvo.rating = rating
//            mvo.thumbnail = thumbnail
//
//            datalist.append(mvo)
//
//        }//end of for
        return datalist
    }()
    
    
    
    //뷰가 처음 메모리에 로드될 때 호출되는 메소드
    override func viewDidLoad() {
        //1. 호핀 API 호출을 위한 URI를 생성
        NSLog("enter!!")
        //영화차트 API를 호출한다.
        self.callMovieAPI()
        
    }//end of viewDidLoad
    
    
    //테이블 뷰 행의 개수를 반환하는 메소드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }//end of tableView()
    
    //테이블 뷰 행을 구성하는 메소드(개별 행을 만들어내는 역할)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        
        //로그 출력
        NSLog("호출된 행번호: \(indexPath.row), 제목: \(row.title!)")
        
        //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        

        //============ 커스텀 프로토타입 셀 Tag(태그)로 객체 관리 =================
        //영화제목이 표시될 레이블을 title 변수로 받음
        //let title = cell.viewWithTag(101) as? UILabel
        //영화요약이 표시될 레이블을 desc 변수로 받음
        //let desc = cell.viewWithTag(102) as? UILabel
        //영화 개봉일이 표시될 레이블을 opendate 변수로 받음
        //let opendate = cell.viewWithTag(103) as? UILabel
        //영화 별점이 표시될 레이블 rating 변수로 받음
        //let rating = cell.viewWithTag(104) as? UILabel
        
        
        //============ 커스텀 프로토타입 셀 커스텀 클래스(MovieCell)로 객체 관리 =================
        //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        //cell.thumbnail.image = UIImage(named: row.thumbnail!) //로컬 리소스 이미지 뷰 처리
        //cell.thumbnail.image = UIImage(data: try! Data(contentsOf: URL(string: row.thumbnail!)!)) //웹상의 이미지 출력
        
        //비동기 방식으로 섬네일 이미지를 읽어옴
        DispatchQueue.main.async (execute: {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        //구성될 셀을 반환함
        return cell
    }//end of tableView()
    
    //테이블 셀을 클릭하거 터치했을 때 액션 처리
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째, 제목은 :  \(self.list[indexPath.row].title!)입니다!")
    }//end of tableView
    
    //서버에서 영화 목록 더 가져오기
    @IBAction func more(_ sender: Any) {
        //현재 페이지 값에 1을 추가한다.
        self.page += 1
        
        //영화차트 API를 호출한다
        self.callMovieAPI()
        
        //데이터를 다시 읽어오도록 테이블 뷰를 갱신한다.
        self.tableView.reloadData()
       
    }//end of more()
    
    
    func callMovieAPI() {
        //호핀(영화) API 호출을 위한 URI를 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        
        let apiURI: URL! = URL(string: url)
        
        //REST API를 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        //3. 데이터 전송 결괄를 로그로 출력(반드시 필요한 코드는 아님)
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\( log )")
        
        //4. JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            //데이터 파싱을 위한 JSONSerialization 객체 jsonObject는 첫번째 인자로 파싱할 데이터 두번째로 파싱 옵션을 입력 받는다.
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            //5. 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            //6. Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장한다.
            for row in movie {
                //순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                //테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                //movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                //웹상에 있는 이미지를 읽어와 UIImage 객체로 생성
                let url : URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                //list 배열에 추가
                self.list.append(mvo)
            }//end of for
            //전체 데이터 카운트를 얻는다.
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            NSLog("total Count : \(totalCount)")

            //totalCount가 읽어온 데이터 크기가 같거나 클 경우 더보기 버튼을 막는다.
            if(self.list.count >= totalCount){
                self.moreBtn.isHidden = true
            }
        } catch {
            NSLog("Parse Error!")
        }
    }//end of callMovieAPI
    
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        //인자값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어옴
        let mvo = self.list[index]
         
        //메모이제이션 : 저장된 이미지가 있으면 그것을 반환하고, 없을 경우 내려받아 저장한 후 반환
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData) //UIImage를 movieVo객체에 우선 저장
            return mvo.thumbnailImage! //저장된 이미지를 반환
        }
        
    }//end of getThumbnailImage
     
  
}//end of class

// MARK: - 화면 전환 시 값을 넘겨주기 위한 세그웨이 관련 처리
extension ListViewController {
    
    /**
     - 세그웨이에 대한 전처리 메소드 -
     prepare(for:, sender:)는 세그웨이를 통해 화면이 전환될 때 ios 시스템이 자동으로 호출하는 메소드입니다. 만약 화면 이동 전에 실행해야 할 코드가 있거나 특별한 전처리를 해야 한다면 모두 이 메소드 내에 코드를 적성해야 한다.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //실행된 세그웨이의 식별자가 "segue_detail"이라면
        if segue.identifier == "segue_detail" {
            //사용자가 클릭한 행을 찾아낸다.
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            
            //행 정보를 통해 선택된 영화 데이터를 찾은 다음, 목적지 뷰 컨트롤러의 mvo 변수에 대입한다.
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = self.list[path!.row]
        }
        
    }//end of prepare
    
}//end of ListViewController
