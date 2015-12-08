//
//  Enemy.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/7/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation


class Enemy: Character {
    
    var type : String{
        return "Grunt";
    }
    
    var loot : [String] {
        return ["Rusty Dagger", "Gold Coin"];
    }
    
    private var _inventory = [String]();
    
    var invertory : [String] {
        return _inventory;
    }
    
    func dropLoot() -> String? {
        if (!isAlive){
            let rand = Int(arc4random_uniform(UInt32(loot.count)));
            return loot[rand];
        }
        return nil;
    }
    
    override init(startHp : Int, attackPower : Int, avatar : String){
        super.init(startHp : startHp, attackPower : attackPower, avatar : avatar);
    }
    
    
    convenience init(startHp : Int, attackPower : Int){
        self.init(startHp : startHp, attackPower : attackPower, avatar : "enemy1");
    }
    
    
}