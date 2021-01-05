import 'package:fai_kul/core/utils/input_converter.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/widgets/component/fee_count.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/widgets/component/hearder.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = new NumberFormat("#,###");

class FeeListView extends StatefulWidget {
  final List<FeeSwagger> fee;

  const FeeListView({Key key, this.fee}) : super(key: key);

  @override
  _FeeListViewState createState() => _FeeListViewState();
}

class _FeeListViewState extends State<FeeListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScrollController _controller = new ScrollController();
    return Column(
      children: [
        SizedBox(height: 10),
        FeeHeader(
          feeSwagger: widget.fee[0],
        ),
        Container(
            margin: EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: _buildListItemsFromitems(),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
            )),
      ],
    );
  }

  List<Container> _buildListItemsFromitems() {
    List<Container> list = widget.fee.map((item) {
      var container = Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 50),
              blurRadius: 20,
              color: kActiveShadowColor,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.fromLTRB(20,10,15,0),
                      child: new Text(
                        '${item.data.length > 0? item.data[0].tuition.description:""}',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.fromLTRB(20,5,15,5),
                      child: Text(
                        'Số tiền: ${item.data.length > 0? formatter.format(item.data[0].tuition.price):""}đ',
                        style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: Colors.black),
                      ),

                    ),
                    new Container(
                      padding: const EdgeInsets.fromLTRB(15,5,15,5),
                      child: Row(
                        children: [
                          Text(
                            'Trạng thái: ',
                            style: new TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                          Text(
                            '${item.data.length > 0? item.data[0].paymentStatus == 1?"Đã đóng":"Chưa đóng":""}',
                            style: new TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                                color: item.data.length > 0? item.data[0].paymentStatus == 1?Colors.green:Colors.red:Colors.black),
                          ),
                        ],
                      )

                    )
                  ],
                ),
                SizedBox(height: 5,),
              ],
            )
          ],
        ),
      );
      return container;
    }).toList();
    
    return list;
  }
}
