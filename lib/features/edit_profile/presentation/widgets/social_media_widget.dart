import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_social_media_request_model.dart';
import 'package:karty/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:karty/features/edit_profile/presentation/cubit/get_profile_cubit.dart';
import 'package:karty/features/edit_profile/presentation/cubit/get_profile_state.dart';
import 'package:karty/features/home_profile/data/models/request/home_profile_request_model.dart';
import 'package:karty/features/home_profile/presentation/cubit/home_profile_cubit.dart';
import 'package:karty/features/share_cards/domain/entities/social_media_entity.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/forms/text_field_widget.dart';

class SocialMediaWidget extends StatefulWidget {
  SocialMediaWidget({super.key});
  @override
  _SocialMediaWidgetState createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  GetProfileCubit _getProfileCubit = getIt<GetProfileCubit>();

  EditProfileCubit _editProfileCubit = getIt<EditProfileCubit>();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  HomeProfileCubit _homeProfileCubit = getIt<HomeProfileCubit>();

  @override
  void initState() {
    super.initState();
    _getProfileCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProfileCubit>.value(
        value: _getProfileCubit,
        child: BlocConsumer<GetProfileCubit, GetProfileState>(
            listener: (BuildContext context, GetProfileState state) {
          if (state is GetProfileLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is GetProfileReadyState) {
            ViewsToolbox.dismissLoading();
          } else if (state is GetProfileErrorState) {
            ViewsToolbox.dismissLoading();
          }
        }, builder: (BuildContext context, GetProfileState state) {
          if (state is GetProfileReadyState) {
            return Column(
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
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: state.homeProfileEntity.socialMedia!.map(
                      (SocialMediaEntity socialMediaEntity) {
                        return SocialMediaField(
                          initalValue: socialMediaEntity.url ?? "",
                          base64Icon: socialMediaEntity.icon ?? "",
                          readOnly:
                              socialMediaEntity.socialMediaName == "Linkedin"
                                  ? false
                                  : true,
                          keyName: socialMediaEntity.socialMediaName ?? "",
                          iconWidth: 20.w,
                        );
                      },
                    ).toList(),
                  ),
                ),
                80.heightBox,
                BlocProvider<EditProfileCubit>.value(
                    value: _editProfileCubit,
                    child: BlocConsumer<EditProfileCubit, EditProfileState>(
                        listener:
                            (BuildContext context, EditProfileState state) {
                      if (state is EditProfileLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is EditProfileSocialMediaReadyState) {
                        _homeProfileCubit.getProfile(
                            homeProfileRequestModel: HomeProfileRequestModel(
                                email: "F.Taha@diyarme.com",
                                lang:
                                    LanguageHelper.isAr(context) ? "a" : "e"));

                        _getProfileCubit.getProfile();

                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showAwesomeSnackBar(
                            context, context.tr("requestSentSuccessfully"));
                      } else if (state is EditProfileErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, context.tr(state.message.toString()));
                      }
                    }, builder: (BuildContext context, EditProfileState state) {
                      return CustomElevatedButton(
                        onPressed: () {
                          _editProfileCubit.editSocialMedia(
                              editSocialMediaRequest:
                                  EditSocialMediaRequestModel(
                                      socialMediaName: "linkedIn",
                                      socialMediaProfile: "",
                                      url: _formKey.currentState!
                                          .fields["Linkedin"]!.value
                                          .toString()));
                        },
                        height: 64.h,
                        width: 390.w,
                        radius: 20.r,
                        text: context.tr("save"),
                        textStyle: AppTextStyle.bold_18,
                        borderColor: Colors.transparent,
                        gradient: LinearGradient(colors: <Color>[
                          Palette.blue_0DBDFF,
                          Palette.blue_05A3DF
                        ]),
                      );
                    })),
              ],
            );
          } else {
            return Container();

            // return FormBuilder(
            //     key: _formKey,
            //     child: Column(
            //       children: <Widget>[
            //         SocialMediaField(
            //           readOnly: false,
            //           icon: "linked-in.svg",
            //           keyName: "LinkedIn",
            //           iconWidth: 20.w,
            //           initalValue: "https://www.linkedin.com/diyar",
            //         ),
            //         SocialMediaField(
            //           initalValue: "https://www.facebook.com/diyar",
            //           icon: "facebook.svg",
            //           readOnly: true,
            //           keyName: "",
            //           iconWidth: 13.w,
            //         ),
            //         SocialMediaField(
            //           icon: "instagram.svg",
            //           readOnly: true,
            //           keyName: "",
            //           iconWidth: 20.w,
            //           initalValue: "https://www.instgram.com/diyar",
            //         ),
            //         SocialMediaField(
            //           initalValue: "",
            //           icon: "twitter.svg",
            //           readOnly: true,
            //           keyName: "",
            //           iconWidth: 25.w,
            //         ),
            //       ],
            //     ));
          }
        }));
  }
}

class SocialMediaField extends StatelessWidget {
  const SocialMediaField(
      {super.key,
      this.icon = "",
      required this.keyName,
      required this.iconWidth,
      this.initalValue,
      required this.readOnly,
      this.base64Icon = "",
      this.controller});
  final String icon;
  final double iconWidth;
  final String keyName;
  final String? initalValue;
  final bool readOnly;
  final TextEditingController? controller;
  final String base64Icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFieldWidget(
        initalValue: initalValue,
        controller: controller,
        keyName: keyName,
        readOnly: readOnly,
        prefixIcon: Container(
            width: 10.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: base64Icon.isNotEmpty
                    ? ViewsToolbox.imageFromBase64String(
                        base64Icon.replaceAll("data:image/png;base64,", ""))
                    : SvgPicture.asset(
                        "assets/svg/$icon",
                        width: iconWidth,
                      ),
              ),
            )),
      ),
    );
  }
}
