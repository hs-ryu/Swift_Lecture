//
//  ContentView.swift
//  finalpjt
//
//  Created by ryu hyunsun on 2023/09/19.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var moveToMain: Bool = false
}

struct FirstView: View {
    @EnvironmentObject var appState: AppState
    @State var isView1Active: Bool = false
    @State var isView2Active: Bool = false
    
    var type = ["동물", "과일"]
    var animals = [
        Model(name: "사자", image: Image("lion"), description: "사자입니다"),
        Model(name: "강아지", image: Image("dog"), description: "강아지입니다"),
        Model(name: "고양이", image: Image("cat"), description: "고양이입니다"),
        Model(name: "새", image: Image("bird"), description: "새입니다")]
    
    var fruits = [
        Model(name: "사과", image: Image("apple"), description: "사과입니다"),
        Model(name: "포도", image: Image("grape"), description: "포도입니다"),
        Model(name: "파인애플", image: Image("pineapple"), description: "파인애플입니다")]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SecondView(title: "동물", names: animals), isActive: $isView1Active) {
                    Text("동물")
                }
                NavigationLink(destination: SecondView(title: "과일", names: fruits), isActive: $isView2Active) {
                    Text("과일")
                }
            }
            .navigationTitle("품목")
            
        }
        .onReceive(appState.$moveToMain) {
            moveToMain in
            if moveToMain {
                self.appState.moveToMain = false
                self.isView1Active = false
                self.isView2Active = false
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
