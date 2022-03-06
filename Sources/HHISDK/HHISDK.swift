import SwiftUI

public struct HHISDK: View {
    
    public var body: some View {
        VStack{
        Text("TEST")
        }.background(Color.red)
    }
    public private(set) var text = "Hello, World!"
    public func updateFirmware() -> String{
        print("Firmware Updated")
        
        return "Firware update initated"
    }
    public init() {
    }
}


@available(iOS 13.0, *)
struct HHISDK_Previews: PreviewProvider {
    static var previews: some View {
        HHISDK()
    }
}
