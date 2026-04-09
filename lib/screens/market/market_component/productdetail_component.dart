import 'package:burncheck/bloc/market/market_bloc.dart';
import 'package:burncheck/utils/my_api.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductdetailComponent extends StatefulWidget {
  const ProductdetailComponent({super.key, required this.content});
  final Map<String, dynamic> content;
  @override
  State<ProductdetailComponent> createState() => _ProductdetailComponentState();
}

class _ProductdetailComponentState extends State<ProductdetailComponent> {
  @override
  void initState() {
    super.initState();
    context.read<MarketBloc>().add(
      MarkerEventGetProductDetailMenu(menuIndexSelect: 0),
    );
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
              title: widget.content["postId"].toString(),
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
          return Column(
            children: [
              SizedBox(
                width: size.width,
                height: 256,
                child: widget.content["productImage"] != ""
                    ? Image.network(
                        '${MyApi.urlProductImage}/${widget.content["productImage"]}',
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
                      ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  width: size.width,
                  decoration: BoxDecoration(color: MyConstant.marketLightGrey2),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
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
                                  MarkerEventGetProductDetailMenu(
                                    menuIndexSelect: index,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: state.menuDetailSelect == index
                                        ? MyConstant.bgRed
                                        : MyConstant.bgLightGrey2,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  width: (size.width / 3) - 24,
                                  height: 32,
                                  child: Center(
                                    child: ShowText(
                                      title:
                                          MyConstant.menuProductDetail[index],
                                      textStyle: state.menuDetailSelect == index
                                          ? MyTextstyle.b1WhiteBold()
                                          : MyTextstyle.b1Red(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16.0),
                        if (state.menuDetailSelect == 0)
                          Expanded(
                            child: Container(
                              width: size.width * 0.88,
                              decoration: BoxDecoration(
                                color: MyConstant.bgWhite,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: widget.content["postType"] == 0
                                        ? MyConstant.marketRed
                                        : MyConstant.marketGreen,
                                    offset: Offset(0, -4),
                                  ),
                                  BoxShadow(
                                    color: widget.content["postType"] == 0
                                        ? MyConstant.marketRed
                                        : MyConstant.marketGreen,
                                    blurRadius: 2,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: size.width * 0.88,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShowText(title: 'วันที่เริ่มต้นประกาศ'),
                                ShowText(
                                  title: widget.content["creatDate"].toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.88,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShowText(title: 'วันที่สิ้นสุดประกาศ'),
                              ShowText(
                                title: widget.content["expireDate"].toString(),
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
}
