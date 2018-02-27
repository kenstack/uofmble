//
//  UofMViewController.swift
//  Bluefruit
//
//  Created by Kenneth Stack on 2/24/18.
//  Copyright © 2018 Adafruit. All rights reserved.
//

import UIKit


class UofMViewController: PeripheralModeViewController {

   // @IBOutlet weak var saveURL: UITextField!
    
//
//    }
//    @IBAction func urlClick(_ sender: Any) {
//      //  UserDefaults.standard.set(saveURL.text, forKey: "url")
//    }
//    @IBOutlet weak var refreshRate: UISlider!
//
//    @IBOutlet weak var refreshLabel: UILabel!
//
//    @IBAction func runAction(_ sender: Any) {
//        if runLabel.isOn {
//            print("switch on")
//            loopNS()
//            loopTimer = Timer.scheduledTimer(timeInterval: 30*1, target: self, selector: #selector(loopNS), userInfo: nil, repeats: true)
//        }
//        else
//        {
//            print("switch off")
//            //ada check to amke sure its not nil
//
//        }
//    }
//    @IBOutlet weak var runLabel: UISwitch!
//
//        weak var loopTimer: Timer!
//     var uartPeripheralService: UartPeripheralService?
//    internal var uartData: UartPacketManagerBase!
//    fileprivate var textCachedBuffer = NSMutableAttributedString()
//    fileprivate static var dataRxFont = UIFont(name: "CourierNewPSMT", size: 14)! //Font.systemFontOfSize(Font.systemFontSize())
//    fileprivate static var dataTxFont = UIFont(name: "CourierNewPS-BoldMT", size: 14)!
//   // internal var uartData: UartPacketManagerBase!
//    internal var colorForPeripheral = [UUID: UIColor]()
//    fileprivate let timestampDateFormatter = DateFormatter()
//    fileprivate var tableCachedDataBuffer: [UartPacket]?
//  //  fileprivate var textCachedBuffer = NSMutableAttributedString()
//    internal var multiUartSendToPeripheralId: UUID?       // nil = all peripherals
//
//    private let keyboardPositionNotifier = KeyboardPositionNotifier()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Title
//        let localizationManager = LocalizationManager.sharedInstance
//        let name = blePeripheral?.name ?? LocalizationManager.sharedInstance.localizedString("scanner_unnamed")
//        self.title = traitCollection.horizontalSizeClass == .regular ? String(format: localizationManager.localizedString("uofm_navigation_title_format"), arguments: [name]) : localizationManager.localizedString("uofm_tab_title")
//        uartData = UartPacketManager(delegate: self, isPacketCacheEnabled: true, isMqttEnabled: true)
//        setupUart()
//        send(message: "hello world")
//        print("after send")
//        // Do any additional setup after loading the view.
//
////            uartData = UartPeripheralModePacketManager(delegate: self, isPacketCacheEnabled: true, isMqttEnabled: true)
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    struct entriesNS : Codable {
//        let sgv : Int
//        let date : TimeInterval
//        let direction : String
//    }
//
//    func loopNS () {
//        print ("loop ")
//        send(message: "hello world")
//        let urlString = saveURL.text! + "/api/v1/entries.json"
//        guard let url = URL(string: urlString) else {
//            let alert = UIAlertController(title: "Invalid NS URL", message: "Confirm its of type https://urlsite.com", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alert, animated: true)
//            if loopTimer != nil  {loopTimer.invalidate()}
//            runLabel.setOn(false,animated:false)
//
//            return
//        }
//        let session = URLSession.shared
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
//        request.timeoutInterval = 45
//        session.dataTask(with: request as URLRequest) { (data, response, error) in
//            if error != nil {
//                let alert = UIAlertController(title: "Data Error", message: error as? String, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//                DispatchQueue.main.async {
//                    if self.loopTimer != nil  {self.loopTimer.invalidate()}
//                    self.runLabel.setOn(false,animated:false)
//                    self.present(alert, animated: true)}
//                return
//            }
//            guard let data = data else { return }
//
//            do {
//
//                let entries = try JSONDecoder().decode([entriesNS].self, from: data)
//                if entries.count > 0 {
//
//                    let date = NSDate(timeIntervalSince1970: entries[0].date/1000)
//                    let formatter = DateFormatter()
//                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//                    let timeZone = TimeZone.autoupdatingCurrent.identifier as String
//                    formatter.timeZone = TimeZone(identifier: timeZone)
//                    formatter.locale = NSLocale.current
//
//                    let strDate = formatter.string(from: date as Date)
//                    //                        print(String(entries[0].sgv))
//                    //                        print (strDate)
//                    //let payload : String = String(entries[0].sgv) + "," + entries[0].direction + "," + strDate
//                    //   print(payload)
//                    // self.writeValue(data: payload)
//                    let bpayload = "b" + String(entries[0].sgv)
//                    let dpayload = "d" + entries[0].direction
//                    let tpayload = "t" + strDate
//                    self.send(message: bpayload)
//                    self.send(message: dpayload)
//                    self.send(message: tpayload)
//                    DispatchQueue.main.async{
//                        print(entries[0].sgv)
////                        self.currentBG.text = String(entries[0].sgv)
////                        self.currentDirection.text = entries[0].direction
////                        self.currentDate.text = strDate}
//                    }
//                }
//
//                else
//
//                {
//                    let alert = UIAlertController(title: "Data Error", message: "No Data Received", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    if self.loopTimer != nil  {self.loopTimer.invalidate()}
//                    self.runLabel.setOn(false,animated:false)
//                    DispatchQueue.main.async { self.present(alert, animated: true)}
//                    return
//                }
//            } catch let jsonError {
//                let alert = UIAlertController(title: "JSON Data Error", message: "", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                if self.loopTimer != nil  {self.loopTimer.invalidate()}
//                self.runLabel.setOn(false,animated:false)
//                DispatchQueue.main.async { self.present(alert, animated: true)}
//                return
//            }
//            }.resume()
//    }
//   // internal func send(message: String) {
//        //assert(false, "Should be implemented by subclasses")
//
//    func setupUart() {
//        //updateUartReadyUI(isReady: false)
//
//        // Reset colors assigned to peripherals
//        let colors = UartStyle.defaultColors()
//        colorForPeripheral.removeAll()
//
//        // Enable uart
//       // if isInMultiUartMode() {
//        // Multiple peripheral mode
//
//
//    if let blePeripheral = blePeripheral {         //  Single peripheral mode
//            colorForPeripheral[blePeripheral.identifier] = colors.first
//            blePeripheral.uartEnable(uartRxHandler: uartData.rxPacketReceived) { [weak self] error in
//                guard let context = self else { return }
//
//                DispatchQueue.main.async { [unowned context] in
//                    guard error == nil else {
//                        DLog("Error initializing uart")
//                        context.dismiss(animated: true, completion: { [weak self] in
//                            if let context = self {
//                                showErrorAlert(from: context, title: "Error", message: "Uart protocol can not be initialized")
//
//                                if let blePeripheral = context.blePeripheral {
//                                    BleManager.sharedInstance.disconnect(from: blePeripheral)
//                                }
//                            }
//                        })
//                        return
//                    }
//
//                    // Done
//                    DLog("Uart enabled")
//                    //context.updateUartReadyUI(isReady: true)
//                }
//            }
//        }
//    }
//
//
//
//    func send(message: String) {
//        guard let uartData = self.uartData as? UartPacketManager else { DLog("Error send with invalid uartData class"); return }
//
//        if let blePeripheral = blePeripheral {      // Single peripheral mode
//            print("in ble")
//            uartData.send(blePeripheral: blePeripheral, text: message)
//        }
//
////        else {      // Multiple peripheral mode
////            let peripherals = BleManager.sharedInstance.connectedPeripherals()
////
////            if let multiUartSendToPeripheralId = multiUartSendToPeripheralId {
////                // Send to single peripheral
////                if let peripheral = peripherals.first(where: {$0.identifier == multiUartSendToPeripheralId}) {
////                    uartData.send(blePeripheral: peripheral, text: message)
////                }
////            } else {
////                // Send to all peripherals
////                for peripheral in peripherals {
////                    uartData.send(blePeripheral: peripheral, text: message)
////                }
////            }
////        }
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//    // MARK: - Style
//    internal func colorForPacket(packet: UartPacket) -> UIColor {
//        assert(false, "Should be implemented by subclasses")
//        return .black
//    }
//
//    fileprivate func fontForPacket(packet: UartPacket) -> UIFont {
//
//        let font = packet.mode == .tx ? UofMViewController.dataTxFont : UofMViewController.dataRxFont
//        return font
//    }
//
//}
//
//// MARK: - UartModuleDelegate
//extension UofMViewController: UartPacketManagerDelegate {
//
//    func onUartPacket(_ packet: UartPacket) {
//        // Check that the view has been initialized before updating UI
//        guard isViewLoaded && view.window != nil  else { return }
//
//        let displayMode: UartModeViewController.DisplayMode = Preferences.uartIsDisplayModeTimestamp ? .table : .text
//
//        switch displayMode {
//        case .text:
//            onUartPacketText(packet)
//            self.enh_throttledReloadData()      // it will call self.reloadData without overloading the main thread with calls
//
//        case .table:
//            self.enh_throttledReloadData()      // it will call self.reloadData without overloading the main thread with calls
//        }
//
//     //   updateBytesUI()
//    }
//
////    func reloadData() {
////        let displayMode: UartModeViewController.DisplayMode = Preferences.uartIsDisplayModeTimestamp ? .table : .text
////        switch displayMode {
////        case .text:
////            baseTextView.attributedText = textCachedBuffer
////
////            let textLength = textCachedBuffer.length
////            if textLength > 0 {
////                let range = NSMakeRange(textLength - 1, 1)
////                baseTextView.scrollRangeToVisible(range)
////            }
////
////        case .table:
////            baseTableView.reloadData()
////            if let tableCachedDataBuffer = tableCachedDataBuffer {
////                if tableCachedDataBuffer.count > 0 {
////                    let lastIndex = IndexPath(row: tableCachedDataBuffer.count-1, section: 0)
////                    baseTableView.scrollToRow(at: lastIndex, at: .bottom, animated: false)
////                }
////            }
////        }
////    }
//
//    fileprivate func onUartPacketText(_ packet: UartPacket) {
//        guard Preferences.uartIsEchoEnabled || packet.mode == .rx else { return }
//
//        let color = UIColor.black
//        let font = fontForPacket(packet: packet)
//
//        if let attributedString = attributedStringFromData(packet.data, useHexMode: Preferences.uartIsInHexMode, color: color, font: font) {
//            textCachedBuffer.append(attributedString)
//        }
//    }
//
////    func mqttUpdateStatusUI() {
////        guard let imageView = mqttBarButtonItemImageView, let tintColor = self.view.tintColor else { return }
////
////        let status = MqttManager.sharedInstance.status
////
////        switch status {
////        case .connecting:
////            let imageFrames = [
////                UIImage(named:"mqtt_connecting1")!.tintWithColor(tintColor),
////                UIImage(named:"mqtt_connecting2")!.tintWithColor(tintColor),
////                UIImage(named:"mqtt_connecting3")!.tintWithColor(tintColor)
////            ]
////            imageView.animationImages = imageFrames
////            imageView.animationDuration = 0.5 * Double(imageFrames.count)
////            imageView.animationRepeatCount = 0
////            imageView.startAnimating()
////
////        case .connected:
////            imageView.stopAnimating()
////            imageView.image = UIImage(named:"mqtt_connected")!.tintWithColor(tintColor)
////
////        default:
////            imageView.stopAnimating()
////            imageView.image = UIImage(named:"mqtt_disconnected")!.tintWithColor(tintColor)
////        }
////    }
//
//    func mqttError(message: String, isConnectionError: Bool) {
//        let localizationManager = LocalizationManager.sharedInstance
//
//        let alertMessage = isConnectionError ? localizationManager.localizedString("uart_mqtt_connectionerror_title") : message
//        let alertController = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: localizationManager.localizedString("dialog_ok"), style: .default, handler:nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true, completion: nil)
//    }
}

