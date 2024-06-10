
//  ViewController.swift
//  TodayMovieApp
//
//  Created by 심소영 on 6/7/24.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    let backgroundImage = UIImageView()
    let tableView = UITableView()
    let textField = UITextField()
    let searchButton = UIButton()
    
    var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureUI()
        configureLayout()
    }
    
    override func viewDidLayoutSubviews() {
        textField.setTextField()
    }
    
    func configureHierarchy(){
        view.addSubview(backgroundImage)
        view.addSubview(textField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
    }
    func configureLayout(){
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.height.equalTo(40)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(textField.snp.trailing).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
    }
    func configureUI(){
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 45
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.9
        searchButton.setButton()
        searchButton.addTarget(self, action: #selector(callrequest), for: .touchUpInside)
    }
    
    @objc
    func callrequest(){
        let date = textField.text
        let url = "\(URL.url)\(date ?? "20240606")"
        AF.request(url).responseDecodable(of: [Movie].self) { response in
            switch response.result {
            case .success(let value):
                self.movieList = value
                self.tableView.reloadData()
            case .failure( _):
                self.textField.text = "날짜를 입력해주세요"
            }
        }
//        AF.request(url).responseString { response in
//            switch response.result {
//            case .success(let value):
//                print(value)
//                self.tableView.reloadData()
//            case .failure(let error):
//                print(error)
//            }
//        }
}
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList[0].boxOfficeResult.dailyBoxOfficeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.rankLabel.text = movieList[0].boxOfficeResult.dailyBoxOfficeList[indexPath.row].rank
        cell.nameLabel.text = movieList[0].boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        cell.dateLabel.text = movieList[0].boxOfficeResult.dailyBoxOfficeList[indexPath.row].openDt
        return cell
    }
}

