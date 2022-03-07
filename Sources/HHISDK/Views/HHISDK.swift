import SwiftUI
@available(iOS 14.0, *)
public struct HHISDK: View {
    
    @ObservedObject var firmwareViewModel : HHIFirmwareViewModel
    @State var navigationBackhide = false
    @Environment(\.presentationMode) var presentationMode
    public static func firmViewGenerator(firmwareViewModel: HHIFirmwareViewModel) -> HHISDK {
        return HHISDK(firmwareViewModel: firmwareViewModel)
    }
    public var body: some View {
        HStack {
            VStack(alignment : .center) {
                Image(firmwareViewModel.imageName, bundle: Bundle.module)
                    .resizable()
                    .scaledToFit()
                    .background(Color.white)
                    .frame(maxHeight: 250)
                    
                Text(firmwareViewModel.headerText)
                    .font(Font.system(size: 16, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(SwiftUI.EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                if let text = firmwareViewModel.detailText {
                    Spacer()
                    text
                        .font(Font.system(size: 14))
                        .multilineTextAlignment(.center)
                        .padding(SwiftUI.EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        
                    
                    
                }
                if firmwareViewModel.showInstruction {
                    Spacer()
                    ScrollView {
                        VStack(alignment:.leading, spacing: 10) {
                            ForEach(firmwareViewModel.instructionArry) { instruction in
                                InstructionList(instruction: instruction)
                            }
                        }
                        .background(Color.white)
                    }.padding()
                    
                } else {
                    Spacer().frame(maxHeight: .infinity)
                }
                
                if let buttonTitle = firmwareViewModel.getButtonTittle {
                    Button(action : {
                        navigationBackhide = true
                        firmwareViewModel.nextStep()
                        if firmwareViewModel.shouldDismissView() {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text(buttonTitle)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40, alignment: .center)
                        
                        
                    }
                    .background(Color.red)
                    .cornerRadius(10)
                    
                    .foregroundColor(.white)
                    
                    .frame(height: 40, alignment: .center)
                    .frame(maxWidth: .infinity)
                }
            
                
                
                Spacer()
                
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
            
            Spacer()
        }.onDisappear {
            navigationBackhide = false
            self.firmwareViewModel.reset()
        }
        .navigationBarBackButtonHidden(navigationBackhide)
        
    }
}



@available(iOS 14.0, *)
struct HHISDK_Previews: PreviewProvider {
    static var previews: some View {
        HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
    }
}
