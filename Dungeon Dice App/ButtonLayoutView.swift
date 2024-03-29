//
//  ButtonLayoutView.swift
//  Dungeon Dice App
//
//  Created by Praveen rathi on 13/10/1945 Saka.
//

import SwiftUI

struct ButtonLayoutView:View {
    
    @Binding var resultMessage:String
    
    enum Dice:Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    struct DeviceWidthPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
        
        typealias Value = CGFloat
        
        
    }
    
    let horizontalPadding:CGFloat = 16
    let spacing:CGFloat = 0
    let buttonWidth:CGFloat = 102
    @State private var buttonsLeftOver = 0 //number of buttons less than a full row
    
    var body: some View {
        VStack{
            LazyVGrid(columns:[GridItem(.adaptive(minimum: buttonWidth),spacing: spacing)]) {
                ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
                    Button("\(dice.rawValue)-sided") {
                        resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice."
                    }
                    .frame(width: buttonWidth)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            HStack {
                ForEach(Dice.allCases.suffix(buttonsLeftOver),id: \.self) { dice in
                    Button("\(dice.rawValue)-sided") {
                        resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice."
                    }
                    .frame(width: buttonWidth)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
        }
        .overlay {
            GeometryReader{ geo in
                Color.clear
                    .preference(key: DeviceWidthPreferenceKey.self, value: geo.size.width)
            }
        }
        .onPreferenceChange(DeviceWidthPreferenceKey.self) { deviceWidth in
            arrangeGridItem(deviceWidth: deviceWidth)
        }
    }
    func arrangeGridItem(deviceWidth: CGFloat) {
        var screenWidth = (deviceWidth - horizontalPadding * 2)
        if Dice.allCases.count > 1 {
            screenWidth += spacing
        }
        let numberOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
        buttonsLeftOver = Dice.allCases.count % numberOfButtonsPerRow
    }
    
}

#Preview {
    ButtonLayoutView(resultMessage: .constant(""))
}
