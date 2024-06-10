//
//  Movie.swift
//  TodayMovieApp
//
//  Created by 심소영 on 6/10/24.
//

import Foundation

struct Movie: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult:Decodable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList:Decodable {
    let rank, movieNm, openDt: String
}
