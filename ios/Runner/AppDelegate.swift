import UIKit
import Flutter
import PDFKit


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
            let pdfToDocxChannel = FlutterMethodChannel(name: "com.example.cv_project/pdf_to_docx", binaryMessenger: controller.binaryMessenger)

            pdfToDocxChannel.setMethodCallHandler({
                [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                if call.method == "convertPdfToDocx" {
                    guard let args = call.arguments as? [String: Any],
                          let pdfPath = args["pdfPath"] as? String else {
                        result(FlutterError(code: "INVALID_ARGUMENTS", message: nil, details: nil))
                        return
                    }
                    self?.convertPdfToDocx(pdfPath: pdfPath, result: result)
                } else {
                    result(FlutterMethodNotImplemented)
                }
            })


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   private func convertPdfToDocx(pdfPath: String, result: @escaping FlutterResult) {
          guard let url = URL(string: pdfPath),
                let pdf = PDFDocument(url: url) else {
              result(FlutterError(code: "INVALID_PATH", message: "Invalid PDF path", details: nil))
              return
          }

          let docxPath = "\(NSTemporaryDirectory())output.docx"
          pdf.write(to: URL(fileURLWithPath: docxPath))

          result(docxPath)
      }
}
