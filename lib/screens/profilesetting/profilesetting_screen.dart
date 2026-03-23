import 'package:burncheck/bloc/profilesetting/profilesetting_bloc.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:burncheck/widgets/show_image.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilesettingScreen extends StatefulWidget {
  const ProfilesettingScreen({super.key});

  @override
  State<ProfilesettingScreen> createState() => _ProfilesettingScreenState();
}

class _ProfilesettingScreenState extends State<ProfilesettingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProfilesettingBloc, ProfilesettingState>(
      builder: (context, state) {
        return Container(
          color: MyConstant.bgLightGrey2,
          child: Column(
            children: [
              ShowHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!state.isLogin)
                          GestureDetector(
                            onTap: () => context.read<ProfilesettingBloc>().add(
                              ProfilesettingEventLogin(isLogin: true),
                            ),
                            child: Container(
                              width: size.width * 0.95,
                              height: 56,
                              decoration: BoxDecoration(
                                color: MyConstant.bgRed,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: ShowText(
                                  title: 'เข้าสู่ระบบ / สมัครสมาชิก',
                                  textStyle: MyTextstyle.h2White(),
                                ),
                              ),
                            ),
                          ),
                        if (state.isLogin)
                          GestureDetector(
                            onTap: () => context.read<ProfilesettingBloc>().add(
                              ProfilesettingEventLogin(isLogin: true),
                            ),
                            child: Container(
                              width: size.width * 0.95,
                              height: 80,
                              decoration: BoxDecoration(
                                color: MyConstant.bgWhite,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: const Offset(0, 4),
                                    blurRadius: 4,
                                  ),
                                  BoxShadow(
                                    color: MyConstant.marketRed,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: MyConstant.bgRed,
                                      child: Icon(
                                        Icons.emoji_people_outlined,
                                        color: MyConstant.textWhite,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ShowText(
                                        title: 'นายสุวิจักขณ์ ศรีสิริโสภา',
                                        textStyle: MyTextstyle.h2Black(),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 2.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: MyConstant.bgRed,
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                        ),
                                        child: ShowText(
                                          title: 'สมาชิก',
                                          textStyle: MyTextstyle.b2White(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (state.isLogin)
                          profileContent(size, 0, MyConstant.generalMenuItems),
                        if (state.isLogin)
                          profileContent(
                            size,
                            1,
                            MyConstant.announcementMenuItems,
                          ),
                        if (state.isLogin)
                          profileContent(size, 2, MyConstant.bookingMenuItems),
                        profileContent(size, 3, MyConstant.contactMenuItems),
                        if (state.isLogin)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GestureDetector(
                              onTap: () =>
                                  context.read<ProfilesettingBloc>().add(
                                    ProfilesettingEventLogin(isLogin: false),
                                  ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: MyConstant.bgWhite,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                height: 56,
                                width: size.width,
                                child: Center(
                                  child: ShowText(
                                    title: 'ออกจากระบบ',
                                    textStyle: MyTextstyle.h2Red(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (state.isLogin)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ShowImage(
                              pathFile: MyAsset.logoOrganize,
                              assetWidth: size.width * 0.8,
                            ),
                          ),
                        if (state.isLogin)
                          ShowText(
                            title:
                                'พัฒนาโดย สำนักงานพัฒนาเทคโนโลยีอวกาศและภูมิสารสนเทศ\n(องค์การมหาชน):GISTDA',
                            textAlign: TextAlign.center,
                            textStyle: MyTextstyle.powered(),
                          ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column profileContent(
    Size size,
    int indexHeader,
    List<Map<String, dynamic>> contentShow,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 12.0),
          child: ShowText(
            title: MyConstant.profileMenu[indexHeader],
            textStyle: MyTextstyle.h2Black(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(contentShow.length, (index) {
              final item = contentShow[index];
              return GestureDetector(
                onTap: () => debugPrint(item['title']),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: MyConstant.bgWhite,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: MyConstant.bgRed,
                        offset: const Offset(-4, 0),
                      ),
                    ],
                  ),
                  height: 64,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 48,
                        child: CircleAvatar(
                          child: item['icon'],
                          backgroundColor: MyConstant.bgLightGrey3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShowText(
                              title: item['title'],
                              textStyle: MyTextstyle.h2Red(),
                            ),
                            ShowText(
                              title: item['subtitle'],
                              textStyle: MyTextstyle.b2DarkGrey(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
