//
//  MusicListViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/15.
//

import UIKit

import SnapKit
import SwiftyColor

//MARK: - MusicListViewController

final class MusicListViewController: UIViewController {

    //MARK: - Lazy Components
    
    private lazy var musicTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black.withAlphaComponent(0.1)//테이블뷰 테두리
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - Variables
    
    var musicList: [MusicModel] = [
          MusicModel(albumImage: "albumImage1", title: "Eleven", singer: "IVE(아이브)"),
          MusicModel(albumImage: "albumImage2", title: "After LIKE", singer: "IVE(아이브)"),
          MusicModel(albumImage: "albumImage3", title: "Attention", singer: "New Jeans"),
          MusicModel(albumImage: "albumImage4", title: "Shut Down", singer: "BLACKPINK"),
          MusicModel(albumImage: "albumImage5", title: "Hype Boy", singer: "New Jeans"),
          MusicModel(albumImage: "albumImage6", title: "LOVE DIVE", singer: "IVE(아이브)"),
          MusicModel(albumImage: "albumImage7", title: "Pink Venom", singer: "BLACKPINK"),
          MusicModel(albumImage: "albumImage8", title: "Rush Hour (feat. j-hope of ...", singer: "Crush"),
          MusicModel(albumImage: "albumImage9", title: "Monologue", singer: "테이")
      ]
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        layout()
        register()

    }
}

//MARK: - Extensions

extension MusicListViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(musicTableView)
        musicTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(musicList.count * 70)
        }
    }
    
    //MARK: - General Helpers
    
    private func register() {
        musicTableView.register(MusicListTableViewCell.self, forCellReuseIdentifier: MusicListTableViewCell.identifiler
        )
    }
}

//MARK: - UITableViewDelegate

extension MusicListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}

//MARK: - UITableViewDataSource

extension MusicListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let musicCell = tableView.dequeueReusableCell(withIdentifier: MusicListTableViewCell.identifiler, for: indexPath) as? MusicListTableViewCell else { return UITableViewCell() }
        
        musicCell.dataBind(model: musicList[indexPath.row])
        return musicCell
    }

}
