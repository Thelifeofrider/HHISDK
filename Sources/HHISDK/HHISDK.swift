public struct HHISDK {
    public private(set) var text = "Hello, World!"
    public func updateFirmware() -> String{
        print("Firmware Updated")
        
        return "Firware update initated"
    }
    public init() {
    }
}
