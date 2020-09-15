import 'package:flutter/cupertino.dart';
import 'package:calc_speed/page/search/widget/MyselfContainer.dart';
import 'package:calc_speed/page/search/widget/OpponentContainer.dart';
import 'package:calc_speed/page/search/widget/ResultContainer.dart';

class SearchTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        OpponentContainer(),
        ResultContainer(),
        MyselfContainer(),
      ],
    ));
  }
}
