import 'dart:convert';

import 'package:burncheck/models/priceboard_model.dart';
import 'package:burncheck/utils/my_api.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:burncheck/utils/my_constant.dart';

class PriceComponent extends StatefulWidget {
  const PriceComponent({super.key});

  @override
  State<PriceComponent> createState() => _PriceComponentState();
}

class _PriceComponentState extends State<PriceComponent> {
  late final Future<List<dynamic>> _priceFuture;
  List<PriceBoard> priceData = [];

  @override
  void initState() {
    super.initState();
    _priceFuture = getPriceRate();
  }

  Future<List<PriceBoard>> getPriceRate() async {
    var response = await http.get(Uri.parse(MyApi.priceBoard));

    var jsonData = jsonDecode(response.body);

    for (var u in jsonData) {
      PriceBoard getData = PriceBoard(
        productTypeId: u["product_type_id"],
        name: u["name"],
        min: double.parse(u["min"]).toStringAsFixed(2),
        avg: double.parse(u["avg"]).toStringAsFixed(2),
        max: double.parse(u["max"]).toStringAsFixed(2),
      );
      priceData.add(getData);
    }
    return priceData;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: FutureBuilder(
        future: _priceFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                width: size.width * 0.94,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowText(
                            title: 'ประเภทการซื้อขายรายประเภท',
                            textStyle: MyTextstyle.h2Black(),
                          ),
                          ShowText(
                            title: 'จากทั้งหมด ${priceData.length} ประเภท',
                            textStyle: MyTextstyle.b1Black(),
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.94,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(64),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        border: Border.all(color: MyConstant.border),
                      ),
                      child: SizedBox(
                        height: 56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: ShowText(
                                  title: 'ประเภท',
                                  textStyle: MyTextstyle.b1Black(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ShowText(
                                          title: 'ราคาต่ำสุด',
                                          textStyle: MyTextstyle.b1Black(),
                                        ),
                                        ShowText(
                                          title: '(บาท/กก.)',
                                          textStyle: MyTextstyle.b1DarkGrey(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ShowText(
                                        title: 'ราคากลาง',
                                        textStyle: MyTextstyle.b1Black(),
                                      ),
                                      ShowText(
                                        title: '(บาท/กก.)',
                                        textStyle: MyTextstyle.b1DarkGrey(),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ShowText(
                                        title: 'ราคาสูงสุด',
                                        textStyle: MyTextstyle.b1Black(),
                                      ),
                                      ShowText(
                                        title: '(บาท/กก.)',
                                        textStyle: MyTextstyle.b1DarkGrey(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Divider(),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: MyConstant.border),
                          color: Colors.white.withAlpha(64),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: ListView.separated(
                          separatorBuilder: (_, __) => Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                            ),
                            child: const Divider(height: 1),
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              left: 16.0,
                              bottom: 16.0,
                            ),
                            child: Row(
                              children: [
                                contentTable(
                                  snapshot,
                                  index,
                                  snapshot.data[index].name,
                                  TextAlign.left,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      contentTable(
                                        snapshot,
                                        index,
                                        snapshot.data[index].min,
                                        TextAlign.center,
                                      ),
                                      contentTable(
                                        snapshot,
                                        index,
                                        snapshot.data[index].avg,
                                        TextAlign.center,
                                      ),
                                      contentTable(
                                        snapshot,
                                        index,
                                        snapshot.data[index].max,
                                        TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return const LinearProgressIndicator();
        },
      ),
    );
  }

  Expanded contentTable(
    AsyncSnapshot<dynamic> snapshot,
    int index,
    String titleValue,
    TextAlign titleAlign,
  ) {
    return Expanded(
      flex: 1,
      child: ShowText(
        title: titleValue,
        textStyle: MyTextstyle.b1Black(),
        textAlign: titleAlign,
      ),
    );
  }
}
