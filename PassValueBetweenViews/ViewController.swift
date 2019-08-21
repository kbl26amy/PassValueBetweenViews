//
//  ViewController.swift
//  PassValueBetweenViews
//
//  Created by 楊雅涵 on 2019/8/20.
//  Copyright © 2019 AmyYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, passDataBack  {
    func upDateText(_ text: String, index: Int) {
        cellNumber[index] = text
    }
    
    
    func getText(_ text: String) {
        cellNumber.append(text)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNumber.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "identifier", for: indexPath) as? TableViewCell else {
                return UITableViewCell()
        }
//        1. Delegate Pattern：找到vc然後連接到cell裡的button
//        cell.viewController = self
        
//        2. addTarget
//        cell.deleteBtnOulet.addTarget(self, action: #selector(removeBtnByAddTarget(_:)), for: .touchUpInside)
        
//        3. closure
        cell.deleteClosure = {
            self.cellNumber.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        
        cell.cellLabel.text = cellNumber[indexPath.row]
        cell.deleteBtnOulet.tag = indexPath.row
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let nextVC = self.storyboard?.instantiateViewController(
            withIdentifier: "NextViewController"
            ) as? NextViewController else {
                return
        }
        nextVC.strText = cellNumber[indexPath.row]
        nextVC.index = indexPath.row
        
//      1. closure
        nextVC.passClosure = { text in
            
            self.cellNumber[indexPath.row] = text
            
            tableView.reloadData()
        }
        
//       2. 使用delegate找到nextVC的delegate pattern
//        nextVC.delegate = self
        
        print(nextVC)
        show(nextVC, sender: nil)
        
    }
 
//      2. addTarget刪除的方法
    @objc func removeBtnByAddTarget(_ button: UIButton) {
        
        cellNumber.remove(at: button.tag)
        tableView.reloadData()
    }
//      1. Delegate Pattern：找到vc然後連接到cell裡的button
    func removeDidHitButtonInCell(_ cell: TableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        print("click delete")
        cellNumber.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }

    @IBAction func addItemButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(
            withIdentifier: "NextViewController"
            ) as? NextViewController else {
                return
        }
//        1. closure
        nextVC.passClosure = { text in
            self.cellNumber.append(text)
            self.tableView.reloadData()
        }
        
//        2. delegate
//        nextVC.delegate = self
        
        show(nextVC, sender: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
   
    var cellNumber = ["2","3","4","5"]
    
    var closureDelete : (() ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.delegate = self
       tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        
        tableView.reloadData()

    }
    

}

