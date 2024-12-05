////
////  HomeViewModel.swift
////  Horoscode
////
////  Created by Carolane Lefebvre on 23/11/2024.
////
//
//import Foundation
//import SwiftUI
//import StoreKit
//
//extension App.Home.ViewModels {
//    @Observable
//    final class HomeViewModel {
//
//enum RequestReviewTime {
//    static let threeMonthInterval: TimeInterval = 3 * 30 * 24 * 60 * 60
//}
//        let threeMonthInterval = App.Home.Constants.RequestReviewTime.threeMonthInterval
//        @AppStorage("lastReviewPromptDate") private var lastReviewPromptDate: Date?
//       // @AppStorage("lastVersionPromptedForReview") private var lastVersionPromptedForReview: String?
//        
//        func shouldRequestReview() -> Bool {
//            let currentDate = Date()
//            
////            guard let currentAppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
////                return false
////            }
//            
////            if lastVersionPromptedForReview == currentAppVersion {
////                return false
////            }
//            
//            if let lastPromptDate = lastReviewPromptDate {
//                let timeSinceLastPrompt = currentDate.timeIntervalSince(lastPromptDate)
//                if timeSinceLastPrompt < threeMonthInterval {
//                    return false
//                }
//            }
//            return true
//        }
//        
//        func recordReviewRequest() {
//            lastReviewPromptDate = Date()
//            // lastVersionPromptedForReview = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
//        }
//        
//    }
//}
