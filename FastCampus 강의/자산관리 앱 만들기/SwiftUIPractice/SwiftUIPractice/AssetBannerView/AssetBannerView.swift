//
//  AssetBannerView.swift
//  SwiftUIPractice
//
//  Created by ryu hyunsun on 2022/05/31.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList: [AssetBanner] = [
        AssetBanner(title: "공지사항", description: "추가된 공지사항 확인해라", backgroundColor: .red),
        AssetBanner(title: "이벤트1", description: "이벤트 1 설명", backgroundColor: .yellow),
        AssetBanner(title: "이벤트2", description: "이벤트 2 설명", backgroundColor: .blue),
        AssetBanner(title: "이벤트3", description: "이벤트 3 설명", backgroundColor: .green)
    ]
    @State private var currentPage = 0
    
    
    var body: some View {
        let bannerCards = bannerList.map { BannerCard(banner: $0)}
        
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: bannerCards, currentPage: $currentPage)
            PageControl(numberOfPages: bannerList.count, currentPage: $currentPage)
                .frame(width: CGFloat(bannerCards.count * 18))
                .padding(.trailing)
        }
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2,contentMode: .fit)
    }
}
