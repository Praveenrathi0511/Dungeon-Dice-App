//
//  ContentView.swift
//  Dungeon Dice App
//
//  Created by Praveen rathi on 10/10/1945 Saka.
//

import SwiftUI

struct ContentView: View {
    @State private var resultMessage = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                
                titleView
                
                Spacer()
                
                resultMessageView
                
                Spacer()
                
                ButtonLayoutView(resultMessage: $resultMessage)
                
            }
            .padding()

        }
    }
    

}

extension ContentView {
    private var titleView: some View{
        Text("Dungeon Dice")
            .font(.largeTitle.weight(.black))
            .foregroundStyle(.red)
    }
    private var resultMessageView: some View {
        Text(resultMessage)
            .font(.largeTitle.weight(.medium))
            .frame(height: 150)
            .multilineTextAlignment(.center)
    }
    
}



#Preview {
    ContentView()
}
