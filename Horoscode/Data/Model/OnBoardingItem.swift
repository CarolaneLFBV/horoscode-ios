//
//  OnBoardingItem.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 05/12/2024.
//

import Foundation

struct OnBoardingItem: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    
    private enum Constants {
        enum Titles {
            static let welcomeTab = String(localized: "Welcome")
            static let welcomeHeadlineTab = String(localized: "WelcomeHeadline")
            static let detailTab = String(localized: "Detail")
            static let detailHeadlineTab = String(localized: "DetailHeadline")
        }
    }
    
}

extension OnBoardingItem {
    static var items: [OnBoardingItem] = [
        OnBoardingItem(title: Constants.Titles.welcomeTab,
                       headline: Constants.Titles.welcomeHeadlineTab,
                       image: "HoroscodeGlobe"),
        OnBoardingItem(title: Constants.Titles.detailTab,
                       headline: Constants.Titles.detailHeadlineTab,
                       image: "AstroSignCards")
    ]
}
