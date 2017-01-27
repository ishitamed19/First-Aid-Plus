//
//  StepsViewController.swift
//  Ishita Mediratta
//
//  Created by Ishita Mediratta on 30/04/16.
//  Copyright © 2016 Ishita Mediratta. All rights reserved.
//

import UIKit
import AVFoundation

class StepsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stepsLabel: UITextView!
    @IBOutlet weak var playButtonWidthContraint: NSLayoutConstraint!
    @IBOutlet weak var stopButtonWidthConstraint: NSLayoutConstraint!
    
    var passedLabel: Int!
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string:" ")
    
    
    @IBAction func speakSteps(_ sender: UIButton) {
        myUtterance = AVSpeechUtterance(string: stepsLabel.text!)
        myUtterance.rate = 0.4
        synth.speak(myUtterance)
    }
    
    
    @IBAction func stopSpeech(_ sender: AnyObject) {
        synth.stopSpeaking(at: AVSpeechBoundary.immediate)
        
    }
    

    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        // Sets the constraints of both the buttons
       
        self.playButtonWidthContraint.constant = self.view.frame.size.width * 75.0/100.0
        self.stopButtonWidthConstraint.constant = self.view.frame.size.width * 25.0/100.0
        
        // Required case is displayed
        
        if let numPassed = passedLabel{
        switch numPassed {
            
        case 1:
            titleLabel.text = "Allergy"
            stepsLabel.text = "Signs of severe allergy include swelling, paleness etc. Ask for emergency medicines that the patient is carrying and help in administering them. Call an emergency number immediately."
        
        case 2:
            titleLabel.text = "Asthma Attack"
            stepsLabel.text = "Make the patient sit/lay down in a comfortable postion. Search for a spacer, if the patient is carrying one, and let him/her inhale one puff followed by 6 breaths.  If the symptoms don't relieve even after repeating the above steps for a few times, then call for emergency immediately."
            
        case 3:
            titleLabel.text = "Bleeding"
            stepsLabel.text = "Place a sterile bandage or a cleaned cloth over the wound. Press the bandage firmly so as to control bleeding. If possible, raise the injured area.\n\n If the bleeding stops after some time and the patient is able to walk, then arrange for an apointment at a nearby clinic, otherwise, if the bleeding continues, then call emergency helpline immediately."
            
        case 4:
            titleLabel.text = "Bruises"
            stepsLabel.text = "Help the patient to rest in a comfortable position. In case of severe pain, wrap an ice pack within a cloth around the affected part. Ensure rest with elevation of the injured area for the first 24 to 48 hours.\n\n  Use a painkiller only after consulting from the doctor."
            
        case 5:
            titleLabel.text = "Burns"
            stepsLabel.text = " Remove the person from danger and further injury. Hold the burn under cold running water for 20 minutes. If necessary, prevent heat loss by covering unburnt areas.\n\n Burnt clothing should only be removed if it does not stick to the burn.\n\n Chemicals, such as acids and alkalis, must be washed off with running water for at least 20 minutes but take care not to splash the chemicals onto unaffected skin or other people.\n\n Superficial burns require pain relief, dressings, and regular review to make sure they have not become infected."
            
        case 6:
            titleLabel.text = "Choking"
            stepsLabel.text = "Wrap your arms around the waist of the patient and tip him forward slightly. Make a fist with one hand and grasp it with the other. Press hard into the abdomen with a quick, upward thrust — as if trying to lift the person up.\n Perform 5 abdominal thrusts.\n\n Call for emergency if the choking doesn't stop."
            
        case 7:
            titleLabel.text = "CPR"
            stepsLabel.text = "Place the heel of your hand on the breastbone at the centre of the person’s chest. Place your other hand on top of your first hand and interlock your fingers.\n Position yourself with your shoulders above your hands.Using your body weight (not just your arms), press straight down by 5-6cm on their chest. Keeping your hands on their chest, release the compression and allow the chest to return to its original position.\n Keep repeating the above until an ambulance arrives."
            
        case 8:
            titleLabel.text = "Cuts"
            stepsLabel.text = "Apply gentle pressure over the cut to stop bleeding. Clean the area around the cut using cleaned, damped cloth. Apply an ointment over the cut and cover it with proper bandage dressing. In case of deep wounds, consult a doctor and if necessary, get stitches from a nearby hospital."
            
        case 9:
            titleLabel.text = "Dog Bites"
            stepsLabel.text = "Clean the wound immediately by running it under warm water for a few minutes to ensure it is thoroughly cleaned. Encourage bleeding from the wound which will help prevent bacteria entering the wound.\n\n Consult a doctor immediately and get the required vaccinations."
            
            
        case 10:
            titleLabel.text = "Eye Injury"
            stepsLabel.text = "In case of chemical exposure, don't rub the eyes, and wash them immediately. Seek medical assistance urgently.\n In case of a particle, pull the upper lid down and blink repeatedly. If particle is still there, rinse with eyewash. If rinsing doesn't help, close eye, bandage it lightly, and see a doctor."
            
        case 11:
            titleLabel.text = "Faintness"
            stepsLabel.text = "When a person faints down, make them sit or lie down. If the patient is able to sit, position head between knees otherwise position him on his back.\n\n Make sure airways are clear and loosen tight clothing/belts/collars. \n\n Try to elevate feet above head level.\n\n Patient should become normal within a minute. If not, consult medical help.\n \n Also, check if breathing/pulse is normal. If not, perform CPR."
        case 12:
            titleLabel.text = "Fracture"
            stepsLabel.text = "Stop any bleeding. Apply pressure to the wound with a sterile bandage or a clean cloth.\n While waiting for medical care, give first aid treatment for shock if the victim has symptoms such as dizziness, weakness, pale and clammy skin, shortness of breath, and increased heart rate. Immobilize the injured area Make a splint by folding a piece of cardboard or newspaper or a magazine, then placing it gently under the limb."
            
        case 13:
            titleLabel.text = "Heat Stroke"
            stepsLabel.text = " If you suspect heatstroke, call your local emergency number. Then immediately move the person out of the heat and cool him or her by whatever means available.\n Begin CPR if the person loses consciousness and shows no signs of circulation, such as breathing, coughing or movement. "
            
        case 14:
            titleLabel.text = "Nose Bleeding"
            stepsLabel.text = "Sit upright and lean forward to reduce blood pressure in the nose veins. Pinch your nose and don't blow back or bend down for several hours to prevent re-bleeding. If bleeding lasts for more than 20 minutes, seek medical help."
            
        case 15:
            titleLabel.text = "Poisoning"
            stepsLabel.text = "Check the scene and the person. Try to find out what poison was taken. Look for any containers and take them with you to the phone. Call for an ambulance immediately.\n DO NOT give the person anything to eat or drink unless directed to do so by the doctor."
            
        case 16:
            titleLabel.text = "Pulled Muscle"
            stepsLabel.text = "Protect by applying an elastic bandage, sling, or splint. Rest the muscle for at least a day. Ice immediately, and continue to ice for 10 to 15 minutes every hour, for 2-3 days.\n Call for a doctor if pain persists or to consult for the dosage of any painkiller."
       
        case 17:
            titleLabel.text = "Snake Bite"
            stepsLabel.text = "Call your emergency helpline immediately. Move the person beyond striking distance of the snake. Have the person lie down with wound below the heart. Keep the person calm and at rest, remaining as still as possible to keep venom from spreading. Cover the wound with loose, sterile bandage. Remove any jewelry from the area that was bitten. Remove shoes if the leg or foot was bitten."
            
            
        default:
            titleLabel.text = "Error"
        }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
