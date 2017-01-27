//
//  listitem.swift
//  Ishita Mediratta
//
//  Created by Ishita Mediratta on 26/04/16.
//  Copyright © 2016 Ishita Mediratta. All rights reserved.
//

import Foundation
import UIKit

struct listitem{
    enum listcategory {
        case allergy
        case asthmaAttack
        case bleeding
        case bruises
        case burn
        case choking
        case cpr
        case cuts
        case dogBites
        case eyeInjury
        case faintness
        case fracture
        case heatStroke
        case nosebleeds
        case poisoning
        case pulledMuscle
        case snakebite
    

    
        
        func toString() -> String{
            switch self {
                
            case .allergy:
                return "Allergy"
                
            case .asthmaAttack:
                return "Asthma Attack"
                
            case .bleeding:
                return "Bleeding"
                
            case .bruises:
                return "Bruises"
                
            case .burn:
                return "Burns"
                
            case .choking:
                return "Choking"
                
            case .cpr:
                return "CPR"
                
            case .cuts:
                return "Cuts"
                
            case .dogBites:
                return "Dog Bites"
                
            case .eyeInjury:
                return "Eye Injury"
                
            case .faintness:
                return "Faintness"
                
            case .fracture:
                    return "Fracture"
                
            case .heatStroke:
                return "Heat Stroke"
                
            case .nosebleeds:
                return "Nose Bleeding"
                
            case .poisoning:
                return "Poisoning"
                
            case .pulledMuscle:
                return "Pulled Muscle"
                
            case .snakebite:
                return "Snake Bite"
                
            
            }
        
        }
    }
    
    let category: listcategory
}