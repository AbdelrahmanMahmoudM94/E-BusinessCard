import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:karty/features/profile/presentation/widgets/profile_personal_data_widget.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:karty/features/shared/widgets/forms/text_area_field_widget.dart';

class MyDetailsWidget extends StatelessWidget {
  MyDetailsWidget({super.key});

  EditProfileCubit _editProfileCubit = getIt<EditProfileCubit>();
  TextEditingController _hrRequestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>.value(
        value: _editProfileCubit,
        child: Column(
          children: <Widget>[
            ProfilePersonalDataWidget(
              name: "Fuad Taha",
              isStatic: true,
              companyName: "Diyar United Arab",
            ),
            40.heightBox,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextAreaFieldWidget(
                controller: _hrRequestController,
                maxLines: 8,
                keyName: "hrRequest",
                hintText: context.tr("yourRequestHere"),
                hintStyle: TextStyle(
                    color: AppTheme.inDarkMode(context,
                        dark: Palette.white, light: Palette.grey_8e95a4),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
                contentPadding:
                    EdgeInsets.only(left: 20.w, top: 40.h, right: 20.w),
              ),
            ),
            40.heightBox,
            BlocConsumer<EditProfileCubit, EditProfileState>(
                listener: (BuildContext context, EditProfileState state) {
              if (state is EditProfileLoadingState) {
                ViewsToolbox.showLoading();
              } else if (state is EditProfileSuccessState) {
                ViewsToolbox.dismissLoading();
              } else if (state is EditProfileErrorState) {
                ViewsToolbox.dismissLoading();
              }
            }, builder: (BuildContext context, EditProfileState state) {
              return CustomElevatedButton(
                onPressed: () {
                  _editProfileCubit.editProfile(
                      editProfileRequestModel: EditProfileRequestModel(
                          comments: _hrRequestController.text,
                          email: "F.Taha@diyarme.com"));
                },
                height: 64.h,
                width: 390.w,
                radius: 20.r,
                text: context.tr("submit"),
                textStyle: AppTextStyle.bold_18,
                borderColor: Colors.transparent,
                gradient: LinearGradient(
                    colors: <Color>[Palette.blue_0DBDFF, Palette.blue_05A3DF]),
              );
            }),
          ],
        ));
  }
}
