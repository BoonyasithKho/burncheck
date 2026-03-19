import 'package:burncheck/bloc/mainpage/mainpage_bloc.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_image.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowHeader extends StatelessWidget {
  const ShowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MainpageBloc, MainpageState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 12.0, right: 20.0),
          decoration: BoxDecoration(
            color: MyConstant.bgWhite,
            boxShadow: [
              BoxShadow(
                color: MyConstant.bgLightGrey3,
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          width: size.width,
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ShowImage(pathFile: MyAsset.logoApp, assetHeight: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShowText(
                          title: MyConstant.appName,
                          textStyle: MyTextstyle.h1Black(),
                        ),
                        ShowText(
                          title: MyConstant
                              .bottomBarMenuItems[state.screenSelect]["title"],
                          textStyle: MyTextstyle.h2Red(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint('message');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MyConstant.bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(0, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(child: Icon(Icons.mail_outline_rounded)),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: MyConstant.bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(0, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(child: Icon(Icons.favorite_border)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
