//
//  Bundle+AppVersion.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 24/12/2024.
//

import Foundation

extension Bundle {
    static var currentAppVersion: String? {
          Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
      }
}
