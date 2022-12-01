//
//  ProfileSwipePromo.swift
//  TSUDate
//
//  Created by Giorgi Samkharadze on 29.11.22.
//

import SwiftUI

struct ProfileSwipePromo: View {
    
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                VStack(spacing: 9) {
                    Spacer()
                    Text("Get Tinder Gold")
                        .font(.system(size: 26, weight: .semibold))
                    Text("See who Likes You & more!")
                }
                .padding(.bottom, 64)
                VStack(spacing: 9) {
                    Spacer()
                    Text("Get Matches Faster")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Boost your profile once a month!")
                }
                .padding(.bottom, 64)
                VStack(spacing: 9) {
                    Spacer()
                    Text("Increase Your Chances")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Boost your profile once a month!")
                }
                .padding(.bottom, 64)
            }
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                  setupAppearance()
                }
     
            
            Button(action: {
                action()
            }, label: {
                Text("MY TINDER PLUS")
                    .foregroundColor(.red)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10)
            })
            .padding(.bottom, 30 )
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemPink
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            ProfileSwipePromo {
                print("TEst")
            }
        }
        .frame(height: 400)
    }
}
