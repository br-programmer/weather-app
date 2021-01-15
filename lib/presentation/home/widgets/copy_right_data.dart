import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/data/data_constants.dart';
import 'package:weather/domain/exception/api_exception.dart';

class CopyRightData extends StatelessWidget {
  const CopyRightData({Key key}) : super(key: key);

  Future<void> _launch() async {
    if (await canLaunch(server)) {
      await launch(server);
    } else {
      throw ApiException(code: 404, text: 'Could not launch $server');
    }
  }

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
                  onPressed: _launch,
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
