//
//  File.swift
//  
//
//  Created by Poonkathirvelan boopalan on 07/03/22.
//

import Foundation
import SwiftUI

public struct FirmWareModel {
    
    let currentVersion : String!
    let updatingVersion : String!
    var firmwareProgress: FirmeWareProgress!
    
    public init(currentVersion : String, updatingVersion : String, firmwareProgress : FirmeWareProgress) {
        self.currentVersion = currentVersion
        self.updatingVersion = updatingVersion
        self.firmwareProgress = firmwareProgress
    }
}

public struct InstructionModel : Identifiable {
    public var id: String = UUID().uuidString
    let imageName : String
    let instructionText : String
}

public enum FirmeWareProgress:Equatable {
    public static func == (lhs: FirmeWareProgress, rhs: FirmeWareProgress) -> Bool {
        switch lhs.imageName {
        case rhs.imageName:
            return true
        default:
            return false
        }
    }
    
    case instruction
    case inProgress
    case success
    case failure(Error)
    
    var imageName : String {
        switch self {
        case .instruction:
            return "instruction"
        case .inProgress:
            return "inprogress"
        case .success:
            return "success"
        case .failure:
            return ""
        }
    }
    
    var headerText : String {
        switch self {
        case .instruction:
        return "The lock has a new firmware that must be updated before use"
        case .inProgress:
            return "Firmware update is in progress"
        case .success:
            return "The firmware update for this lock is now completed. Thank You!"
        case .failure:
            return ""
        }
    }
    
    var detailText : Text? {
        switch self {
        case .instruction:
            return nil
        case .inProgress:
            let combinedText = Text("Please do not turn off your device or close the App. This process may takes upto") + Text("3-6 minutes.").fontWeight(.bold) + Text(".")
            return combinedText
        case .success:
            return nil
        case .failure:
            return nil
        }
    }
    
    var showInstructions : Bool {
        switch self {
        case .instruction:
            return true
        case .inProgress:
            return false
        case .success:
            return false
        case .failure:
            return false
        }
    }
    
    var showButtonTitle : String? {
        switch self {
        case .instruction:
            return "Update"
        case .inProgress:
            return nil
        case .success:
            return "Continue"
        case .failure:
            return "Continue"
        }
    }
}
