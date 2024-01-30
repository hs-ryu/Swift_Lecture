//
//  AssetSectionView.swift
//  SwiftUIPractice
//
//  Created by ryu hyunsun on 2022/06/01.
//

import SwiftUI

struct AssetSectionView: View {
    // ObservableObject를 쓰려면 ObservedObject 사용
    @ObservedObject var assetSection: Asset
    var body: some View {
        VStack(spacing: 20) {
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data) { asset in
                HStack {
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(Color.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(Color.primary)
                }
                Divider()
                
            }
        }
        .padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = Asset(id: 0, type: .bankAccount, data: [
            AssetData(id: 0, title: "시발1", amount: "개시발1"),
            AssetData(id: 1, title: "시발2", amount: "개시발2"),
            AssetData(id: 2, title: "시발3", amount: "개시발3")
        
        ])
        AssetSectionView(assetSection: asset)
    }
}
