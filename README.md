# 傳值與反向傳值

----
## 說明
see [Pass Value](https://github.com/Wuchiwei/iOS/tree/master/Pass_Value)

> 
1. Pass Value Between Different View Controller.
2. Pass Value From UITableViewCell to UIViewController.

----
## 使用方法

1.  Closure
2. Target-Action 
3. Delegate Pattern
----
## 
# 刪除指定欄位

**找到 tableviewCell 裡面的 Button 刪除 row**

>在 cellforrow 裡找到 indexpath 與 button
      
//      1. Delegate Pattern：找到 vc 然後連接到 cell 裡的 button
        
        cell.viewController = self
        
//        2. addTarget
  
        cell.deleteBtnOulet.addTarget(self, action: #selector(removeBtnByAddTarget(_:)), for: .touchUpInside)
        
//        3. closure

       cell.deleteClosure = {
            self.cellNumber.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
# 反向傳值

**使用 Closure 與 Delegate Pattern**

>判斷不同觸發方式給予對應回傳的方法
      
//      1. Closure
        
        guard let text = textField.text else {
            return
        }
        passClosure?(text)
        
//     2. 判斷delegate需要執行的方法

        if strText == ""{
        delegate?.getText(textField.text!)
        } else {
            delegate?.upDateText(textField.text!, index: index)
        }

----
## changelog
* 20-Aug-2019 re-design

----
## thanks
* [ Wuchiwei](https://github.com/Wuchiwei/iOS/tree/master/Pass_Value)
