// import 'package:flutter/material.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:qr_generator_app_for_eazilink/screens/save_qr_as_image.dart';
// import 'package:screenshot/screenshot.dart';
// // import 'package:path_provider/path_provider.dart';

// class QRCodeGeneratorScreen extends StatefulWidget {
//   const QRCodeGeneratorScreen({super.key});

//   @override
//   State<QRCodeGeneratorScreen> createState() => _QRCodeGeneratorScreenState();
// }

// class _QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
//   final TextEditingController _textController = TextEditingController();
//   final ScreenshotController _screenshotController = ScreenshotController();
//   String? _qrData;

//   void _generateQRCode() {
//     setState(() {
//       _qrData = _textController.text;
//     });
//   }

//   // Future<void> _downloadQRCode() async {
//   //   if (_qrData != null && _qrData!.isNotEmpty) {
//   //     // final directory = await getDownloadsDirectory();
//   //      final directory = await dl.getDownloadDirectory();
//   //     final filePath = '${directory.path}/qr_code.png';

//   //     final imageFile = await _screenshotController
//   //         .captureAndSave(directory.path, fileName: 'qr_code.png');

//   //     if (imageFile != null) {
//   //       log(filePath);
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text('QR code saved to $filePath')),
//   //       );
//   //     } else {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text('Failed to save QR code')),
//   //       );
//   //     }
//   //   }
//   // }
//   Future<void> _downloadQRCode() async {
//     if (_qrData != null && _qrData!.isNotEmpty) {
      // QrImage? qrImage = QrImage(
      //   QrCode.fromData(
      //     data: _qrData ?? '',
      //     errorCorrectLevel: QrErrorCorrectLevel.H,
      //   ),
      // );
//       qrImage.exportAsImage(
//         context,
//         size: 1024,
//         decoration: const PrettyQrDecoration(
//           // background: Colors.black,
//           shape: PrettyQrSmoothSymbol(color: Colors.black //Color(0xFF74565F),
//               ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Code Generator for Eazilink'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _textController,
//                 onTapOutside: (event) {
//                   FocusManager.instance.primaryFocus?.unfocus();
//                 },
//                 decoration: const InputDecoration(
//                   labelText: 'Enter text',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _generateQRCode,
//                 child: const Text('Generate QR Code'),
//               ),
//               const SizedBox(height: 20),
//               if (_qrData != null)
//                 Screenshot(
//                   controller: _screenshotController,
//                   // child: QrImageView(
//                   //   data: _qrData ?? '',
//                   //   version: QrVersions.auto,
//                   //   size: 200.0,
//                   //   // eyeStyle: const QrEyeStyle(
//                   //   //   eyeShape: QrEyeShape.circle,
//                   //   // ),
//                   // ),
//                   // child: CustomPaint(
//                   //   size: const Size(200, 200),
//                   //   painter: QrPainter(
//                   //     data: _qrData!,
//                   //     version: QrVersions.auto,
//                   //     // gapless: false,
//                   //     // color: Colors.black,
//                   //     // emptyColor: Colors.white,
//                   //     eyeStyle: const QrEyeStyle(
//                   //       eyeShape: QrEyeShape.circle,
//                   //       // color: Colors.black,
//                   //     ),
//                   //     dataModuleStyle: const QrDataModuleStyle(
//                   //       dataModuleShape: QrDataModuleShape.circle,
//                   //       color: Colors.black,
//                   //     ),
//                   //   ),
//                   // ),
//                   child: PrettyQrView(
//                     qrImage: QrImage(
//                       QrCode.fromData(
//                         data: _qrData ?? '',
//                         errorCorrectLevel: QrErrorCorrectLevel.H,
//                       ),
//                     ),
//                     decoration: const PrettyQrDecoration(
//                       // background: Colors.black,
//                       shape: PrettyQrSmoothSymbol(
//                           color: Colors.black //Color(0xFF74565F),
//                           ),
//                     ),
//                   ),
//                 ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _downloadQRCode,
//                 child: const Text('Download QR Code'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:qr_generator_app_for_eazilink/screens/save_qr_as_image.dart';
// import 'package:screenshot/screenshot.dart';

// class QRCodeGeneratorScreen extends StatefulWidget {
//   const QRCodeGeneratorScreen({super.key});

//   @override
//   State<QRCodeGeneratorScreen> createState() => _QRCodeGeneratorScreenState();
// }

// class _QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
//   final TextEditingController _textController = TextEditingController();
//   final ScreenshotController _screenshotController = ScreenshotController();
//   String? _qrData;
//   bool _showCenterImage = false;
//   String _selectedColor = 'black';

//   void _generateQRCode() {
//     setState(() {
//       _qrData = _textController.text;
//     });
//   }

//   Color _getQRColor() {
//     switch (_selectedColor) {
//       case 'white':
//         return Colors.white;
//       case 'gradient':
//         return const Color(0xFF74565F); // You can modify this for gradient
//       default:
//         return Colors.black;
//     }
//   }

//   Future<void> _downloadQRCode() async {
//     if (_qrData != null && _qrData!.isNotEmpty) {
//       QrImage? qrImage = QrImage(
//         QrCode.fromData(
//           data: _qrData ?? '',
//           errorCorrectLevel: QrErrorCorrectLevel.H,
//         ),
//       );
//       qrImage.exportAsImage(
//         context,
//         size: 1024,
//         decoration: PrettyQrDecoration(
//           shape: PrettyQrSmoothSymbol(color: _getQRColor()),
//           image: _showCenterImage
//               ? const PrettyQrDecorationImage(
//                   image: AssetImage('assets/images/logo.png'), // Replace with your image path
//                   position: PrettyQrDecorationImagePosition.embedded,
//                   // size: Size.square(50),
//                 )
//               : null,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Code Generator for Eazilink'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: _textController,
//                 onTapOutside: (event) {
//                   FocusManager.instance.primaryFocus?.unfocus();
//                 },
//                 decoration: const InputDecoration(
//                   labelText: 'Enter text',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
              
//               // Image Toggle Switch
//               Row(
//                 children: [
//                   const Text('Show Center Image:'),
//                   Switch(
//                     value: _showCenterImage,
//                     onChanged: (value) {
//                       setState(() {
//                         _showCenterImage = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
              
//               // Color Selection
//               const Text('QR Code Color:'),
//               const SizedBox(height: 8),
//               SegmentedButton<String>(
//                 segments: const [
//                   ButtonSegment(
//                     value: 'black',
//                     label: Text('Black'),
//                   ),
//                   ButtonSegment(
//                     value: 'white',
//                     label: Text('White'),
//                   ),
//                   ButtonSegment(
//                     value: 'gradient',
//                     label: Text('Gradient'),
//                   ),
//                 ],
//                 selected: {_selectedColor},
//                 onSelectionChanged: (Set<String> selection) {
//                   setState(() {
//                     _selectedColor = selection.first;
//                   });
//                 },
//               ),
              
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _generateQRCode,
//                   child: const Text('Generate QR Code'),
//                 ),
//               ),
//               const SizedBox(height: 20),
              
//               if (_qrData != null)
//                 Center(
//                   child: Screenshot(
//                     controller: _screenshotController,
//                     child: PrettyQrView(
//                       qrImage: QrImage(
//                         QrCode.fromData(
//                           data: _qrData ?? '',
//                           errorCorrectLevel: QrErrorCorrectLevel.H,
//                         ),
//                       ),
//                       decoration: PrettyQrDecoration(
//                         shape: PrettyQrSmoothSymbol(color: _getQRColor()),
//                         image: _showCenterImage
//                             ? const PrettyQrDecorationImage(
//                                 image: AssetImage('assets/images/logo.png'), // Replace with your image path
//                                 position: PrettyQrDecorationImagePosition.embedded,
//                                 // size: Size.square(50),
//                               )
//                             : null,
//                       ),
//                     ),
//                   ),
//                 ),
              
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: _downloadQRCode,
//                   child: const Text('Download QR Code'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_generator_app_for_eazilink/screens/save_qr_as_image.dart';
import 'package:screenshot/screenshot.dart';

class QRCodeGeneratorScreen extends StatefulWidget {
  const QRCodeGeneratorScreen({super.key});

  @override
  State<QRCodeGeneratorScreen> createState() => _QRCodeGeneratorScreenState();
}

class _QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScreenshotController _screenshotController = ScreenshotController();
  String? _qrData;
  bool _showCenterImage = false;
  String _selectedLogoVariant = 'black';

  // Map to store logo paths
  final Map<String, String> logoAssets = {
    'black': 'assets/images/logo_black.png',
    'white': 'assets/images/logo_white.png',
    'gradient': 'assets/images/logo_gradient.png',
  };

  void _generateQRCode() {
    setState(() {
      _qrData = _textController.text;
    });
  }

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
        decoration: PrettyQrDecoration(
          shape: const PrettyQrSmoothSymbol(color: Colors.black),
          image: _showCenterImage
              ? PrettyQrDecorationImage(
                  image: AssetImage(logoAssets[_selectedLogoVariant]!),
                  position: PrettyQrDecorationImagePosition.embedded,
                  // size: const Size.square(50),
                )
              : null,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              
              // Image Toggle Switch
              Row(
                children: [
                  const Text('Show Center Logo:'),
                  Switch(
                    value: _showCenterImage,
                    onChanged: (value) {
                      setState(() {
                        _showCenterImage = value;
                      });
                    },
                  ),
                ],
              ),
              
              // Logo Variant Selection
              if (_showCenterImage) ...[
                const SizedBox(height: 12),
                const Text('Logo Style:'),
                const SizedBox(height: 8),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: 'black',
                      label: Text('Black Logo'),
                    ),
                    ButtonSegment(
                      value: 'white',
                      label: Text('White Logo'),
                    ),
                    ButtonSegment(
                      value: 'gradient',
                      label: Text('Gradient Logo'),
                    ),
                  ],
                  selected: {_selectedLogoVariant},
                  onSelectionChanged: (Set<String> selection) {
                    setState(() {
                      _selectedLogoVariant = selection.first;
                    });
                  },
                ),
              ],
              
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _generateQRCode,
                  child: const Text('Generate QR Code'),
                ),
              ),
              const SizedBox(height: 20),
              
              if (_qrData != null)
                Center(
                  child: Screenshot(
                    controller: _screenshotController,
                    child: PrettyQrView(
                      qrImage: QrImage(
                        QrCode.fromData(
                          data: _qrData ?? '',
                          errorCorrectLevel: QrErrorCorrectLevel.H,
                        ),
                      ),
                      decoration: PrettyQrDecoration(
                        shape: const PrettyQrSmoothSymbol(color: Colors.black),
                        image: _showCenterImage
                            ? PrettyQrDecorationImage(
                                image: AssetImage(logoAssets[_selectedLogoVariant]!),
                                position: PrettyQrDecorationImagePosition.embedded,
                                // size: const Size.square(50),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _downloadQRCode,
                  child: const Text('Download QR Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}