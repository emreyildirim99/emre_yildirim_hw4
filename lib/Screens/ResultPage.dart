import 'package:flutter/material.dart';
import 'package:emre_yildirim_hw4/Screens/HomePage.dart';

void gotoHomePage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}

class ResultPage extends StatefulWidget {
  int score;
  int totalPoint;
  ResultPage({Key key, this.score, this.totalPoint}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: Colors.blue[650],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: (widget.score>=(widget.totalPoint)/2)
              ? AssetImage("assets/winBackground.png")
              : AssetImage("assets/background.png"),
              fit: BoxFit.cover ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: (widget.score>=(widget.totalPoint)/2)
                    ? Text(
                  'Congrats. You won! :)',
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                  ),
                )
               : Text(
                  'Sorry. You lost! :(',
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nexa',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              width: 150,
              height: 150 ,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: (widget.score>=(widget.totalPoint)/2)
                    ? AssetImage('assets/win.png')
                    : AssetImage('assets/lost.png'),
                    fit: BoxFit.fill ),
              ),
            ),
            Divider(
              color: Colors.white,
              height: 45.0,
            ),
             Center(child: Text(
              'Your score: ${widget.score}/${widget.totalPoint}',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nexa',
                color: Colors.white,
              ),
            ),
            ),
            SizedBox(height: 25.0,),
            RaisedButton(
              onPressed: () {gotoHomePage(context);},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFE57C00),
                      Color(0xFFEF6C00),
                      Color(0xFFE65100),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('Go to Home Page', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
