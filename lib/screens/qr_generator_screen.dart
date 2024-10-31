import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_generator_app_for_eazilink/screens/save_qr_as_image.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:path_provider/path_provider.dart';

class QRCodeGeneratorScreen extends StatefulWidget {
  const QRCodeGeneratorScreen({super.key});

  @override
  State<QRCodeGeneratorScreen> createState() => _QRCodeGeneratorScreenState();
}

class _QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScreenshotController _screenshotController = ScreenshotController();
  String? _qrData;

  void _generateQRCode() {
    setState(() {
      _qrData = _textController.text;
    });
  }

  // Future<void> _downloadQRCode() async {
  //   if (_qrData != null && _qrData!.isNotEmpty) {
  //     // final directory = await getDownloadsDirectory();
  //      final directory = await dl.getDownloadDirectory();
  //     final filePath = '${directory.path}/qr_code.png';

  //     final imageFile = await _screenshotController
  //         .captureAndSave(directory.path, fileName: 'qr_code.png');

  //     if (imageFile != null) {
  //       log(filePath);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('QR code saved to $filePath')),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Failed to save QR code')),
  //       );
  //     }
  //   }
  // }
  Future<void> _downloadQRCode() async {
    if (_qrData != null && _qrData!.isNotEmpty) {
      QrImage? qrImage = QrImage(
        QrCode.fromData(
          data: _qrData ?? '',
          errorCorrectLevel: QrErrorCorrectLevel.H,
        ),
      );
      qrImage.exportAsImage(
        context,
        size: 1024,
        decoration: const PrettyQrDecoration(
          // background: Colors.black,
          shape: PrettyQrSmoothSymbol(color: Colors.black //Color(0xFF74565F),
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator for Eazilink'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: const InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateQRCode,
                child: const Text('Generate QR Code'),
              ),
              const SizedBox(height: 20),
              if (_qrData != null)
                Screenshot(
                  controller: _screenshotController,
                  // child: QrImageView(
                  //   data: _qrData ?? '',
                  //   version: QrVersions.auto,
                  //   size: 200.0,
                  //   // eyeStyle: const QrEyeStyle(
                  //   //   eyeShape: QrEyeShape.circle,
                  //   // ),
                  // ),
                  // child: CustomPaint(
                  //   size: const Size(200, 200),
                  //   painter: QrPainter(
                  //     data: _qrData!,
                  //     version: QrVersions.auto,
                  //     // gapless: false,
                  //     // color: Colors.black,
                  //     // emptyColor: Colors.white,
                  //     eyeStyle: const QrEyeStyle(
                  //       eyeShape: QrEyeShape.circle,
                  //       // color: Colors.black,
                  //     ),
                  //     dataModuleStyle: const QrDataModuleStyle(
                  //       dataModuleShape: QrDataModuleShape.circle,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  child: PrettyQrView(
                    qrImage: QrImage(
                      QrCode.fromData(
                        data: _qrData ?? '',
                        errorCorrectLevel: QrErrorCorrectLevel.H,
                      ),
                    ),
                    decoration: const PrettyQrDecoration(
                      // background: Colors.black,
                      shape: PrettyQrSmoothSymbol(
                          color: Colors.black //Color(0xFF74565F),
                          ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _downloadQRCode,
                child: const Text('Download QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
