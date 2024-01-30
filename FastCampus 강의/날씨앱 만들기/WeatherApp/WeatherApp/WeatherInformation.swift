//
//  WeatherInformation.swift
//  WeatherApp
//
//  Created by ryu hyunsun on 2023/12/31.
//

import Foundation

// Codable: 자신을 변환하거나 외부 표현으로 변환할 수 있는 타입
// 외부 표현 = json 과 같은 타입
// Decodable : 자신을 외부 표현에서 디코딩 할 수 있는 타입
// Encodable : 자신을 외부 표현에서 인코딩 할 수 있는 타입
// Codable 프로토콜을 채택했다? Json 디코딩과 인코딩이 모두 가능함.
struct WeatherInformation: Codable {
    let weather: [Weather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    // 구조체에 선언한 프로퍼티와, 서버에서 받은 데이터의 키값이 다를때 아래처럼 매핑.
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
    
}
