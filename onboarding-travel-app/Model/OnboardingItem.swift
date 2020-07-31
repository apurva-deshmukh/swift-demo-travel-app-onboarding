//
//  OnboardingItem.swift
//  onboarding-travel-app
//
//  Created by Apurva Deshmukh on 7/31/20.
//  Copyright © 2020 Apurva Deshmukh. All rights reserved.
//

import UIKit

struct OnboardingItem {
    let title: String
    let detail: String
    let bgImage: UIImage?
    
    static let placeholderItems: [OnboardingItem] = [
        .init(title: "Travel Your Way",
              detail: "Travel the world by air, rail, or sea at the most competitive prices!",
              bgImage: UIImage(named: "imTravel1")),
        .init(title: "Stay Your Way",
              detail: "With millions of hotels worldwide, find the perfect accommodation in the most amazing places!",
              bgImage: UIImage(named: "imTravel2")),
        .init(title: "Discover Your Way",
              detail: "Explore exotic destinations with our new features that link you to like-minded travelers!",
              bgImage: UIImage(named: "imTravel3")),
        .init(title: "Feast Your Way",
              detail: "Enjoy delicious cuisines that are highly recommended by the locals!",
              bgImage: UIImage(named: "imTravel4"))
    ]
}
