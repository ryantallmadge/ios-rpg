//
//  Game.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/8/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation


class Game {
    private var _droppedLoot = "";
    var player : Player!;
    var enemy  : Enemy!;
    
    init(playerName : String){
        loadPlayer(playerName);
    }
    
    var droppedLoot : String {
        get{
            return _droppedLoot;
        }
        set {
            _droppedLoot = newValue;
        }
    };
    
    func loadPlayer(playerName : String) -> Player{
        player = Player(name : playerName , startHp : 110, attackPower: 20);
        return player;
    }
    
    
    func getDroppedLoot() -> String{
        return droppedLoot;
    }
    
    func generateEnemy() -> Enemy{
        let rand = Int(arc4random_uniform(2));
        if(rand == 0){
            enemy = Kimara();
        }else{
            enemy = DevilWizard();
        }
        return enemy;
    }
    
}