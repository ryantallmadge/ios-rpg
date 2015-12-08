//
//  Character.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/7/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation


class Character {
    
    private var _hp             : Int = 100;
    private var _attackPower    : Int = 100;
    private var _avatar         : String = "";
    
    var attackPower : Int {
        get {
            return _attackPower;
        }
    }
    
    var avatar  : String {
        get {
            return _avatar;
        }
    }
    
    var hp : Int {
        get {
            return _hp;
        }
    }
    
    var isAlive : Bool {
        get {
            if (hp <= 0){
                return false;
            }else{
                return true;
            }
        }
    }
    
    
    init(startHp : Int , attackPower : Int, avatar : String){
        self._hp          = startHp;
        self._attackPower = attackPower;
        self._avatar      = avatar;
    }
    
    func attemptAttack(attackPower : Int) -> Bool {
        self._hp -= attackPower;
        return true;
    }
    
    
}