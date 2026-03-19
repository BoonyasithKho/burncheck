import 'package:burncheck/bloc/mainpage/mainpage_bloc.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_image.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBottomNavigationBar extends StatelessWidget {
  const ShowBottomNavigationBar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 84,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(18),
          bottom: Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
            color: MyConstant.bgLightGrey3,
            blurRadius: 40,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: List.generate(MyConstant.bottomBarMenuItems.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<MainpageBloc>().add(
                  MainpageEventScreenSelect(screenNo: index),
                );
              },
              child: BlocBuilder<MainpageBloc, MainpageState>(
                builder: (context, state) {
                  return Container(
                    color: MyConstant.bgWhite,
                    child: Column(
                      children: [
                        SizedBox(height: 8),
                        state.screenSelect == index
                            ? SizedBox(
                                width: 30,
                                height: 30,
                                child: ShowImage(pathFile: MyAsset.logoApp),
                              )
                            : SizedBox(
                                width: 30,
                                height: 30,
                                child: MyConstant
                                    .bottomBarMenuItems[index]['icon'],
                              ),
                        ShowText(
                          title: MyConstant.bottomBarMenuItems[index]['title'],
                          textStyle: MyTextstyle.b2Black(),
                        ),
                        Container(
                          width: size.width / 5,
                          height: 2,
                          color: state.screenSelect == index
                              ? MyConstant.textRed
                              : null,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
