//
//  AssetSummeryData.swift
//  SwiftUIPractice
//
//  Created by ryu hyunsun on 2022/06/01.
//

import SwiftUI

class AssetSummeryData: ObservableObject {
    @Published var assets: [Asset] = load("assets.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // 파일 가져오기.
    // 없다면 에러내기.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError(filename + "을 찾을수 없다.")
    }
    
    // 파일을 찾았다면, 파일로 부터 data 빼오기
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(filename + "을 찾을수 없다.")
    }
    
    // 데이터 잘 가지고 왔다면 디코더 하기.
    // T.self -> 제너릭 타입으로 가져오기.
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError(filename + "을 \(T.self)로 파싱할 수 없습니다.")
    }
    
    
}
