//
//  Creditos.swift
//  TxoroTxori
//
//  Created by Imanol Terán Maruri on 12/10/14.
//  Copyright (c) 2014 imanolteran. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation



class Creditos: SKScene {
   
    var tiempoTranscurrido:CFTimeInterval?
    var escena:SKSpriteNode?
    let fondo = "creditos"
    var reproductor:AVAudioPlayer?
    
    
    func startReproductor(){
        var rutaMusica = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Pintxo1", ofType: ".mp3")!)
        reproductor = AVAudioPlayer(contentsOfURL: rutaMusica, error: nil)
        reproductor?.prepareToPlay()
        
    }
   
    
}
