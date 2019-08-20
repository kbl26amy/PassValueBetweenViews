//
//  TableViewCell.swift
//  PassValueBetweenViews
//
//  Created by 楊雅涵 on 2019/8/20.
//  Copyright © 2019 AmyYang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        deleteBtnOulet.addTarget(self, action: #selector(cellDeleteClosure), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var deleteClosure: (() ->())?
    
    @IBOutlet weak var deleteBtnOulet: UIButton!
    @IBOutlet weak var cellLabel: UILabel!
    weak var viewController: ViewController?
    
    @IBAction func cellButton(_ sender: UIButton) {
        viewController?.removeDidHitButtonInCell(self)
        
    }
    
    @objc func cellDeleteClosure(_ sender: Any) {
        deleteClosure!()
    }
    
    
    
}
