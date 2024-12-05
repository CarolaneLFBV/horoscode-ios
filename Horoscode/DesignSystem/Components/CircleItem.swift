//
//  Header 2.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 24/11/2024.
//

import SwiftUI

extension Components {
    struct CircleItem: View {
        var sign: App.Models.Sign
        var isSelected: Bool = false
        let screenSize: CGRect = UIScreen.main.bounds
        let onTap: ((App.Models.Sign) -> Void)?
        
        enum Constants {
            enum Measures {
                static let size: Double = 70.0
                static let radius: Double = 30.0
                static let lineWidth: Double = 3.0
            }
        }
        
        var body: some View {
            ZStack {
                Circle()
                    .stroke(isSelected ?  Color("PinkHoroscode") : Color("BlueHoroscode"), lineWidth: Constants.Measures.lineWidth)
                    .frame(width: Constants.Measures.size, height: Constants.Measures.size)
                
                VStack {
                    Components.SignIcon(signName: sign.sign)
                        .padding()
                }
                .background(Color("SecondaryBackgroundColor"))
                .clipShape(
                    RoundedRectangle(cornerRadius: Constants.Measures.radius)
                )
            }
            .onTapGesture {
                onTap?(sign)
            }
        }
    }
}

#Preview {
    Components.CircleItem(sign: App.Models.Sign.example, onTap: nil)
}
