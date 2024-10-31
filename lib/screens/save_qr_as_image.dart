import 'dart:io';
import 'dart:math';
import 'dart:developer' as debug_log;
import 'dart:typed_data';

import 'package:downloadsfolder/downloadsfolder.dart' as dl;
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

extension PrettyQrImageExtension on QrImage {
  Future<String?> exportAsImage(
    final BuildContext context, {
    required final int size,
    required final PrettyQrDecoration decoration,
  }) async {
    var random = Random();

    final configuration = createLocalImageConfiguration(context);
    final docDirectory = await dl.getDownloadDirectory();

    final bytes = await toImageAsBytes(
      size: size,
      decoration: decoration,
      configuration: configuration,
    );

    var filePath = '${docDirectory.path}/qr-code-${random.nextInt(1000)}.png';
    debug_log.log(filePath);
    if (bytes != null) {
        debug_log.log(filePath);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR code saved to $filePath')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save QR code')),
        );
      }
    final file = File(filePath);
    await file.writeAsBytes(bytes!.buffer.asUint8List(), flush: true);
    return docDirectory.path;
  }

  Future<Uint8List> shareImage(
    final BuildContext context, {
    required final int size,
    required final PrettyQrDecoration decoration,
  }) async {
    final configuration = createLocalImageConfiguration(context);

    final bytes = await toImageAsBytes(
      size: size,
      decoration: decoration,
      configuration: configuration,
    );

    return bytes!.buffer.asUint8List();
  }
}
