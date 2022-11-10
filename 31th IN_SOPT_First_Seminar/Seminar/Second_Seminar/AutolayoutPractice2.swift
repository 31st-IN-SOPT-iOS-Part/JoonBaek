//
//  AutolayoutPractice2.swift
//  31th IN_SOPT_First_Seminar
//
//  Created by Joon Baek on 2022/10/08.
//

import UIKit

import SwiftyColor
import SwiftUI

class AutolayoutPractice2: UIViewController {
    private let firstView = UIView()
    private let secondView = UIView()
    private let thirdView = UIView()
    private let fourthView = UIView()
    private let fifthView = UIView()
    

    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        config()

    }
}

//MARK: - extensions

extension AutolayoutPractice2 {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        
        let components: [Any] = [
            firstView,
            secondView,
            thirdView,
            fourthView,
            fifthView
        ]
        
        let width = UIScreen.main.bounds.width
        
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        firstView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(105)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(width - 72 * 2)
            make.height.equalTo(width * (153/width))
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(23)
            make.leading.equalTo(firstView.snp.leading)
            make.trailing.equalTo(firstView.snp.centerX).offset(-2.5)
            make.height.equalTo(firstView.snp.height)
        }
        
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.top)
            make.trailing.equalTo(firstView.snp.trailing)
            make.leading.equalTo(firstView.snp.centerX).offset(2.5)
            make.height.equalTo(32)
        }
        
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(thirdView.snp.bottom).offset(5)
            make.leading.trailing.equalTo(thirdView)
            make.height.equalTo(thirdView)
        }
        
        fifthView.snp.makeConstraints { make in
            make.top.equalTo(fourthView.snp.bottom).offset(5)
            make.leading.trailing.equalTo(thirdView)
            make.bottom.equalTo(secondView)
        }
    }
        //MARK: - General Helpers
        
        private func config() {
            firstView.backgroundColor = .systemGray
            secondView.backgroundColor = .systemGray
            thirdView.backgroundColor = .systemGray
            fourthView.backgroundColor = .systemGray
            fifthView.backgroundColor = .systemGray
        }
        
}
    
    


//struct PreView: PreviewProvider {
//    static var previews: some View {
//        AutolayoutPractice2().toPreview()
//    }
//}
//
////전처리
//#if DEBUG
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//        let viewController: UIViewController
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//    }
//
//    func toPreview() -> some View {
//        Preview(viewController: AutolayoutPractice2())
//    }
//}
//#endif
