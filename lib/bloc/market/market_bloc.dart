import 'dart:convert';

import 'package:burncheck/models/agriwaste_model.dart';
import 'package:burncheck/models/agriwasteshowdetail_model.dart';
import 'package:burncheck/utils/my_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc()
    : super(
        MarketState(
          typeSelected: 0,
          agriWasteSelected: 0,
          scoreSelected: 0,
          rangeSelect: 10,
          priceRange: RangeValues(0, 100),
          productItem: [],
          menuDetailSelect: {},
          markerMenuSelect: 0,
        ),
      ) {
    on<MarkerEventTypeSelect>(onTypeSelection);
    on<MarkerEventAgriWasteSelect>(onAgriWasteSelection);
    on<MarkerEventScoreSelect>(onScoreSelection);
    on<MarkerEventRangeSelect>(onRangeSelection);
    on<MarkerEventPriceSelect>(onPriceSelecton);
    on<MarkerEventGetProductAll>(onGetProductAll);
    on<MarkerEventGetProductDetailMenu>(onProductDetailMenu);
    on<MarkerEventSelectDetailMenu>(onSelectDetailMenu);
  }

  Future<void> onTypeSelection(
    MarkerEventTypeSelect event,
    Emitter<MarketState> emit,
  ) async {
    emit(state.copyWith(typeSelected: event.typeSelected));
  }

  Future<void> onAgriWasteSelection(
    MarkerEventAgriWasteSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(agriWasteSelected: event.agriWasteSelected));
  }

  Future<void> onScoreSelection(
    MarkerEventScoreSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(scoreSelected: event.scoreSelected));
  }

  Future<void> onRangeSelection(
    MarkerEventRangeSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(rangeSelect: event.rangeSelect));
  }

  Future<void> onPriceSelecton(
    MarkerEventPriceSelect event,
    Emitter emit,
  ) async {
    emit(state.copyWith(priceRange: event.priceRange));
  }

  Future<void> onGetProductAll(
    MarkerEventGetProductAll event,
    Emitter emit,
  ) async {
    final productToBuySell = await getProductAgriWaste();
    emit(state.copyWith(productItem: productToBuySell));
  }

  Future<void> onProductDetailMenu(
    MarkerEventGetProductDetailMenu event,
    Emitter emit,
  ) async {
    final productShowDetail = await getProductShowDetail(event.menuIndexSelect);
    emit(state.copyWith(menuDetailSelect: productShowDetail));
  }

  Future<void> onSelectDetailMenu(
    MarkerEventSelectDetailMenu event,
    Emitter emit,
  ) async {
    emit(state.copyWith(markerMenuSelect: event.menuSelectDetail));
  }

  Future<List<Map<String, dynamic>>> getProductAgriWaste() async {
    final url = MyApi.urlProductBuySell;
    final response = await http.get(Uri.parse(url));

    List<Map<String, dynamic>> productItem = [];

    if (response.statusCode == 200) {
      var responseJson = AgriWasteModel.fromJson(jsonDecode(response.body));
      for (var i = 0; i < responseJson.data.length; i++) {
        productItem.add({
          'postId': responseJson.data[i].postId,
          'postType': responseJson.data[i].type.id,
          'productTypeName': responseJson.data[i].productType.text,
          'locAdminName': responseJson.data[i].address.text,
          'postRating': responseJson.data[i].rating,
          'productPrice': int.parse(responseJson.data[i].price),
          'postOwner': responseJson.data[i].author,
          'productImage': responseJson.data[i].productImages!.isNotEmpty
              ? responseJson.data[i].productImages![0].thumbnail
              : "",
        });
      }
    }
    return productItem;
  }

  Future<Map<String, dynamic>> getProductShowDetail(int menuIndexSelect) async {
    final url = "${MyApi.urlProductBuySell}/$menuIndexSelect";
    final response = await http.get(Uri.parse(url));

    Map<String, dynamic> productItemDetail = {};

    if (response.statusCode == 200) {
      var responseJson = AgriWasteShowDetail.fromJson(
        jsonDecode(response.body),
      );
      productItemDetail.addAll({
        'postType': responseJson.data!.type == 0 ? 'ประกาศขาย' : 'ประกาศซื้อ',
        'productTypeName': responseJson.data!.products![0].productType!.name,
        'postOwner': responseJson.data!.author,
        'locAdminName':
            "${responseJson.data!.subdistrict} ${responseJson.data!.district} ${responseJson.data!.province}",
        'postRating': responseJson.data!.rating,
        'productPrice': responseJson.data!.products![0].productType!.price,
        'productReviewer': responseJson.data?.ratings != []
            ? responseJson.data!.ratings!.length
            : 0,
        'postDescription': responseJson.data!.description,
        'productImage':
            responseJson.data!.products![0].productImages!.isNotEmpty
            ? responseJson.data!.products![0].productImages![0].thumbnail
            : "",
        'productAmount': responseJson.data!.products![0].amount,
        'productBalance': responseJson.data!.products![0].balance,
        'creatDate': responseJson.data!.createdAt!.day < 10
            ? "${responseJson.data!.createdAt!.day}-${checkMonthThai(responseJson.data!.createdAt!.month)}-0${responseJson.data!.createdAt!.year}"
            : "${responseJson.data!.createdAt!.day}-${checkMonthThai(responseJson.data!.createdAt!.month)}-${responseJson.data!.createdAt!.year}",
        'expireDate': responseJson.data!.createdAt!.day < 10
            ? "${responseJson.data!.expiresAt!.day}-${checkMonthThai(responseJson.data!.expiresAt!.month)}-0${responseJson.data!.expiresAt!.year}"
            : "${responseJson.data!.expiresAt!.day}-${checkMonthThai(responseJson.data!.expiresAt!.month)}-${responseJson.data!.expiresAt!.year}",
        'productLocation': [
          responseJson.data!.latitude,
          responseJson.data!.longitude,
        ],
      });
    }
    return productItemDetail;
  }

  String checkMonthThai(int monthNo) {
    String whatIsMonth = '';
    switch (monthNo) {
      case 1:
        whatIsMonth = 'ม.ค.';
        break;
      case 2:
        whatIsMonth = 'ม.ค.';
        break;
      case 3:
        whatIsMonth = 'มี.ค.';
        break;
      case 4:
        whatIsMonth = 'เม.ย.';
        break;
      case 5:
        whatIsMonth = 'พ.ค.';
        break;
      case 6:
        whatIsMonth = 'มิ.ย.';
        break;
      case 7:
        whatIsMonth = 'ก.ค.';
        break;
      case 8:
        whatIsMonth = 'ส.ค.';
        break;
      case 9:
        whatIsMonth = 'ก.ย.';
        break;
      case 10:
        whatIsMonth = 'ต.ค.';
        break;
      case 11:
        whatIsMonth = 'พ.ย.';
        break;
      case 12:
        whatIsMonth = 'ธ.ค.';
        break;
      default:
    }
    return whatIsMonth;
  }
}
