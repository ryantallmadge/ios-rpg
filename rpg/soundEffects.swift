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
    var misSoundAVA                    : AVAudioPlayer!;
    var backgroundMusicFile            : String = "02 Underclocked (underunderclocked mix)";
    var attackSoundFile                : String = "attack";
    var lootSoundFile                  : String = "loot";
    var misSoundFile                   : String = "mis";
    
    init(){
        self.loadAttackSound();
        self.loadLootSound();
        self.loadMisSound();
        self.loadBackgroundMusic();
    }
    
    private func loadMusic(file: String, fileType : String, loop : Bool) -> AVAudioPlayer{
        let path     = NSBundle.mainBundle().pathForResource(file, ofType: fileType);
        let soundURL = NSURL(fileURLWithPath: path!);
        var audioPlayer  : AVAudioPlayer!;
        
        do{
            try
                audioPlayer = AVAudioPlayer(contentsOfURL: soundURL);
                if(loop){
                    audioPlayer.numberOfLoops = -1;
                }
                audioPlayer.prepareToPlay();
                return audioPlayer;
            
        } catch let err as NSError{
            print(err.debugDescription);
        }
        
        return audioPlayer;
    }
    
    
    
    private func loadMisSound(){
        misSoundAVA = self.loadMusic(misSoundFile, fileType : "wav", loop : false);
    }
    
    private func loadLootSound(){
        lootSoundAVA = self.loadMusic(lootSoundFile, fileType : "wav", loop : false);
    }
    
    private func loadAttackSound(){
        attackSoundAVA = self.loadMusic(attackSoundFile, fileType : "wav", loop : false);
    }
    
    private func loadBackgroundMusic(){
        backGroundSoundAVA = self.loadMusic(backgroundMusicFile, fileType : "mp3", loop : true);
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
        backGroundSoundAVA.play();
    }
}