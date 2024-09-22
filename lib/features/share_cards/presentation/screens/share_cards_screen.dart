import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:karty/features/common/extensions/size_extensions.dart';
import 'package:karty/features/common/helper/language_helper.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';

import 'package:karty/features/common/utility/palette.dart';
import 'package:karty/features/common/utility/theme.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/share_cards/data/models/request/share_card_request_model.dart';
import 'package:karty/features/share_cards/presentation/cubit/cubit/share_card_cubit.dart';
import 'package:karty/features/share_cards/presentation/widgets/contact_card_widget.dart';
import 'package:karty/features/shared/widgets/app_text.dart';
import 'package:karty/features/shared/widgets/background_pattern.dart';
import 'package:karty/features/shared/widgets/forms/custom_search_field_widget.dart';
import 'package:karty/features/shared/widgets/no_data_widget.dart';
import 'package:karty/features/splash/presentation/screens/splash_screen.dart';

@RoutePage()
class ShareCardsScreen extends StatefulWidget {
  const ShareCardsScreen({super.key});

  @override
  State<ShareCardsScreen> createState() => _ShareCardsScreenState();
}

class _ShareCardsScreenState extends State<ShareCardsScreen> {
  TextEditingController searchController = TextEditingController();

  ShareCardCubit _shareCardCubit = getIt<ShareCardCubit>();
  ScrollController _scrollController = ScrollController();
  bool hasMorePages = false;
  bool isSearched = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      _getShareCardList(isSearched: false);
    });
    // Listen for scroll events
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // If user has scr
        //olled to the end, load more data
        if (hasMorePages) {
          _shareCardCubit.loadMoreShareCardsList();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShareCardCubit>.value(
      value: _shareCardCubit,
      child: BackgroundPattern(
        path: "assets/svg/profile-background.svg",
        patternExtension: PatternExtension.svg,
        widget: Column(children: <Widget>[
          50.heightBox,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: AppText(
                    text: context.tr("shareCards").toUpperCase(),
                    style: AppTextStyle.bold_21,
                    textColor: Palette.white,
                  ),
                ),
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
          20.heightBox,
          CustomSearchFieldWidget(
              searchHintText: context.tr("searchHint"),
              onPressed: () => _onSearchTap(clear: true),
              onSubmitted: (String value) => _onSearchTap(),
              iconPath: isSearched ? "assets/svg/delete-icon.svg" : null,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              width: 0.9.sw,
              iconColor: Palette.grey_bbbdbe,
              controller: searchController),
          10.heightBox,
          BlocConsumer<ShareCardCubit, ShareCardState>(
            listener: (BuildContext context, ShareCardState state) {
              if (state is ShareCardLoadingState) {
                ViewsToolbox.showLoading();
              } else if (state is ShareCardReadyState) {
                if (state.isLoading) {
                  ViewsToolbox.showLoading();
                } else {
                  ViewsToolbox.dismissLoading();
                }
                hasMorePages = state.hasMorePages;
              } else if (state is ShareCardErrorState) {
                ViewsToolbox.dismissLoading();
                ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
              }
            },
            builder: (BuildContext context, ShareCardState state) {
              if (state is ShareCardReadyState) {
                return state.shareCardList.isEmpty
                    ? NoDataWidget()
                    : MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Expanded(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            controller: _scrollController,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.h, left: 30.w, right: 30.w),
                                  child: ContactCardWidget(
                                    shareCardEntity: state.shareCardList[index],
                                  ));
                            },
                            itemCount: state.shareCardList.length,
                          ),
                        ),
                      );
              }
              return Container();
            },
          )
        ]),
      ),
    );
  }

  void _onSearchTap({bool clear = false}) {
    if (clear) {
      isSearched = false;

      searchController.text = "";
      _getShareCardList();
    } else {
      isSearched = true;

      _getShareCardList(searchText: searchController.text);
    }
    setState(() {});
  }

  void _getShareCardList({String? searchText, bool isSearched = true}) {
    _shareCardCubit.getAllShareCardsList(
        isSearched: isSearched,
        shareRequestModel: ShareCardsRequestModel(
            email: "F.Taha@diyarme.com",
            searchText: searchText,
            lang: LanguageHelper.isAr(context) ? "a" : "e"));
  }
}
