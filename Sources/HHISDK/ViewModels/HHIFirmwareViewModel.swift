//
//  File.swift
//  
//
//  Created by Poonkathirvelan boopalan on 07/03/22.
//

import Foundation
import SwiftUI

@available(iOS 14.0, *)
extension HHISDK {
    public class HHIFirmwareViewModel : ObservableObject {
        @Published var instructionArry : [InstructionModel] = [InstructionModel]()
        @Published var firmWareModel : FirmWareModel
        
        public init(firmeWareModel : FirmWareModel) {
            self.firmWareModel = firmeWareModel
            getInstructions()
        }
        
        var imageName : String {
            firmWareModel.firmwareProgress.imageName
        }
        
        var headerText : String {
            firmWareModel.firmwareProgress.headerText
        }
        
        var detailText : Text? {
            firmWareModel.firmwareProgress.detailText
        }
        
        var showInstruction : Bool {
            firmWareModel.firmwareProgress.showInstructions
        }
        
        var getButtonTittle : String? {
            firmWareModel.firmwareProgress.showButtonTitle
        }
        
        
        func getInstructions() {
            switch firmWareModel.firmwareProgress {
            case .instruction:
                instructionArry.removeAll()
                instructionArry.append(InstructionModel(imageName: "instruction_icon", instructionText: "Smartphone batteries needs to be atleast 20%"))
                instructionArry.append(InstructionModel(imageName: "instruction_icon", instructionText: "Lock batteries needs to be atleast 20%"))
                instructionArry.append(InstructionModel(imageName: "instruction_icon", instructionText: "Keep smarthphone within 30 feet of lock"))
                instructionArry.append(InstructionModel(imageName: "instruction_icon", instructionText: "Do not turnoff your smartphone"))
                instructionArry.append(InstructionModel(imageName: "instruction_icon", instructionText: "Do not close this App"))
            default:
                instructionArry.removeAll()
                                       
            }
        }
        
        func nextStep() {
            switch firmWareModel.firmwareProgress {
            case .instruction:
                loadFirmWare()
            default:
                break
            }
        }
        
        func shouldDismissView() -> Bool {
            switch firmWareModel.firmwareProgress {
            case .success, .failure :
                return true
            default:
                return false
            }
        }
        
        func reset() {
            firmWareModel.firmwareProgress = .instruction
        }
        
        func loadFirmWare() {
            self.firmWareModel.firmwareProgress = .inProgress
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.showSuccess()
            }
        }
        
        func showSuccess() {
            if self.firmWareModel.firmwareProgress == .inProgress {
                self.firmWareModel.firmwareProgress = .success
            }
        }
        
        func showFailure() {
            
        }
    }
}
