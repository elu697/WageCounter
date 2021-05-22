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
        label.text = "00:00:00"
        label.font = .boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    let o2Button: UIButton = {
        let button = UIButton()
        button.setTitle("O", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.borderWidth = 2
        button.borderColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.icons8Settings() , for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(wageLabel)
        addSubview(clockLabel)
        addSubview(o2Button)
        addSubview(settingButton)
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
            make.width.equalToSuperview().multipliedBy(0.7)
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
            make.width.height.equalTo(40)
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
