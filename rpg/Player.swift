//
//  Player.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/7/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation


class Player: Character {
    
    private var _name       : String = "Player 1";
    
    override var avatar : String{
        return "player";
    }
    
    var name : String{
        get {
            return _name;
        }
    }
    
    private var _inventory = [String]();
    
    var invertory : [String] {
        get {
            return _inventory;
        }
    }
    
    func addToInventory(item : String){
        _inventory.append(item);
    }
    
    convenience init(name : String, startHp : Int, attackPower : Int){
        self.init(startHp : startHp, attackPower : attackPower, avatar : "player");
        self._name = name;
    }
    
    
    
}