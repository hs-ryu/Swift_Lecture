//
//  AssetCardSectionView.swift
//  SwiftUIPractice
//
//  Created by ryu hyunsun on 2022/06/01.
//

import SwiftUI

struct AssetCardSectionView: View {
    @State private var selectedTab = 1
    @ObservedObject var asset: Asset
    
    // asset 중에서 data만 뽑아 쓸거야!
    var assetData : [AssetData] {
        return asset.data
    }
    
    var body: some View {
        VStack{
            AssetSectionHeaderView(title: asset.type.title)
            TabMenuView(tabs: ["지난달 결제", "이번달 결제", "다음달 결제"],
                        selectedTab: $selectedTab,
                        updated: .constant(.nextMonth(amount: "10,000")))
            
            TabView(selection: $selectedTab,
                    content: {
                        ForEach(0...2,id:\.self) { i in
                            VStack {
                                ForEach(asset.data) { data in
                                    HStack {
                                        Text(data.title)
                                            .font(.title)
                                            .foregroundColor(.secondary)
                                        Spacer()
                                        Text(data.creditCardAmounts![i].amount)
                                            .font(.title2)
                                            .foregroundColor(.primary)
                                }
                                Divider()
                            }
                        }
                        .tag(i)
                    }
                }
            )
//            .tapViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct AssetCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = AssetSummeryData().assets[5]
        AssetCardSectionView(asset: asset)
    }
}
