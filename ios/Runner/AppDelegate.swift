import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        
        let encryptData = FlutterMethodChannel(
            name: "com.diyar.eBusinessCard.dev/encrypt",
            binaryMessenger: controller.binaryMessenger)
        encryptData.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method{
            case "encryptData":
                guard let arguments = call.arguments as? [String: Any],
                      let data = arguments["data"] as? String,
                      let publicKeyBase64 = arguments["publicKeyBase64"] as? String else {
                    result(FlutterError(code: "INVALID_ARGUMENTS", message: "Arguments were null", details: nil))
                    return
                }
                
                do {
                    
                    
                    result (  self.encryptData(string: data, publicKey: publicKeyBase64) )
                    
                    
                } catch {
                    // Handle errors that may occur while reading the file
                    print("Error reading file: \(error.localizedDescription)")
                }
                
                
            default:
                result(FlutterMethodNotImplemented)
            }
        })
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
     private func encryptData(string: String, publicKey: String?) -> String? {
        guard let publicKey = publicKey else { return nil }
        let utcDate = Date()
        
        let formatter = DateFormatter()
         formatter.locale=Locale(identifier: "en")
        formatter.dateFormat = "yyyyMMddHHmmss"
        let utcDateTimeStr = formatter.string(from: utcDate)
        
        let stringToEncrypt = "\(string)#\(utcDateTimeStr)"
        let keyString = publicKey.replacingOccurrences(of: "-----BEGIN PUBLIC KEY-----\n", with: "").replacingOccurrences(of: "\n-----END PUBLIC KEY-----", with: "")
        guard let data = Data(base64Encoded: keyString) else { return nil }
        
        let attributes: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeyClass as String: kSecAttrKeyClassPublic,
            kSecAttrKeySizeInBits as String: 2048
        ]
        
        var error: Unmanaged<CFError>?
        guard let secKey = SecKeyCreateWithData(data as CFData, attributes as CFDictionary, &error) else {
            print(error.debugDescription)
            return nil
        }
        
        return encrypt(string: stringToEncrypt, publicKey: secKey)
    }
    
    func encrypt(string: String, publicKey: SecKey) -> String? {
        let dataToEncrypt = Data(string.utf8)
        
        var error: Unmanaged<CFError>?
        guard let encryptedData = SecKeyCreateEncryptedData(publicKey, SecKeyAlgorithm.rsaEncryptionPKCS1, dataToEncrypt as CFData, &error) else {
            print("Encryption error: \(error.debugDescription)")
            return nil
        }
        
       
        
        return (encryptedData as Data).base64EncodedString()
    }
}
