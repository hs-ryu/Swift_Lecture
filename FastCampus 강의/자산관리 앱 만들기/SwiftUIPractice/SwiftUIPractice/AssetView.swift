//
//  AssetView.swift
//  SwiftUIPractice
//
//  Created by ryu hyunsun on 2022/05/31.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing:30) {
                    Spacer()
                    AssetMenuGridView()
                    AssetBannerView()
                        .aspectRatio(5/2, contentMode: .fit)
                    AssetSummaryView()
                        .environmentObject(AssetSummeryData())
                }
            }
            .background(Color.gray.opacity(0.2))
            .navigationBarWithButtonStyle("내 자산")
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
