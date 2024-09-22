// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/profile/presentation/widgets/profile_info_card_widget.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/splash/presentation/screens/splash_screen.dart';

class ProfileCardsListWidget extends StatelessWidget {
  ProfileCardsListWidget({
    Key? key,
    required this.profiles,
    required this.carouselSliderController,
  }) : super(key: key);
  final List<ContactProfileEntity> profiles;
  final CarouselSliderController carouselSliderController;
  List<String> items = <String>["1", "2", "3"];
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
          height: 180.h,
          child: CarouselSlider(
            items: profiles
                .map((ContactProfileEntity profile) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9.w),
                      child: ProfileInfoCardWidget(
                        contactProfileEntity: profile,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 400,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
            ),
            controller: carouselSliderController,
          )),
      20.heightBox,
      profiles.length > 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      carouselSliderController.previousPage();
                    },
                    child: Icon(Icons.arrow_back)),
                20.widthBox,
                InkWell(
                    onTap: () {
                      carouselSliderController.nextPage();
                    },
                    child: Icon(Icons.arrow_forward)),
              ],
            )
          : Container(),
    ]);
  }
}
