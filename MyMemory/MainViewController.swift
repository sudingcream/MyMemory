//
//  MainViewController.swift
//  MyMemory
//
//  Created by suding on 2021/03/15.
//

import UIKit
import FSCalendar

class MainViewController: UIViewController,FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var calendar: FSCalendar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
        
        view.addSubview(calendar)
        
        // 양 옆 흐릿 흐 릿~ 날짜 없애깅
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0

        calendar.locale = Locale(identifier: "ko_KR")

        // 선택한 날짜 칼라
        calendar.appearance.selectionColor = UIColor(red: 230/255, green: 180/255, blue: 193/255, alpha: 1.0)
        // 오늘 날짜
        calendar.appearance.todayColor = UIColor(red: 226/255, green: 143/255, blue: 173/255, alpha: 1.0)
        
        // 평일 날짜
        calendar.appearance.weekdayTextColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
        // 주말 날짜
        
        
        // 맨위에 타이틀 색깔
        calendar.appearance.headerTitleColor = .systemPurple
        
    }

    
    // 날짜 클릭하면 호출되는 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "WriteVC") else {
            return
        }
        
        self.present(uvc,animated: true)
        
       // guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "WriteVC") as? MemoFormVC else {return}
      
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let string = formatter.string(from: date)
        print("\(string)")
        
       // self.present(modalPresentView, animated: true, completion: nil)
      
    }
  

}


