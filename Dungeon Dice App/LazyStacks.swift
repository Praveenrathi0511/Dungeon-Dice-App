//
//  LazyStacks.swift
//  Dungeon Dice App
//
//  Created by Praveen rathi on 10/10/1945 Saka.
//

import SwiftUI

struct LazyStacks: View {
    @State private var columns = [
        GridItem(.flexible(maximum: 130)),
        GridItem(.flexible(maximum: 200))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<1000) { _ in
                    RedAndCyanView()
                }
            }
        }
        .padding()
    }
}

struct RedAndCyanView: View {
    var body: some View {
        ZStack{
            Color.red
            Rectangle()
                .fill(.cyan)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    LazyStacks()
}


