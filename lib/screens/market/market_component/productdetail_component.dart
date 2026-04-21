import 'package:burncheck/bloc/market/market_bloc.dart';
import 'package:burncheck/utils/my_api.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_svg.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductdetailComponent extends StatefulWidget {
  const ProductdetailComponent({super.key, required this.postID});
  final int postID;
  @override
  State<ProductdetailComponent> createState() => _ProductdetailComponentState();
}

class _ProductdetailComponentState extends State<ProductdetailComponent> {
  @override
  void initState() {
    super.initState();

    context.read<MarketBloc>().add(
      MarkerEventGetProductDetailMenu(menuIndexSelect: widget.postID),
    );
    context.read<MarketBloc>().add(
      MarkerEventSelectDetailMenu(menuSelectDetail: 0),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            ShowText(title: "ประกาศหมายเลข", textStyle: MyTextstyle.h2Black()),
            ShowText(
              title: widget.postID.toString(),
              textStyle: MyTextstyle.h2Red(),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () => debugPrint('Share'),
            ),
          ),
        ],
        backgroundColor: MyConstant.bgWhite,
        foregroundColor: MyConstant.textRed,
      ),
      body: BlocBuilder<MarketBloc, MarketState>(
        builder: (context, state) {
          final itemDetail = state.menuDetailSelect;
          return Column(
            children: [
              SizedBox(
                width: size.width,
                height: 256,
                child: itemDetail["productImage"] != null
                    ? itemDetail["productImage"] != ''
                          ? Image.network(
                              "${MyApi.urlProductImage}/${itemDetail["productImage"]}",
                              fit: BoxFit.cover,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyConstant.marketRed,
                                  width: 1,
                                ),
                              ),
                              child: Image.network(
                                MyApi.urlProductNoImage,
                                width: 155,
                                height: 118,
                              ),
                            )
                    : null,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  width: size.width,
                  decoration: BoxDecoration(color: MyConstant.marketLightGrey2),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: MyConstant.bgWhite,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            MyConstant.menuProductDetail.length,
                            (index) {
                              return GestureDetector(
                                onTap: () => context.read<MarketBloc>().add(
                                  MarkerEventSelectDetailMenu(
                                    menuSelectDetail: index,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: state.markerMenuSelect == index
                                        ? MyConstant.bgRed
                                        : MyConstant.bgLightGrey2,
                                    borderRadius: BorderRadius.circular(16.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: MyConstant.bgDarkGrey,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  width: (size.width / 3) - 32,
                                  height: 32,
                                  child: Center(
                                    child: ShowText(
                                      title:
                                          MyConstant.menuProductDetail[index],
                                      textStyle: state.markerMenuSelect == index
                                          ? MyTextstyle.b2WhiteBold()
                                          : MyTextstyle.b2Red(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16.0),
                        if (state.markerMenuSelect == 0)
                          if (itemDetail["productTypeName"] != null)
                            Expanded(
                              child: Container(
                                width: size.width * 0.88,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: MyConstant.bgWhite,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          itemDetail["postType"] == 'ประกาศขาย'
                                          ? MyConstant.marketRed
                                          : MyConstant.marketGreen,
                                      offset: Offset(0, -4),
                                    ),
                                    BoxShadow(
                                      color:
                                          itemDetail["postType"] == 'ประกาศขาย'
                                          ? MyConstant.marketRed
                                          : MyConstant.marketGreen,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: ShowText(
                                            title: itemDetail["productTypeName"]
                                                .toString(),
                                            textStyle: MyTextstyle.h1Black(),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                            vertical: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16.0,
                                            ),
                                            color:
                                                itemDetail["postType"] ==
                                                    'ประกาศขาย'
                                                ? MyConstant.marketRed
                                                      .withAlpha(50)
                                                : MyConstant.marketGreen
                                                      .withAlpha(50),
                                          ),
                                          child: ShowText(
                                            title: itemDetail["postType"],
                                            textStyle:
                                                itemDetail["postType"] ==
                                                    'ประกาศขาย'
                                                ? MyTextstyle.b2Red()
                                                : MyTextstyle.b2Green(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ShowText(
                                      title:
                                          'ประกาศโดย : ${itemDetail["postOwner"]}',
                                      textStyle: MyTextstyle.b1DarkGrey(),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          ShowSVG(
                                            pathFile: MyAsset.greenPinIcon,
                                            assetWidth: 20,
                                            assetHeight: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                            ),
                                            child: ShowText(
                                              title: itemDetail["locAdminName"],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                            // vertical: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16.0,
                                            ),
                                            color:
                                                itemDetail["postType"] ==
                                                    'ประกาศขาย'
                                                ? MyConstant.marketRed
                                                      .withAlpha(50)
                                                : MyConstant.marketGreen
                                                      .withAlpha(50),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ShowText(
                                                title: "฿ ",
                                                textStyle:
                                                    MyTextstyle.h2Black(),
                                              ),
                                              ShowText(
                                                title:
                                                    itemDetail["productPrice"],
                                                textStyle:
                                                    MyTextstyle.h2Black(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 2.0,
                                                  left: 4.0,
                                                ),
                                                child: ShowText(
                                                  title: MyConstant.unitPrice,
                                                  textStyle:
                                                      MyTextstyle.b2Black(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: List.generate(
                                              itemDetail['postRating'] != null
                                                  ? int.parse(
                                                      itemDetail["postRating"],
                                                    )
                                                  : 0,
                                              (index) => Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 4.0,
                                                ),
                                                child: ShowSVG(
                                                  pathFile: MyAsset.statFull,
                                                  assetHeight: 16.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 4.0,
                                              right: 4.0,
                                            ),
                                            child: ShowText(
                                              title:
                                                  itemDetail['postRating'] !=
                                                      null
                                                  ? '${itemDetail["postRating"]}.0'
                                                  : "",
                                              textStyle: MyTextstyle.h2Black(),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 4.0,
                                            ),
                                            child: ShowText(
                                              title:
                                                  '(${itemDetail["productReviewer"]} รีวิว)',
                                              textStyle:
                                                  MyTextstyle.b1DarkGrey(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ShowText(
                                      title: itemDetail['postDescription']
                                          .toString(),
                                      textStyle: MyTextstyle.b2DarkGrey(),
                                    ),
                                    SizedBox(height: 4.0),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: MyConstant.border,
                                        ),
                                        color: MyConstant.bgWhite,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: MyConstant.bgDarkGrey,
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            height: 80,
                                            child:
                                                itemDetail["productImage"] !=
                                                    null
                                                ? itemDetail["productImage"] !=
                                                          ''
                                                      ? Image.network(
                                                          "${MyApi.urlProductImage}/${itemDetail["productImage"]}",
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: MyConstant
                                                                  .marketRed,
                                                              width: 1,
                                                            ),
                                                          ),
                                                          child: Image.network(
                                                            MyApi
                                                                .urlProductNoImage,
                                                            width: 155,
                                                            height: 118,
                                                          ),
                                                        )
                                                : null,
                                          ),
                                          SizedBox(width: 12.0),
                                          Expanded(
                                            child: SizedBox(
                                              height: 80,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ShowText(
                                                            title:
                                                                'ปริมาณ/น้ำหนัก',
                                                            textStyle:
                                                                MyTextstyle.b2Black(),
                                                          ),
                                                          ShowText(
                                                            title:
                                                                '${state.menuDetailSelect["productAmount"]} ${MyConstant.unitWeight}',
                                                            textStyle:
                                                                MyTextstyle.b2Black(),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 4.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ShowText(
                                                            title: 'คงเหลือ',
                                                            textStyle:
                                                                MyTextstyle.b2Black(),
                                                          ),
                                                          ShowText(
                                                            title:
                                                                '${state.menuDetailSelect["productBalance"]} ${MyConstant.unitWeight}',
                                                            textStyle:
                                                                MyTextstyle.b2Black(),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 28,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          MyConstant.marketRed,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.bookmark,
                                                          size: 16,
                                                          color: MyConstant
                                                              .textWhite,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                left: 4.0,
                                                              ),
                                                          child: ShowText(
                                                            title: 'จอง',
                                                            textStyle:
                                                                MyTextstyle.h3White(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                  ],
                                ),
                              ),
                            ),
                        if (state.markerMenuSelect == 1)
                          Expanded(child: Container(color: Colors.red)),
                        if (state.markerMenuSelect == 2)
                          Expanded(child: Container(color: Colors.blue)),
                        SizedBox(height: 4.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowText(
                                  title: 'วันที่เริ่มต้นประกาศ',
                                  textStyle: MyTextstyle.b2Black(),
                                ),
                                ShowText(
                                  title: state.menuDetailSelect["creatDate"]
                                      .toString(),
                                  textStyle: MyTextstyle.b2Black(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShowText(
                                title: 'วันที่สิ้นสุดประกาศ',
                                textStyle: MyTextstyle.b2Black(),
                              ),
                              ShowText(
                                title: state.menuDetailSelect["expireDate"]
                                    .toString(),
                                textStyle: MyTextstyle.b2Black(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                height: 80,
                color: MyConstant.bgWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 48,
                      decoration: BoxDecoration(
                        color: MyConstant.bgRed,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            color: MyConstant.textWhite,
                            size: 16,
                          ),
                          SizedBox(width: 8.0),
                          ShowText(
                            title: 'โทรเลย',
                            textStyle: MyTextstyle.h2White(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: MyConstant.bgWhite,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: MyConstant.textDarkGrey,
                              blurRadius: 2,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Icon(Icons.message, color: MyConstant.textRed),
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: MyConstant.bgWhite,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: MyConstant.textDarkGrey,
                            blurRadius: 2,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: MyConstant.textRed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Expanded itemDetails(Size size, BuildContext context, MarketState state) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: size.width,
        decoration: BoxDecoration(color: MyConstant.marketLightGrey2),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: MyConstant.bgWhite,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(MyConstant.menuProductDetail.length, (
                  index,
                ) {
                  return GestureDetector(
                    onTap: () => context.read<MarketBloc>().add(
                      MarkerEventSelectDetailMenu(menuSelectDetail: index),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: state.markerMenuSelect == index
                            ? MyConstant.bgRed
                            : MyConstant.bgLightGrey2,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: MyConstant.bgDarkGrey,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      width: (size.width / 3) - 32,
                      height: 32,
                      child: Center(
                        child: ShowText(
                          title: MyConstant.menuProductDetail[index],
                          textStyle: state.markerMenuSelect == index
                              ? MyTextstyle.b2WhiteBold()
                              : MyTextstyle.b2Red(),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.0),
              if (state.menuDetailSelect["productTypeName"] == null)
                Center(child: CircularProgressIndicator()),
              if (state.menuDetailSelect["productTypeName"] != null)
                Expanded(
                  child: Container(
                    width: size.width * 0.88,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: MyConstant.bgWhite,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color:
                              state.menuDetailSelect["postType"] == 'ประกาศขาย'
                              ? MyConstant.marketRed
                              : MyConstant.marketGreen,
                          offset: Offset(0, -4),
                        ),
                        BoxShadow(
                          color:
                              state.menuDetailSelect["postType"] == 'ประกาศขาย'
                              ? MyConstant.marketRed
                              : MyConstant.marketGreen,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: ShowText(
                                title: state.menuDetailSelect["productTypeName"]
                                    .toString(),
                                textStyle: MyTextstyle.h1Black(),
                                maxLines: 100,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 2.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color:
                                    state.menuDetailSelect["postType"] ==
                                        'ประกาศขาย'
                                    ? MyConstant.marketRed.withAlpha(50)
                                    : MyConstant.marketGreen.withAlpha(50),
                              ),
                              child: ShowText(
                                title: state.menuDetailSelect["postType"],
                                textStyle:
                                    state.menuDetailSelect["postType"] ==
                                        'ประกาศขาย'
                                    ? MyTextstyle.b2Red()
                                    : MyTextstyle.b2Green(),
                              ),
                            ),
                          ],
                        ),
                        ShowText(
                          title:
                              'ประกาศโดย : ${state.menuDetailSelect["postOwner"]}',
                          textStyle: MyTextstyle.b1DarkGrey(),
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          children: [
                            ShowSVG(
                              pathFile: MyAsset.greenPinIcon,
                              assetWidth: 20,
                              assetHeight: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ShowText(
                                title: state.menuDetailSelect["locAdminName"],
                              ),
                            ),
                          ],
                        ),

                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 16.0,
                        //     vertical: 2.0,
                        //   ),
                        //   width: 120,
                        //   height: 28,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(16.0),
                        //     color: widget.content["postType"] == 0
                        //         ? MyConstant.marketRed.withAlpha(50)
                        //         : MyConstant.marketGreen.withAlpha(
                        //             50,
                        //           ),
                        //   ),
                        //   child: Row(
                        //     crossAxisAlignment:
                        //         CrossAxisAlignment.end,
                        //     children: [
                        //       ShowText(
                        //         title:
                        //             "฿${widget.content["productPrice"]}",
                        //         textStyle: MyTextstyle.h2Black(),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(
                        //           bottom: 2.0,
                        //           left: 4.0,
                        //         ),
                        //         child: ShowText(
                        //           title: MyConstant.unitPrice,
                        //           textStyle: MyTextstyle.b2Black(),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              // Row(
                              //   children: List.generate(
                              //     widget.content['postRating'] != 0
                              //         ? int.parse(
                              //             widget
                              //                 .content["postRating"],
                              //           )
                              //         : widget.content['postRating'],
                              //     (index) => ShowSVG(
                              //       pathFile: MyAsset.statFull,
                              //       assetHeight: 16.0,
                              //     ),
                              //   ),
                              // ),
                              // ShowText(
                              //   title: widget.content["postRating"]
                              //       .toString(),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // child: ShowText(
                    //   title: widget.content["productTypeName"],
                    // ),
                  ),
                ),
              SizedBox(height: 4.0),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowText(
                        title: 'วันที่เริ่มต้นประกาศ',
                        textStyle: MyTextstyle.b2Black(),
                      ),
                      ShowText(
                        title: state.menuDetailSelect["creatDate"].toString(),
                        textStyle: MyTextstyle.b2Black(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShowText(
                      title: 'วันที่สิ้นสุดประกาศ',
                      textStyle: MyTextstyle.b2Black(),
                    ),
                    ShowText(
                      title: state.menuDetailSelect["expireDate"].toString(),
                      textStyle: MyTextstyle.b2Black(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
