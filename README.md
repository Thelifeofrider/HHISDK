# HHISDK

This HHISDK library allows you to integrate Firmware Update into your iOS app.

## TRY IT OUT

### Swift Package Manager

Step 1: Set Up Your Development Environment

1. In Xcode, click File > Swift Packages > Add Package Dependency.
2. In the dialog that appears, enter the repository URL: https://github.com/Thelifeofrider/HHISDK. 
3. In Branch, select Main.
4. Add the library.

Step 2: Configure Your Project

Initialize the sdk

HHISDK.firmViewGenerator(firmwareViewModel: HHISDK.HHIFirmwareViewModel(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))


