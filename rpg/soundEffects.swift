//
//  soundEffects.swift
//  rpg
//
//  Created by Ryan Tallmadge on 12/8/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import Foundation
import AVFoundation



class SoundEffects {
    var backGroundSoundAVA             : AVAudioPlayer!;
    var attackSoundAVA                 : AVAudioPlayer!;
    var lootSoundAVA                   : AVAudioPlayer!;
    var misSoundAVA                   : AVAudioPlayer!;
    var backgroundMusicFile            : String = "02 Underclocked (underunderclocked mix)";
    var attackSoundFile                : String = "attack";
    var lootSoundFile                  : String = "loot";
    var misSoundFile                   : String = "mis";
    
    init(){
        self.loadAttackSound();
        self.loadLootSound();
        self.loadMisSound();
    }
    
    
    
    private func loadMisSound(){
        let path     = NSBundle.mainBundle().pathForResource(misSoundFile, ofType: "wav");
        let soundURL = NSURL(fileURLWithPath: path!);
        
        do{
            try
                misSoundAVA = AVAudioPlayer(contentsOfURL: soundURL);
                misSoundAVA.prepareToPlay();
            
        } catch let err as NSError{
            print(err.debugDescription);
        }
        
    }
    
    private func loadLootSound(){
        let path     = NSBundle.mainBundle().pathForResource(attackSoundFile, ofType: "wav");
        let soundURL = NSURL(fileURLWithPath: path!);
        
        do{
            try
                lootSoundAVA = AVAudioPlayer(contentsOfURL: soundURL);
                lootSoundAVA.prepareToPlay();
            
        } catch let err as NSError{
            print(err.debugDescription);
        }
        
    }
    
    private func loadAttackSound(){
        let path     = NSBundle.mainBundle().pathForResource(lootSoundFile, ofType: "wav");
        let soundURL = NSURL(fileURLWithPath: path!);
        
        do{
            try
                attackSoundAVA = AVAudioPlayer(contentsOfURL: soundURL);
                attackSoundAVA.prepareToPlay();

        } catch let err as NSError{
            print(err.debugDescription);
        }
    
    }
    
    func playMisSound(){
        misSoundAVA.play();
    }
    
    func playLootSound(){
        lootSoundAVA.play();
    }
    
    func playAttackSound(){
        attackSoundAVA.play();
    }
    
    func playBackgroundMusic(){
        
        let path     = NSBundle.mainBundle().pathForResource(backgroundMusicFile, ofType: "mp3");
        let soundURL = NSURL(fileURLWithPath: path!);
        
        do{
            try
                backGroundSoundAVA = AVAudioPlayer(contentsOfURL: soundURL);
                backGroundSoundAVA.numberOfLoops = -1;
                backGroundSoundAVA.prepareToPlay();
                backGroundSoundAVA.play();
        } catch let err as NSError{
            print(err.debugDescription);
        }
    }
}