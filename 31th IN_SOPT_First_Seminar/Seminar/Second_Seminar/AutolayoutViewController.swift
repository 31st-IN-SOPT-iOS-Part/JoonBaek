//
//  AutolayoutViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/08.
//

import UIKit

import SnapKit
import SwiftyColor

//MARK: - AutolayoutPractice1

class AutolayoutPractice1: UIViewController {
    
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = 0xF2B9B9.color
        return view
    }()
    
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = 0xD9D9D9.color
        return view
    }()

    //MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
}

//MARK: - Extensions

extension AutolayoutPractice1 {
    
    private func layout() {
        
        let components: [Any] = [firstView, secondView]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        firstView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(275)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(62)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(155)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(96)
            make.leading.equalTo(firstView.snp.leading)
            make.width.equalTo(109)
            make.height.equalTo(106)
        }
        
    }
}



//디자이너와 협업시 가장 작은 폰사이즈(375*667)
//작은것->큰것이 더 쉬움. 스크롤이 더 필요할 수 있기 때문

//safearea 가로스크롤도 해야하기 때문

//ctr cmd e = refactor
