//
//  Kimara.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/7/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation


class Kimara: Enemy {
    
    let IMMUNE_MAX = 15;
    
    override var type : String {
        return "Kimara";
    }
    
    override var loot : [String] {
        return ["Tough Hide", "Kimara Venom"];
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if(attackPower >= IMMUNE_MAX){
            return super.attemptAttack(attackPower);
        }else {
            return false;
        }
    }
    
    convenience init() {
        self.init(startHp : 50, attackPower : 10, avatar : "enem2");
    }
    
}