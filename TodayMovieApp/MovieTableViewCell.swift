//
//  MovieTableViewCell.swift
//  TodayMovieApp
//
//  Created by 심소영 on 6/7/24.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"

    let rankLabel = UILabel()
    let nameLabel = UILabel()
    let dateLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
    }
    func configureLayout(){
        rankLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalTo(80)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.top.equalTo(rankLabel.snp.bottom)
            make.width.equalTo(80)
        }
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.top.equalTo(nameLabel.snp.bottom)
            make.width.equalTo(80)
        }
    }
    func configureUI(){
        rankLabel.setRankLabel()
        nameLabel.setNameLabel()
        dateLabel.setDateLabel()
        rankLabel.textColor = .black
        nameLabel.textColor = .black
        dateLabel.textColor = .black
    }
}
