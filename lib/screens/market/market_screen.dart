import 'package:burncheck/bloc/market/market_bloc.dart';
import 'package:burncheck/screens/market/market_component/addnews_component.dart';
import 'package:burncheck/screens/market/market_component/distanceslider_component.dart';
import 'package:burncheck/screens/market/market_component/priceslider_component.dart';
import 'package:burncheck/screens/market/market_component/radiochip_component.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_header.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final nameFocus = FocusNode();

    return BlocBuilder<MarketBloc, MarketState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              color: MyConstant.bgLightGrey2,
              child: Column(
                children: [
                  ShowHeader(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: searchMenu(size, state, nameFocus),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 12.0,
                      right: 12.0,
                    ),
                    child: Row(
                      children: [
                        menuShow(state, MyConstant.filterNotify[0], 0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: menuShow(state, MyConstant.filterNotify[1], 1),
                        ),
                        menuShow(state, MyConstant.filterNotify[2], 2),
                      ],
                    ),
                  ),
                  notifyContent(),
                ],
              ),
            ),
            AddNews(),
          ],
        );
      },
    );
  }

  Expanded notifyContent() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 16.0, left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ShowText(title: 'ประกาศทั้งหมด', textStyle: MyTextstyle.b2Black()),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
                      child: SizedBox(
                        width: 40,
                        child: Image.asset(MyAsset.logoApp),
                      ),
                    ),
                    ShowText(
                      title: 'ไม่มีข้อมูล',
                      textStyle: MyTextstyle.b2DarkGrey(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding searchMenu(Size size, MarketState state, FocusNode nameFocus) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: MyConstant.textBlack),
                  hintText: 'ค้นหา',
                  hintStyle: MyTextstyle.h3DarkGrey(),
                  suffixIcon: Icon(Icons.close, color: MyConstant.textBlack),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          GestureDetector(
            onTap: () {
              showFilterBottomSheet(context, size);
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: MyConstant.textRed,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Icon(
                Icons.manage_search_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector menuShow(MarketState state, String title, int indexSelect) {
    return GestureDetector(
      onTap: () => {
        context.read<MarketBloc>().add(
          MarkerEventTypeSelect(typeSelected: indexSelect),
        ),
      },
      child: Container(
        height: 36.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: state.typeSelected == indexSelect
              ? Border.all(color: Colors.red, width: 1)
              : Border.all(color: MyConstant.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: state.typeSelected == indexSelect
              ? Colors.red.withAlpha(40)
              : Colors.white.withAlpha(70),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ShowText(title: title, textStyle: MyTextstyle.b2Black())],
        ),
      ),
    );
  }

  Future showFilterBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (selectionFilter) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              ),
              child: BlocBuilder<MarketBloc, MarketState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: ShowText(
                            title: MyConstant.filterMenu[0],
                            textStyle: MyTextstyle.h1Black(),
                          ),
                        ),
                        const Divider(height: 1),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                          child: ShowText(
                            title: MyConstant.filterMenu[1],
                            textStyle: MyTextstyle.h2Black(),
                          ),
                        ),
                        SizedBox(
                          width: size.width,
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return RadioChip(
                                title:
                                    MyConstant.filterTypeItem[index]['title'],
                                value:
                                    MyConstant.filterTypeItem[index]['value'],
                                selected: state.typeSelected == index,
                                onTap: () {
                                  context.read<MarketBloc>().add(
                                    MarkerEventTypeSelect(typeSelected: index),
                                  );
                                  // Navigator.pop(context);
                                },
                              );
                            },
                            separatorBuilder: (_, __) => Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                              ),
                              child: const Divider(height: 0),
                            ),
                            itemCount: MyConstant.filterTypeItem.length,
                          ),
                        ),
                        ShowText(
                          title: MyConstant.filterMenu[2],
                          textStyle: MyTextstyle.h2Black(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                          ),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(
                              MyConstant.filterAgriWaste.length,
                              (index) {
                                final item = MyConstant.filterAgriWaste[index];
                                return btnAgriWaste(
                                  mode: 0,
                                  title: item['title'],
                                  isSelected:
                                      state.agriWasteSelected == item['id'],
                                  onTap: () {
                                    context.read<MarketBloc>().add(
                                      MarkerEventAgriWasteSelect(
                                        agriWasteSelected: item['id'],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        ShowText(
                          title: MyConstant.filterMenu[3],
                          textStyle: MyTextstyle.h2Black(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                          ),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(
                              MyConstant.filterScore.length,
                              (index) {
                                final item = MyConstant.filterScore[index];
                                return btnAgriWaste(
                                  mode: 1,
                                  title: item['title'],
                                  isSelected: state.scoreSelected == item['id'],
                                  onTap: () {
                                    context.read<MarketBloc>().add(
                                      MarkerEventScoreSelect(
                                        scoreSelected: item['id'],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        ShowText(
                          title: MyConstant.filterMenu[4],
                          textStyle: MyTextstyle.h2Black(),
                        ),
                        DistanceSlider(
                          valueKm: state.rangeSelect,
                          onChangedKm: (v) {
                            context.read<MarketBloc>().add(
                              MarkerEventRangeSelect(rangeSelect: v),
                            );
                          },
                        ),
                        ShowText(
                          title: MyConstant.filterMenu[5],
                          textStyle: MyTextstyle.h2Black(),
                        ),
                        RangeKmSlider(
                          valuePrice: state.priceRange,
                          onChangedPriceRange: (range) {
                            context.read<MarketBloc>().add(
                              MarkerEventPriceSelect(priceRange: range),
                            );
                          },
                        ),
                        SizedBox(height: 40.0, child: const Divider(height: 1)),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 40.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              controlButton(
                                selectionFilter,
                                'ล้าง',
                                0,
                                Icons.close,
                                state,
                              ),
                              controlButton(
                                selectionFilter,
                                'ค้นหา',
                                1,
                                Icons.search,
                                state,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  GestureDetector btnAgriWaste({
    required int mode,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MyConstant.textRed : MyConstant.textLightGrey,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
          child: mode == 0
              ? ShowText(
                  title: title,
                  textStyle: isSelected
                      ? MyTextstyle.b2White()
                      : MyTextstyle.b2Black(),
                )
              : SizedBox(
                  width: title == "ทั้งหมด" ? 72 : 48,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: isSelected
                            ? MyConstant.textWhite
                            : MyConstant.textRed,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      ShowText(
                        title: title,
                        textStyle: isSelected
                            ? MyTextstyle.b2White()
                            : MyTextstyle.b2Black(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  GestureDetector controlButton(
    BuildContext sheetCtx,
    String title,
    int typeBtn,
    IconData icons,
    MarketState state,
  ) {
    return GestureDetector(
      onTap: () {
        if (typeBtn == 0) {
          sheetCtx.read<MarketBloc>().add(
            MarkerEventTypeSelect(typeSelected: 0),
          );
          sheetCtx.read<MarketBloc>().add(
            MarkerEventAgriWasteSelect(agriWasteSelected: 0),
          );
          sheetCtx.read<MarketBloc>().add(
            MarkerEventScoreSelect(scoreSelected: 0),
          );
          sheetCtx.read<MarketBloc>().add(
            MarkerEventRangeSelect(rangeSelect: 10),
          );
          sheetCtx.read<MarketBloc>().add(
            MarkerEventPriceSelect(priceRange: RangeValues(0, 1000)),
          );
        } else {
          debugPrint(state.typeSelected.toString());
          debugPrint(state.agriWasteSelected.toString());
          debugPrint(state.scoreSelected.toString());
          debugPrint(state.rangeSelect.toString());
          debugPrint(state.priceRange.toString());
        }
        Navigator.pop(sheetCtx);
      },
      child: Container(
        decoration: BoxDecoration(
          color: typeBtn == 0 ? MyConstant.bgLightGrey2 : MyConstant.bgRed,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        width: 144,
        height: 40,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: typeBtn == 0 ? MyConstant.textRed : Colors.white,
                size: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ShowText(
                  title: title,
                  textStyle: typeBtn == 0
                      ? MyTextstyle.h3Red()
                      : MyTextstyle.h3White(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
