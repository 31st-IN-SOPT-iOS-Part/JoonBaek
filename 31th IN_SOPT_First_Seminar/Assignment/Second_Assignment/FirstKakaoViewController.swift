//
//  SignInViewController.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/03.
//

import UIKit

import SnapKit
import SwiftyColor

//MARK: - SignInViewController

class FirstKakaoViewController: UIViewController {
    
    //MARK: - UIComponents
    
    private let startLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.text = "카카오톡을 시작합니다"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "사용하시던 카카오계정이 있다면 \n이메일 또는 전화번호로 로그인해 주세요."
        label.numberOfLines = 0
        label.textAlignment = .center
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
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = 0xF6F6F6.color
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(presentToWelcomeVC), for: .touchUpInside)
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = 0xF6F6F6.color
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(pushToSignUpVC), for: .touchUpInside)
        return button
    }()
    
    private let findButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
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

extension FirstKakaoViewController {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        
        let components:[Any] = [
            startLabel,
            descriptionLabel,
            emailTextField,
            passwordTextField,
            passwordTextField,
            loginButton,
            signInButton,
            findButton,
            emailUnderLineView,
            passwordUnderLineView
        ]
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        let width = UIScreen.main.bounds.width
        
        startLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(startLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(60)
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
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(emailTextField.snp.leading)
            $0.height.equalTo(44)
        }

        signInButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(emailTextField.snp.leading)
            $0.height.equalTo(loginButton.snp.height)
        }

        findButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(177)
            $0.height.equalTo(29)
        }
        //width랑 leading을 같이 줄 수 없음
    }
    
    //MARK: - Action Helpers
    
    @objc
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        
        if let email = emailTextField.text {
            welcomeVC.dataBind(userName: email)
        }
        
        self.present(welcomeVC,animated: true, completion: nil)
    }
    
    @objc
    private func pushToSignUpVC() {
        let signUpVC = SecondKakaoViewController()
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}

