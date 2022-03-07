import XCTest
@testable import HHISDK

@available(iOS 14.0, *)
final class HHISDKTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        firmwareUpdate.firmwareProgress = .inProgress
        print(firmwareUpdate.firmwareProgress ?? .instruction)
        XCTAssertEqual(firmwareUpdate.firmwareProgress, .inProgress)
    }
    
    func test_FirmWareModel_firmWareProgress_inProgress()
    {
        //Given
        var firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        //When
        firmwareUpdate.firmwareProgress = .inProgress
        
        //Then
        XCTAssertEqual(firmwareUpdate.firmwareProgress, .inProgress)
    }
    func test_FirmWareModel_firmWareProgress_sucess()
    {
        //Given
        var firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        //When
        firmwareUpdate.firmwareProgress = .success
        
        //Then
        XCTAssertEqual(firmwareUpdate.firmwareProgress, .success)
    }
    func test_FirmWareModel_firmWareProgress_instruction()
    {
        //Given
        var firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        //when
        firmwareUpdate.firmwareProgress = .instruction
        
        //Then
        XCTAssertEqual(firmwareUpdate.firmwareProgress, .instruction)
    }
    func test_FirmWareModel_firmWareProgress_currentVersionSuccess()
    {
        //Given
        let firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        //when
        
        //Then
        XCTAssertEqual(firmwareUpdate.currentVersion, "1.0")
    }
    func test_FirmWareModel_firmWareProgress_currentVersionFailure()
    {
        //Given
        let firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        //when
        
        //Then
        XCTAssertNotEqual(firmwareUpdate.currentVersion, "2.0")
    }
    func test_FirmWareModel_firmWareProgress_updatingVersionSuccess()
    {
        //Given
        let firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        //when
        
        //Then
        XCTAssertEqual(firmwareUpdate.updatingVersion, "2.0")
    }
    func test_FirmWareModel_firmWareProgress_updatingVersionFailure()
    {
        //Given
        let firmwareUpdate = FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)
        
        //when
        
        //Then
        XCTAssertNotEqual(firmwareUpdate.updatingVersion, "3.0")
    }
    
    
    func test_FirmWareViewModel_instructionsArray_shouldNotBeEmpty()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When
        vm.firmwareViewModel.getInstructions()
        
        //Then
        XCTAssertTrue(!vm.firmwareViewModel.instructionArry.isEmpty)
    }
    
    func test_FirmWareViewModel_firmwareModelNotNil()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When

        
        //Then
        XCTAssertNotNil(vm.firmwareViewModel.firmWareModel)
    }
    func test_FirmWareViewModel_firmwareProgressNotNil()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When
        vm.firmwareViewModel.showSuccess()
        
        //Then
        XCTAssertTrue((vm.firmwareViewModel.firmWareModel.firmwareProgress != nil))
    }
    
    
    func test_FirmWareViewModel_loadFirmWare()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When
        vm.firmwareViewModel.loadFirmWare()
        
        //Then
        XCTAssertEqual(vm.firmwareViewModel.firmWareModel.firmwareProgress, .inProgress)
    }
    func test_FirmWareViewModel_resetFirmware()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When
        vm.firmwareViewModel.reset()
        
        //Then
        XCTAssertEqual(vm.firmwareViewModel.firmWareModel.firmwareProgress, .instruction)
    }
    
    func test_FirmWareViewModel_getInstructionDetails()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When
        vm.firmwareViewModel.firmWareModel.firmwareProgress = .instruction
        
        //Then
        XCTAssertEqual(vm.firmwareViewModel.firmWareModel.firmwareProgress, .instruction)
        XCTAssertEqual(vm.firmwareViewModel.headerText, "The lock has a new firmware that must be updated before use")
        XCTAssertEqual(vm.firmwareViewModel.imageName, "instruction")
        XCTAssertTrue(vm.firmwareViewModel.showInstruction)
        XCTAssertEqual(vm.firmwareViewModel.getButtonTittle, "Update")
    }
    
    func test_FirmWareViewModel_getInProgressDetails()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When
        vm.firmwareViewModel.firmWareModel.firmwareProgress = .inProgress
        
        
        //Then
        XCTAssertEqual(vm.firmwareViewModel.firmWareModel.firmwareProgress, .inProgress)
        XCTAssertEqual(vm.firmwareViewModel.headerText, "Firmware update is in progress")
        XCTAssertEqual(vm.firmwareViewModel.imageName, "inprogress")
        XCTAssertFalse(vm.firmwareViewModel.showInstruction)
        XCTAssertEqual(vm.firmwareViewModel.getButtonTittle, nil)
        
        
    }
    func test_FirmWareViewModel_getSuccessDetails()
    {
        //Given
        let vm = HHISDK(firmwareViewModel: HHISDK.HHIFirmwareViewModel.init(firmeWareModel: FirmWareModel(currentVersion: "1.0", updatingVersion: "2.0", firmwareProgress: .instruction)))
        
        //When
        vm.firmwareViewModel.firmWareModel.firmwareProgress = .success
        
        //Then
        XCTAssertEqual(vm.firmwareViewModel.firmWareModel.firmwareProgress, .success)
        XCTAssertEqual(vm.firmwareViewModel.headerText, "The firmware update for this lock is now completed. Thank You!")
        XCTAssertEqual(vm.firmwareViewModel.imageName, "success")
        XCTAssertFalse(vm.firmwareViewModel.showInstruction)
        XCTAssertEqual(vm.firmwareViewModel.getButtonTittle, "Continue")
    }
    
    
}
