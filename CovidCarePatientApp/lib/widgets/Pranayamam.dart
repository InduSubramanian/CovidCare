import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import './PranayamamTextAnimation.dart';

class Pranayamam extends StatefulWidget {
  Pranayamam({Key key}) : super(key: key);

  @override
  _PranayamamState createState() => _PranayamamState();
}

class _PranayamamState extends State<Pranayamam> {
  final riveFileName = 'assets/breathing.riv';
  Artboard _artboard;
  bool _startAnimation;

  @override
  void initState() {
    _loadRiveFile();
    _startAnimation = false;
    super.initState();
  }

  // loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      setState(() {
        final artboard = file.mainArtboard;
        artboard.addController(SimpleAnimation('Animation 1'));
        _artboard = artboard;
      });
      // Select an animation by its name
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _startAnimation == false
        ? Container(
            child: Center(
              child: Container(
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color(0xfff05945),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(0, 2),
                        blurRadius: 1.2,
                      ),
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _startAnimation = true;
                      });
                    },
                    child: Text(
                      "Start Exercise",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          )
        : _artboard != null
            ? Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: const Color(0xfff05945),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(0, 2),
                                blurRadius: 1.2,
                              ),
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                _startAnimation = false;
                              });
                            },
                            child: Text(
                              "Finish",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Breather(),
                    ),
                    Container(
                      height: size.height * 0.4,
                      child: Rive(
                        artboard: _artboard,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                child: Text("Rive not working"),
              );
  }
}
