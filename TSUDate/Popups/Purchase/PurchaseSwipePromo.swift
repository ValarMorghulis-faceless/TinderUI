//
//  PurchaseSwipePromo.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 04.12.22.
//

import SwiftUI

struct PurchaseSwipePromo: View {
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "thermometer.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                Text("25 people already like you!")
                    .font(.system(size:18, weight: .semibold))
                Text("Match with them insantly")
            }
            VStack {
                Image(systemName: "paperplane.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                Text("25 people already like you!")
                    .font(.system(size:18, weight: .semibold))
                Text("Match with them insantly")
            }
            VStack {
                Image(systemName: "calendar.badge.plus")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                Text("25 people already like you!")
                    .font(.system(size:18, weight: .semibold))
                Text("Match with them insantly")
            }


        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onAppear {
            setupAppearance()
        }
    
    }
}
func setupAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .systemPink
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
  }

struct PurchaseSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipePromo()
            .frame(height: UIScreen.main.bounds.height / 3)
    }
}
