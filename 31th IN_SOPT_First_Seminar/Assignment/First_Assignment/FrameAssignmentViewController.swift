//
//  FirstFrameAssignmentViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/06.
//

import UIKit

class FrameAssignmentViewController: UIViewController {
    
    private let view1: UIView = {
        var view = UIView(frame: CGRect(x: 0, y: 0, width: 393, height: 600))
        view.backgroundColor = .systemGray3
        return view
    }()
    
    private let view2: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 72, y: 79, width: 300, height: 500)
//        view.bounds = CGRect(x: 98, y: 157, width: 300, height: 500)
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let view3: UIView = {
        let view = UIView(frame: CGRect(x: 170, y: 236, width: 100, height: 200))
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let changeButton: UIButton = {
        var button = UIButton(frame: CGRect(x: 100, y: 700, width: 100, height: 30))
        button.setTitle("옮겨져랏!", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(changeBound), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let components: [Any] = [view1, view2, view3, changeButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }
    
    @objc
    private func changeBound() {
        view2.bounds = CGRect(x: 98, y: 157, width: 300, height: 500)
        
    }
    
}

