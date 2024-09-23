import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_social_media_request_model.dart';
import 'package:karty/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/forms/text_field_widget.dart';

class SocialMediaWidget extends StatefulWidget {
  SocialMediaWidget({super.key});
  @override
  _SocialMediaWidgetState createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  EditProfileCubit _editProfileCubit = getIt<EditProfileCubit>();
  TextEditingController _linkedInController =
      TextEditingController(text: "https://www.linkedin.com/diyar");
  TextEditingController _facebookController =
      TextEditingController(text: "https://www.facebook.com/diyar");
  TextEditingController _instagramController =
      TextEditingController(text: "https://www.instgram.com/diyar");
  TextEditingController _twitterController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>.value(
        value: _editProfileCubit,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppText(
                text: context.tr(
                  "requestToHr",
                ),
                textColor: AppTheme.inDarkMode(context,
                    dark: Palette.white, light: Palette.darkBlue),
                style: AppTextStyle.medium_17,
              ),
            ),
            SocialMediaField(
              readOnly: false,
              icon: "linked-in.svg",
              keyName: "",
              iconWidth: 20.w,
              controller: _linkedInController,
            ),
            SocialMediaField(
              controller: _facebookController,
              icon: "facebook.svg",
              readOnly: true,
              keyName: "",
              iconWidth: 13.w,
            ),
            SocialMediaField(
              controller: _instagramController,
              icon: "instagram.svg",
              readOnly: true,
              keyName: "",
              iconWidth: 20.w,
              initalValue: "https://www.instgram.com/diyar",
            ),
            SocialMediaField(
              controller: _twitterController,
              icon: "twitter.svg",
              readOnly: true,
              keyName: "",
              iconWidth: 25.w,
            ),
            160.heightBox,
            BlocConsumer<EditProfileCubit, EditProfileState>(
                listener: (BuildContext context, EditProfileState state) {
              if (state is EditProfileLoadingState) {
                ViewsToolbox.showLoading();
              } else if (state is EditProfileSuccessState) {
                ViewsToolbox.dismissLoading();
                ViewsToolbox.showAwesomeSnackBar(
                    context, context.tr("request_sent_successfully"));
              } else if (state is EditProfileErrorState) {
                ViewsToolbox.dismissLoading();
                ViewsToolbox.showErrorAwesomeSnackBar(
                    context, context.tr(state.message.toString()));
              }
            }, builder: (BuildContext context, EditProfileState state) {
              return CustomElevatedButton(
                onPressed: () {
                  _editProfileCubit.editSocialMedia(
                      editSocialMediaRequest: EditSocialMediaRequestModel(
                    socialMediaName: "linkedIn",
                    socialMediaProfile: "",
                    url: _linkedInController.text,
                  ));
                },
                height: 64.h,
                width: 390.w,
                radius: 20.r,
                text: context.tr("save"),
                textStyle: AppTextStyle.bold_18,
                borderColor: Colors.transparent,
                gradient: LinearGradient(
                    colors: <Color>[Palette.blue_0DBDFF, Palette.blue_05A3DF]),
              );
            })
          ],
        ));
  }
}

class SocialMediaField extends StatelessWidget {
  const SocialMediaField(
      {super.key,
      required this.icon,
      required this.keyName,
      required this.iconWidth,
      this.initalValue,
      required this.readOnly,
      this.controller});
  final String icon;
  final double iconWidth;
  final String keyName;
  final String? initalValue;
  final bool readOnly;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFieldWidget(
        //   initalValue: initalValue ?? "https://www.instagram.com/diyar",
        controller: controller,
        keyName: "",
        readOnly: readOnly,
        prefixIcon: Container(
          width: 10.w,
          child: Center(
            child: SvgPicture.asset(
              "assets/svg/$icon",
              width: iconWidth,
            ),
          ),
        ),
      ),
    );
  }
}
