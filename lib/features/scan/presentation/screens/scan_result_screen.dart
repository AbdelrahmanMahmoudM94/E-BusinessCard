import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karty/features/common/extensions/padding_extension.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/home_profile/presentation/widgets/profile_info_card_widget.dart';
import 'package:karty/features/home_profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/routes/route_sevices.dart';
import 'package:karty/features/scan/domain/entities/qr_scaned_data.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/forms/text_area_field_widget.dart';
import 'package:karty/features/shared/widgets/forms/text_field_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class ScanResultScreen extends StatefulWidget {
  const ScanResultScreen(
      {super.key, this.qrScannedDataEntity, required this.controller});
  final QrScannedDataEntity? qrScannedDataEntity;
  final QRViewController controller;

  @override
  State<ScanResultScreen> createState() => _ScanResultScreenState();
}

class _ScanResultScreenState extends State<ScanResultScreen> {
  TextEditingController _locationTextController = TextEditingController();
  TextEditingController _notesTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackgroundPattern(
      path: "assets/svg/profile-background.svg",
      patternExtension: PatternExtension.svg,
      widget: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            50.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => CustomMainRouter.pop(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(0.0),
                        width: 20.w,
                        child: Icon(
                          color: Palette.white,
                          LanguageHelper.isAr(context)
                              ? FontAwesomeIcons.arrowRight
                              : FontAwesomeIcons.arrowLeft,
                          size: 30.w,
                        ),
                      ),
                    ),
                  ),
                  4.widthBox,
                  LanguageHelper.isAr(context)
                      ? Image.asset(
                          "assets/png/company_arabic_logo.png",
                          width: 100.w,
                        )
                      : SvgPicture.asset(
                          ViewsToolbox.getDiyarLogo(context,
                              forcedLightTheme: true),
                          width: 110.w,
                        )
                ],
              ),
            ),
            Center(
                child: ProfilePersonalDataWidget(
              name: widget.qrScannedDataEntity!.fn!,
              photo: null,
              companyName: widget.qrScannedDataEntity!.org,
              socialMedias: null,
            )),
            10.heightBox,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: ProfileInfoCardWidget(
                  contactProfileEntity: ContactProfileEntity(
                      email: widget.qrScannedDataEntity?.email,
                      position: widget.qrScannedDataEntity?.title,
                      phoneNumber: widget.qrScannedDataEntity?.tel,
                      location: widget.qrScannedDataEntity?.address),
                  hideBorder: true,
                )),
            30.heightBox,
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextAreaFieldWidget(
                    labelAboveField: context.tr("notes"),
                    maxLines: 4,
                    controller: _notesTextController,
                    keyName: "contactNotes",
                  ),
                ),
              ],
            ),
            6.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFieldWidget(
                readOnly: false,
                keyName: "location",
                controller: _locationTextController,
                prefixIcon: Container(
                    width: 25.w,
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/svg/map-icon.svg",
                      fit: BoxFit.cover,
                      width: 20.w,
                    ))),
              ),
            ),
            20.heightBox,
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  bool isGranted = await _checkPermission();
                  if (isGranted) {
                    final Contact newContact = Contact()
                      ..name.first =
                          widget.qrScannedDataEntity!.fn!.split(" ").first
                      ..name.last = widget.qrScannedDataEntity!.fn!
                          .split(" ")
                          .sublist(1)
                          .join(" ")
                      ..addresses = <Address>[
                        Address(widget.qrScannedDataEntity!.address),
                        Address(_locationTextController.text)
                      ]
                      ..organizations = <Organization>[
                        Organization(
                            company: widget.qrScannedDataEntity!.org,
                            title: widget.qrScannedDataEntity!.title)
                      ]
                      ..notes = <Note>[Note("_notesTextController.text")]
                      ..emails = <Email>[
                        Email(widget.qrScannedDataEntity!.email)
                      ]
                      ..phones = <Phone>[
                        Phone(widget.qrScannedDataEntity!.tel)
                      ];
                    FlutterContacts.config.includeNotesOnIos13AndAbove = true;
                    await FlutterContacts.openExternalInsert(newContact)
                        .then((Contact? vg) {
                      log(vg.toString());
                    });
                  }
                },
                height: 68.h,
                width: 350.w,
                customChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset("assets/svg/save-icon.svg"),
                    10.widthBox,
                    AppText(
                      text: context.tr("save"),
                      textColor: Palette.white,
                      style: AppTextStyle.bold_18,
                    )
                  ],
                ),
                radius: 20.r,
                borderColor: Colors.transparent,
                gradient: LinearGradient(
                    colors: <Color>[Palette.blue_0DBDFF, Palette.blue_05A3DF]),
              ),
            ),
          ],
        ),
      ).paddingOnly(bottom: MediaQuery.of(context).viewInsets.bottom),
    );
  }

  Future<bool> _checkPermission() async {
    PermissionStatus status = await Permission.contacts.status;
    if (status.isDenied) {
      await Permission.contacts.request();
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
    return status.isGranted;
  }
}
