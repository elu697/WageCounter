//
//  HomeView.swift
//  WagesCounter
//
//  Created by El You on 2021/04/07.
//

import UIKit

class HomeView: UIView {
    let wageLabel: UILabel = {
        let label = UILabel()
        label.text = "￥0"
        label.font = .boldSystemFont(ofSize: 80)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let clockLabel: UILabel = {
        let label = UILabel()
        label.text = "88:88:88"
        label.font = .boldSystemFont(ofSize: 50)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let o2Button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("O", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.borderWidth = 2
        button.borderColor = .white
        button.setBackgroundColor(color: .clear, forState: .normal)
        button.setBackgroundColor(color: .black, forState: .highlighted)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.icons8Settings() , for: .normal)
        return button
    }()
    
    let commentText: UILabel = {
        let label = UILabel()
        label.text = "Time is Money"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(wageLabel)
        addSubview(clockLabel)
        addSubview(o2Button)
        addSubview(settingButton)
        addSubview(commentText)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        wageLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(90)
        }
        
        clockLabel.snp.makeConstraints { (make) in
            make.top.equalTo(wageLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(70)
        }
        
        o2Button.snp.makeConstraints { (make) in
            make.top.equalTo(clockLabel.snp.top).offset(300)
            make.centerX.equalToSuperview()
            make.width.equalTo(140)
            make.height.equalTo(70)
        }
        
        settingButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        
        commentText.snp.makeConstraints { (make) in
            make.top.equalTo(o2Button.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(60)
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
