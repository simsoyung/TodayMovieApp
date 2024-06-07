//
//  Extension.swift
//  TodayMovieApp
//
//  Created by 심소영 on 6/7/24.
//

import UIKit

extension UILabel {
    
    func setRankLabel() {
        self.font = .boldSystemFont(ofSize: 15)
        self.textColor = .black
        self.textAlignment = .center
        self.backgroundColor = .white
    }
    
    func setNameLabel() {
        self.font = .boldSystemFont(ofSize: 15)
        self.textColor = .white
        self.textAlignment = .left
        self.backgroundColor = .clear
    }
    
    func setDateLabel() {
        self.font = .boldSystemFont(ofSize: 12)
        self.textColor = .white
        self.textAlignment = .center
    }
}

extension UITextField {
    func setTextField() {
        self.textColor = .white
        self.font = .systemFont(ofSize: 15, weight: .medium)
        self.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 2)
        border.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer((border))
        self.textColor = UIColor.white
        self.placeholder = "20010101 날짜를 입력해주세요"
    }
}

extension UIButton {
    func setButton(){
        self.setTitle("검색", for: .normal)
        self.titleLabel?.numberOfLines = 0
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
    }
}
