import 'package:flutter/material.dart';

typedef void QuizQnCallback(int q);

class QuizQn extends StatefulWidget {
  final QuizQnCallback onOptionChanged;
  final question;
  final String opt1, opt2, opt3, opt4;
  QuizQn(
      {Key key,
      @required this.opt1,
      @required this.opt2,
      @required this.opt3,
      @required this.opt4,
      @required this.question,
      @required this.onOptionChanged})
      : super(key: key);

  @override
  _QuizQnState createState() => _QuizQnState();
}

class _QuizQnState extends State<QuizQn> {
  int _q;
  // @override
  // void initState() {
  //   super.initState();

  // }

  void _handleAnswer(val) {
    setState(() {
      _q = val;
    });
    widget.onOptionChanged(val);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.07),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.question,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          height: size.height * 0.05,
          child: RadioListTile(
            value: 1,
            title: Text(
              widget.opt1,
              style: TextStyle(fontSize: 14),
            ),
            groupValue: _q,
            onChanged: (val) => _handleAnswer(val),
          ),
        ),
        Container(
          height: size.height * 0.05,
          child: RadioListTile(
            value: 2,
            title: Text(
              widget.opt2,
              style: TextStyle(fontSize: 14),
            ),
            groupValue: _q,
            onChanged: (val) => _handleAnswer(val),
          ),
        ),
        Container(
          height: size.height * 0.05,
          child: RadioListTile(
            value: 3,
            title: Text(
              widget.opt3,
              style: TextStyle(fontSize: 14),
            ),
            groupValue: _q,
            onChanged: (val) => _handleAnswer(val),
          ),
        ),
        Container(
          height: size.height * 0.05,
          child: RadioListTile(
            value: 4,
            title: Text(
              widget.opt4,
              style: TextStyle(fontSize: 14),
            ),
            groupValue: _q,
            onChanged: (val) => _handleAnswer(val),
          ),
        )
      ]),
    );
  }
}
