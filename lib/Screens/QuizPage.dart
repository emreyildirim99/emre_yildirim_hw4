import 'package:emre_yildirim_hw4/Screens/ResultPage.dart';
import 'package:emre_yildirim_hw4/Service/Question.dart';
import 'package:emre_yildirim_hw4/Service/QuizManager.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final int categoryID;
  final int qNumber;
  final String difficulty;


  const QuizPage({Key key, this.categoryID, this.qNumber,this.difficulty}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  QuizManager _manager = new QuizManager();
  Future<void> quizloader;


  List<Widget> getOptions(Question question) {
    List<Widget> optionButtons = [];
    for (int i = 0; i < question.options.length; i++) {
      optionButtons.add(FlatButton(
        onPressed: () {
          _manager.nextQuestion(_manager.getCurrentQuestion().options[i].score);
          if (_manager.isFinished()) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ResultPage(
                      score: _manager.getTotalScore(),
                      totalPoint: _manager.totalQuestionNumber()*10
                    )));
          }
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child:Text(
              '${_manager.getCurrentQuestion().options[i].text}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ));
    }
    return optionButtons;
  }

  @override
  void initState(){
    super.initState();
    quizloader = _manager.LoadQuestions(widget.categoryID,widget.qNumber,widget.difficulty);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[650],
          title: FutureBuilder<void>(
            future: quizloader,
            builder: (BuildContext context, AsyncSnapshot<void> snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return Text('Questions ${_manager.getCurrentId()}/${_manager.totalQuestionNumber()}');
              }else{

                return Center(child: CircularProgressIndicator());

              }
            },
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: FutureBuilder<void>(
          future: quizloader,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot){
            if(snapshot.connectionState == ConnectionState.done){

             return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover ),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Center(
                          child: Text(
                            '${_manager.getCurrentQuestion().text}',
                            style: TextStyle(
                              fontSize: 19.0,
                              fontFamily: 'Co-Text',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: getOptions(_manager.getCurrentQuestion()),
                        ),
                      ),
                    )
                  ],
                ),
              );

            }else{

              return Center(child: CircularProgressIndicator());

            }
          },
        ),
    );
  }
}
