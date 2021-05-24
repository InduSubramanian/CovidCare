import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef void RadioInputCallback(int radioValue);

class RadioInput extends StatefulWidget {
  final RadioInputCallback onRadioValChanged;
  final int length;
  final List label;

  const RadioInput({
    Key key,
    @required this.length,
    @required this.label,
    @required this.onRadioValChanged,
  }) : super(key: key);

  @override
  _RadioInputState createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  var _radioVal;
  @override
  void initState() {
    super.initState();
    _radioVal = 1;
  }

  void _handleRadioVal(value) {
    setState(() {
      _radioVal = value;
    });
    widget.onRadioValChanged(_radioVal);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.2,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: size.width * 0.25,
                  child: Row(
                    children: [
                      Radio(
                        value: index,
                        groupValue: _radioVal,
                        onChanged: (val) => _handleRadioVal(val),
                      ),
                      Text(
                        widget.label[index],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
