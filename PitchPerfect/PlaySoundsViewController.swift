//
//  PlayBackViewController.swift
//  PitchPerfect
//
//  Created by Damonique Thomas on 6/9/16.
//  Copyright © 2016 Damonique Thomas. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var darthButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    enum soundButton:Int{case reverb = 1, echo, rabbit, snail, darth, chipmunk}

    var recordedAudioURL: NSURL!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var audioFile: AVAudioFile!
    var stopTimer: NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        configureUI(.NotPlaying)
    }

    override func viewWillAppear(animated: Bool) {
        stopButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playBackButtonPressed(sender: AnyObject) {
        stopButton.enabled = true
        switch soundButton(rawValue:sender.tag)! {
        case .reverb:
            playSound(reverb:true)
        case .echo:
            playSound(echo:true)
        case .rabbit:
            playSound(rate:1.5)
        case .snail:
            playSound(rate:0.5)
        case .darth:
            playSound(pitch:-1000)
        case .chipmunk:
            playSound(pitch:1000)

        }
        configureUI(.Playing)
    }

    @IBAction func stopPlayBackButtonPressed(sender: AnyObject) {
        stopButton.enabled = false
        configureUI(.NotPlaying)
    }
}