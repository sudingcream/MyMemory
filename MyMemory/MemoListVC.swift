//
//  MemoListVC.swift
//  MyMemory
//
//  Created by suding on 2021/03/11.
//

import UIKit

class MemoListVC: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memolist.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegate.memolist[indexPath.row]
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        
        //Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포맷에 맞게 변경
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.appDelegate.memolist[indexPath.row]
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "MemoRead") as? MemoReadVC else{
            return
        }
        
        //값을 전달한 다음 상세화면으로 이동한다.
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // 스크린에 뷰 컨트롤러가 나타날때마다 호출되는 메소드
    // 테이블 데이터를 다시 읽어들인다. 이에 따라 구성하는 로직이 다시실행됨 
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
