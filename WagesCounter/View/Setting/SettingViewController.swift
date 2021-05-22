//
//  SettingViewController.swift
//  WagesCounter
//
//  Created by El You on 2021/05/22.
//

import RxSwift
import UIKit
import Unio

final class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let viewStream: SettingViewStreamType = SettingViewStream()
    let settingView: SettingView = SettingView()
    private let disposeBag = DisposeBag()

    override func loadView() {
        super.loadView()
        view = settingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppConstants.Color.BackGround
        title = "設定"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppConstants.Color.Dark
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        settingView.tableView.delegate = self
        settingView.tableView.dataSource = self
        
        settingView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        settingView.tableView.register(SettingPickerTableViewCell.self, forCellReuseIdentifier: "picker")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picker", for: indexPath)
        return cell
    }
}
