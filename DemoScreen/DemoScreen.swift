//
//  DemoScreen.swift
//  DemoScreen
//
//  Created by SanamS on 02/12/17.
//  Copyright © 2017 SanamS. All rights reserved.
//

import UIKit
import paper_onboarding

class DemoScreen: UIViewController {
    //Outlets
    @IBOutlet weak var onbaordingObj: OnboardingVIewClass!
    @IBOutlet weak var doneBtnOu: UIButton!
    
    
    
    //Variables
    var userData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
      onbaordingObj.dataSource = self
        onbaordingObj.delegate = self
        
    }
    
    //Actions
    @IBAction func doneButtonPressed(_ sender: Any) {
        userData.set(true, forKey: "demoCompleted")
        userData.synchronize()
    }
    
    


}

extension DemoScreen: PaperOnboardingDataSource, PaperOnboardingDelegate {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        
        let bgOne = #colorLiteral(red: 0.9529411765, green: 0.4470588235, blue: 0.3294117647, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        let bgThree = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let titleFont = UIFont(name: "HelveticaNeue-Bold", size: 18)!
        let descFont = UIFont(name: "HelveticaNeue", size: 14)!
        
        return [(#imageLiteral(resourceName: "illustration"), "Beer", "Beer is awesome.", #imageLiteral(resourceName: "active"), bgOne, textColor, textColor, titleFont, descFont),
                (#imageLiteral(resourceName: "post-1"), "Post", "Post is awesome.", #imageLiteral(resourceName: "active"), bgTwo, textColor, textColor, titleFont, descFont),
                (#imageLiteral(resourceName: "card-1"), "Card", "Card is awesome.", #imageLiteral(resourceName: "active"), bgThree, textColor, textColor, titleFont, descFont)][index]
        
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            doneBtnOu.isHidden = false
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index != 2 {
            if doneBtnOu.isHidden == false {
                doneBtnOu.isHidden = true
            }
        }
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    
}

