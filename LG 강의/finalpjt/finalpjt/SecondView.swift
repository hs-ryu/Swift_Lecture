//
//  SecondView.swift
//  finalpjt
//
//  Created by ryu hyunsun on 2023/09/19.
//

import SwiftUI

struct SecondView: View {
    var title: String
    var names: [Model]
    
    var body: some View {
        List(names, id: \.name) {model in
            NavigationLink(destination: ThirdView(model: model)){
                Text(model.name)
            }
        }.navigationTitle(title)
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(title: "test", names: [
            Model(name: "사자", image: Image(systemName: "xmark"), description: "사자입니다"),
        ])
    }
}
