//
//  DevilWizard.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/7/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation


class DevilWizard: Enemy {
    
    
    override var loot : [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"];
    }
    
    override var type : String {
        return "Devil Wizard";
    }
    
    convenience init() {
        self.init(startHp : 50, attackPower : 12, avatar : "enem1");
    }
    
}