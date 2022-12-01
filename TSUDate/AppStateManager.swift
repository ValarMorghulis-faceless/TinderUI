//
//  AppStateManager.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 28.11.22.
//

import Foundation



class AppStateManager: ObservableObject {
    @Published var selectedTab : TabBarButtonType = .fire
}
