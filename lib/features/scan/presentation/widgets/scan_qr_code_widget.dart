import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/routes/routes.gr.dart';
import 'package:karty/features/scan/domain/entities/qr_scaned_data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeWidget extends StatefulWidget {
  const ScanQrCodeWidget({super.key});

  @override
  State<ScanQrCodeWidget> createState() => _ScanQrCodeWidgetState();
}

class _ScanQrCodeWidgetState extends State<ScanQrCodeWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isDetected = false;

  @override
  void initState() {
    _checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.h,
      child: QRView(
        key: qrKey,
        onPermissionSet: (QRViewController p0, bool isGranted) {
          if (!isGranted) {
            _checkPermission();
          }
        },
        overlay: QrScannerOverlayShape(
            overlayColor: Palette.black_111111, borderColor: Palette.white),
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;

    controller.scannedDataStream.listen((Barcode scanData) {
      if (scanData.code!.isNotEmpty && !isDetected) {
        isDetected = true;
        QrScannedDataEntity entity = parseVCard(scanData.code!);
        //  controller.pauseCamera();
        controller.pauseCamera();
        CustomMainRouter.push(
          ScanResultRoute(qrScannedDataEntity: entity, controller: controller),
          then: (Object? p0) {
            controller.resumeCamera();
            isDetected = false;
          },
        );
      }
    });
  }

  QrScannedDataEntity parseVCard(String vCardData) {
    // Split vCard data by newline
    List<String> vCardFields = vCardData.split('\n');
    Map<String, String> vCardInfo = <String, String>{};

    // Iterate through each line of the vCard data
    for (String field in vCardFields) {
      int colonIndex = field.indexOf(':');

      if (colonIndex != -1) {
        // Extract the field name and field value
        String fieldName = field.substring(0, colonIndex).trim();
        String fieldValue = field.substring(colonIndex + 1).trim();

        // Add to the map
        vCardInfo[fieldName] = fieldValue;
      }
    }

    QrScannedDataEntity entity = QrScannedDataEntity(
        title: vCardInfo['Title'] as String,
        fn: vCardInfo['FN'] as String,
        org: vCardInfo['Org'] as String,
        address: vCardInfo['ADR'] as String,
        tel: vCardInfo['TEL'] as String,
        email: vCardInfo['Email'] as String);
    return entity;
  }

  @override
  void dispose() {
    //controller?.dispose();
    super.dispose();
  }

  Future<void> _checkPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}
