//
//  SwiftUIView.swift
//  
//
//  Created by Poonkathirvelan boopalan on 07/03/22.
//

import SwiftUI

struct InstructionList: View {
    var instruction : InstructionModel
    var body: some View {
        
        HStack() {
            Image(instruction.imageName, bundle: Bundle.module)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            Text(instruction.instructionText).font(Font.system(size: 12))
            Spacer()
            
        }
        
        
    }
}

struct InstructionList_Previews: PreviewProvider {
    static var previews: some View {
        InstructionList(instruction: InstructionModel(imageName: "instruction_icon", instructionText: "Check Battery"))
    }
}
