import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CopyRightData extends StatelessWidget {
  const CopyRightData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: 'Data provided by: ',
            style: Theme.of(context).textTheme.subtitle2,
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  pressedOpacity: .8,
                  onPressed: () {},
                  child: Text('MetaWeather',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
