//
//  ViewController.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/7/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var enemyLbl     : UILabel!
    @IBOutlet weak var playerLbl    : UILabel!
    @IBOutlet weak var printLbl     : UILabel!
    @IBOutlet weak var chestButton  : UIButton!
    @IBOutlet weak var attackButton : UIButton!
    @IBOutlet weak var enemyImg     : UIImageView!
    
    var game : Game!;
    var soundEffects : SoundEffects!;

    

    @IBAction func pressChestButton(sender: AnyObject) {
        soundEffects.playLootSound();
        chestButton.hidden = true;
        printLbl.text = game.droppedLoot;
        respawnEnemy();
        
    }
    
    @IBAction func pressAttackButton(sender: AnyObject) {
        let int_attackPower = UInt32(game.player.attackPower);
        let attackPower = Int(arc4random_uniform(int_attackPower));
        

        
        if(game.enemy.attemptAttack(attackPower)){
            printLbl.text = "\(game.player.name) Attacked \(game.enemy.type) for \(attackPower)";
            enemyLbl.text = "\(game.enemy.hp) HP";
            soundEffects.playAttackSound();
        }else{
            printLbl.text = "Attack for \(attackPower) was unsuccessful!";
            soundEffects.playMisSound();
            
        }
        
        if(!game.enemy.isAlive){
            printLbl.text = "Enemy Killed Check The Chest For Loot!";
            enemyLbl.text = "";
            enemyImg.hidden = true;
        }

        if let loot = game.enemy.dropLoot() {
            game.player.addToInventory(loot);
            game.droppedLoot = "Player \(game.player.name) found \(loot)";
            chestButton.hidden = false;
            attackButton.hidden = true;
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soundEffects = SoundEffects();
        game         = Game(playerName: "Ryan");
        soundEffects.playBackgroundMusic();
        // Do any additional setup after loading the view, typically from a nib.
        playerLbl.text = "\(game.player.hp) HP";
        generateEnemy();
    }
    
    func respawnEnemy(){
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateEnemy", userInfo: nil, repeats: false);
    }
    
    func generateEnemy(){
        game.generateEnemy();
        enemyLbl.text = "\(game.enemy.hp) HP";
        printLbl.text = "\(game.player.name) Has Run Into A \(game.enemy.type)";
        enemyImg.hidden = false;
        enemyImg.image  = UIImage(named: game.enemy.avatar);
        attackButton.hidden = false;
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

