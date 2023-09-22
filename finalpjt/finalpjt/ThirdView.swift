//
//  ThirdView.swift
//  finalpjt
//
//  Created by ryu hyunsun on 2023/09/19.
//

import SwiftUI

struct ThirdView: View {
    var model: Model
    @EnvironmentObject var appState: AppState
    @State private var showDetail = false

    var body: some View {
        VStack(spacing: 50) {
            model.image
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(hue: 1.0, saturation: 0.0, brightness: 0.868), lineWidth: 7))
            HStack(spacing: 30) {
                Button(action: {
                    // Navigation Pop
                    appState.moveToMain = true
                }) {
                    Text("처음으로")
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding()
                    .background(.orange)
                    .cornerRadius(15)
                }
                
                Button(action: {
                    showDetail.toggle()
                    // half sheet 띄우기
                }) {
                    Text("세부정보")
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding()
                    .background(.orange)
                    .cornerRadius(15)
                }
            }
            
        }.sheet(isPresented: $showDetail) {
            VStack {
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                    }
                    Image(systemName: "xmark")
                        .padding(20)
                        .onTapGesture {
                            showDetail.toggle()
                        }
                }
                
                Spacer()
                Text(model.description)
                Spacer()
            }.presentationDetents([.medium, .large])
        }
        
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView(model: Model(name: "사자", image: Image("lion"), description: "사자입니다"))
    }
}
