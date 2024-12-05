//
//  OnBoadingView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 05/12/2024.
//

import SwiftUI


struct OnBoardingView: View {
    @Binding var isOnboardingComplete: Bool

    var body: some View {
        VStack {
            TabView {
                ForEach(OnBoardingItem.items) { item in
                    VStack(spacing:20){
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        
                        Text(item.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(item.headline)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
            }
            
            Button {
                isOnboardingComplete.toggle()
            } label: {
                Text("OK")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color("PinkHoroscode"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))

            }
            .padding()
        }
        .background {
            Color("PrimaryBackgroundColor")
                .ignoresSafeArea()
        }
        .interactiveDismissDisabled()
        .tabViewStyle(.page)
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .label
            UIPageControl.appearance().pageIndicatorTintColor = .systemGray
        }
    }
}

#Preview {
    OnBoardingView(isOnboardingComplete: .constant(true))
}
