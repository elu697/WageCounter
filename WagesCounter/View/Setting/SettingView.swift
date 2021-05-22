//
//  SettingView.swift
//  WagesCounter
//
//  Created by El You on 2021/05/22.
//

import UIKit

class SettingView: UIView {
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = AppConstants.Color.BackGround
        table.separatorColor = .black
        table.tableFooterView = UIView()
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
