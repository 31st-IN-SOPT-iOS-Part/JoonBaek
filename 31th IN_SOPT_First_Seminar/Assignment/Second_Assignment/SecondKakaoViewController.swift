//
//  MainViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/03.
//

import UIKit

import SnapKit
import SwiftyColor

//MARK: -MainViewController

class SecondKakaoViewController: UIViewController {
    
    //MARK: - UIComponents
    
    private let startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 110, y: 100, width: 300, height: 30))
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "카카오톡을 시작합니다"
        return label
    }()
    
    private let emailTextField: UITextField = {
        
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.borderStyle = .none
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    private let emailUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = 0x9F9E9F.color
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.borderStyle = .none
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private let passwordUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = 0x9F9E9F.color
        return view
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15, weight: .medium)
        textField.borderStyle = .roundedRect
        textField.borderStyle = .none
        textField.placeholder = "비밀번호 확인"
        return textField
    }()
    
    private let confirmPasswordUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = 0x9F9E9F.color
        return view
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = 0xF6F6F6.color
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(presentToWelcomeVC), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
}

//MARK: - Extensions

extension SecondKakaoViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        
        let components:[Any] = [
            startLabel,
            emailTextField,
            emailUnderLineView,
            passwordTextField,
            passwordUnderLineView,
            confirmPasswordTextField,
            confirmPasswordUnderLineView,
            signInButton
        ]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        let width = UIScreen.main.bounds.width
        
        startLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(startLabel.snp.bottom).offset(116)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(21)
            $0.height.equalTo(width * (49/width))
        }
        
        emailUnderLineView.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom)
            $0.leading.trailing.equalTo(self.emailTextField)
            $0.height.equalTo(1)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(21)
            $0.height.equalTo(width * (49/width))
        }

        passwordUnderLineView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.leading.trailing.equalTo(self.emailTextField)
            $0.height.equalTo(1)
        }

        confirmPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.emailTextField)
            $0.height.equalTo(self.emailTextField)
        }
        
        confirmPasswordUnderLineView.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(self.emailTextField)
            $0.height.equalTo(1)
        }

        signInButton.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(26)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(self.emailTextField)
            $0.height.equalTo(width * (44/width))
        }
    }
    
    //MARK: - Action Helpers
    
    @objc
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        
        if let email = emailTextField.text {
            welcomeVC.dataBind(userName: email)
        }
        
        self.present(welcomeVC, animated: true, completion: nil)
        }
    
//    @objc
//    private func touchupNextButton() {
//        presentToWelcomeVC()
//    }
}
