import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_doctext.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_dialog.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';
import 'package:sphere_maps_flutter/sphere_maps_flutter.dart';

class MenuResultComponent extends StatefulWidget {
  const MenuResultComponent({
    super.key,
    required this.titleContent,
    required this.index,
  });
  final String titleContent;
  final int index;
  @override
  State<MenuResultComponent> createState() => _MenuResultComponentState();
}

class _MenuResultComponentState extends State<MenuResultComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          title: widget.titleContent,
          textStyle: MyTextstyle.h1White(),
        ),
        backgroundColor: MyConstant.bgRed,
        foregroundColor: MyConstant.textWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
        child: (widget.index == 0)
            ? validateResult(context, size)
            : (widget.index == 1)
            ? reportResult(context, size)
            : (widget.index == 2)
            ? repleatCheck(context, size)
            : (widget.index == 3)
            ? mappingRequest(context, size)
            : null,
      ),
    );
  }

  Stack mappingRequest(BuildContext context, Size size) {
    return Stack();
  }

  Column repleatCheck(BuildContext context, Size size) {
    return Column(
      children: [
        SizedBox(
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
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(DocText.showditems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: GestureDetector(
                      onTap: () => ShowDialog.showInformationItem(
                        context,
                        size,
                        DocText.showditems[index]["title"],
                        '',
                        200,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 72,
                        decoration: BoxDecoration(
                          color: MyConstant.bgWhite,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                DocText.showditems[index]["dotColor"],
                              ),
                              offset: Offset(0, -4),
                            ),
                            BoxShadow(
                              color: MyConstant.bgDarkGrey,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                // width: 40.0,
                                child: CircleAvatar(
                                  backgroundColor: Color(
                                    DocText.showditems[index]["statusColor"],
                                  ),
                                  radius: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ShowText(
                                    title: DocText.showditems[index]["title"],
                                  ),
                                  ShowText(
                                    title:
                                        DocText.showditems[index]["subtitle"],
                                    textStyle: MyTextstyle.b2DarkGrey(),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 64,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color:
                                        DocText.showditems[index]["badge"] !=
                                            null
                                        ? MyConstant.bgDarkGrey
                                        : null,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Center(
                                    child:
                                        DocText.showditems[index]["badge"] !=
                                            null
                                        ? ShowText(
                                            title: DocText
                                                .showditems[index]["badge"],
                                            textStyle:
                                                MyTextstyle.b2WhiteBold(),
                                          )
                                        : null,
                                  ),
                                ),
                                ShowText(
                                  title: DocText.showditems[index]["time"],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        ShowText(title: 'ทบทวนสิทธิ์'),
      ],
    );
  }

  Column reportResult(BuildContext context, Size size) {
    return Column(
      children: [
        SizedBox(
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
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(DocText.showditems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: GestureDetector(
                      onTap: () => ShowDialog.showInformationItem(
                        context,
                        size,
                        DocText.showditems[index]["title"],
                        '',
                        200,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 72,
                        decoration: BoxDecoration(
                          color: MyConstant.bgWhite,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                DocText.showditems[index]["dotColor"],
                              ),
                              offset: Offset(0, -4),
                            ),
                            BoxShadow(
                              color: MyConstant.bgDarkGrey,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                // width: 40.0,
                                child: CircleAvatar(
                                  backgroundColor: Color(
                                    DocText.showditems[index]["statusColor"],
                                  ),
                                  radius: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ShowText(
                                    title: DocText.showditems[index]["title"],
                                  ),
                                  ShowText(
                                    title:
                                        DocText.showditems[index]["subtitle"],
                                    textStyle: MyTextstyle.b2DarkGrey(),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 64,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color:
                                        DocText.showditems[index]["badge"] !=
                                            null
                                        ? MyConstant.bgDarkGrey
                                        : null,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Center(
                                    child:
                                        DocText.showditems[index]["badge"] !=
                                            null
                                        ? ShowText(
                                            title: DocText
                                                .showditems[index]["badge"],
                                            textStyle:
                                                MyTextstyle.b2WhiteBold(),
                                          )
                                        : null,
                                  ),
                                ),
                                ShowText(
                                  title: DocText.showditems[index]["time"],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        ShowText(title: 'รายงานผล'),
      ],
    );
  }

  Column validateResult(BuildContext context, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
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
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(DocText.showditems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: GestureDetector(
                      onTap: () => ShowDialog.showInformationItem(
                        context,
                        size,
                        DocText.showditems[index]["title"],
                        '',
                        200,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 72,
                        decoration: BoxDecoration(
                          color: MyConstant.bgWhite,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(
                                DocText.showditems[index]["dotColor"],
                              ),
                              offset: Offset(0, -4),
                            ),
                            BoxShadow(
                              color: MyConstant.bgDarkGrey,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                // width: 40.0,
                                child: CircleAvatar(
                                  backgroundColor: Color(
                                    DocText.showditems[index]["statusColor"],
                                  ),
                                  radius: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ShowText(
                                    title: DocText.showditems[index]["title"],
                                  ),
                                  ShowText(
                                    title:
                                        DocText.showditems[index]["subtitle"],
                                    textStyle: MyTextstyle.b2DarkGrey(),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 64,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color:
                                        DocText.showditems[index]["badge"] !=
                                            null
                                        ? MyConstant.bgDarkGrey
                                        : null,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Center(
                                    child:
                                        DocText.showditems[index]["badge"] !=
                                            null
                                        ? ShowText(
                                            title: DocText
                                                .showditems[index]["badge"],
                                            textStyle:
                                                MyTextstyle.b2WhiteBold(),
                                          )
                                        : null,
                                  ),
                                ),
                                ShowText(
                                  title: DocText.showditems[index]["time"],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        ShowText(title: 'ตรวจสอบผล'),
      ],
    );
  }
}
