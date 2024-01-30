//
//  BannerCard.swift
//  SwiftUIPractice
//
//  Created by ryu hyunsun on 2022/05/31.
//

import SwiftUI

struct BannerCard: View {
    var banner: AssetBanner
    
    var body: some View {
        Color(banner.backgroundColor)
            .overlay(
                VStack {
                    Text(banner.title)
                        .font(.title)
                    Text(banner.description)
                        .font(.subheadline)
                }
            )
    }
}

struct BannerCard_Previews: PreviewProvider {
    static var previews: some View {
        let banner0 = AssetBanner(title: "공지사항", description: "공지사항 확인", backgroundColor: .red)
        BannerCard(banner: banner0)
    }
}
