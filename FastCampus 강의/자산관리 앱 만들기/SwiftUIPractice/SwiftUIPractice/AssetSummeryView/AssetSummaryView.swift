//
//  AssetSummaryView.swift
//  SwiftUIPractice
//
//  Created by ryu hyunsun on 2022/06/01.
//

import SwiftUI

struct AssetSummaryView: View {
    //외부에서 AssetSummeryData라는걸 받아서 전체 상태를 변경시키고 표현한다는 의미
    @EnvironmentObject var assetData: AssetSummeryData
    var assets: [Asset] {
        return assetData.assets
    }
    
    var body: some View {
        VStack(spacing: 20){
            
            ForEach(assets) { asset in
                switch asset.type {
                case .creditCard:
                    AssetCardSectionView(asset: asset)
                        .frame(idealHeight: 250)
                default:
                    AssetSectionView(assetSection: asset)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

//EnvironmentObject는 preview에서 environmentObject를 임의로 넣어줄 수 있음.

struct AssetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSummaryView()
            .environmentObject(AssetSummeryData())
            .background(Color.gray.opacity(0.2))
    }
}
