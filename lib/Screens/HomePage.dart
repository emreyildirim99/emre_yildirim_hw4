import 'package:emre_yildirim_hw4/Screens/QuizPage.dart';
import 'package:flutter/material.dart';

void gotoQuizPage(BuildContext context, int categoryID, int qNumber, String difficulty) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => QuizPage(categoryID: categoryID,qNumber: qNumber,difficulty: difficulty)),
  );
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueCategoryClient;
  String valueDifficultyClient;
  String errorMessage = "Choose a Quiz";

  int valueCategory;
  int questionNumber;
  String valueDifficulty;

  List categoryList = ["Sports","History","Books","Computers","Geography"];
  List qNumberList = [5,10,15,20,25,30];
  List difficultyList = ["Easy","Medium","Hard"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cet Quiz - Emre YILDIRIM'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.blue[650],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"),
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
              child: Text(
                'Welcome to Cet Quiz',
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Nexa',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      Container(
        width: 390,
      height: 220 ,
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/quizheader2.png'),
          fit: BoxFit.fill ),
    ),
      ),
          Divider(
            color: Colors.white,
            height: 29.0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(errorMessage,style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Nexa',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          ),
          SizedBox(height: 5.0,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.only(left:16,right:16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Center(
                    child: Text('Select Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  dropdownColor: Colors.blue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 35,
                  iconEnabledColor: Colors.black,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  value: valueCategoryClient,
                  onChanged: (newValue){
                    setState(() {

                      valueCategoryClient = newValue;

                      if(newValue == 'Sports'){

                        valueCategory = 21;

                      }else if(newValue == 'History'){

                        valueCategory = 23;
                      }else if(newValue == 'Books'){

                        valueCategory = 10;

                      }else if(newValue == 'Computers'){

                        valueCategory = 18;

                      }else if(newValue == 'Geography'){

                        valueCategory = 22;
                      }

                    });
                    print(valueCategory);
                  },
                  items: categoryList.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Center(child: Text(valueItem, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.only(left:16,right:16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Center(
                    child: Text('Select Number of Questions',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  dropdownColor: Colors.blue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 35,
                  iconEnabledColor: Colors.black,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  value: questionNumber,
                  onChanged: (newValue){
                    setState(() { questionNumber = newValue; });
                    print(questionNumber);
                  },
                  items: qNumberList.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Center(child: Text(valueItem.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.only(left:16,right:16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Center(
                    child: Text('Select Difficulty',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  dropdownColor: Colors.blue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 35,
                  iconEnabledColor: Colors.black,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  value: valueDifficultyClient,
                  onChanged: (newValue){
                    setState(() {
                      valueDifficultyClient = newValue;
                      valueDifficulty = newValue.toLowerCase();
                    });
                    print(valueDifficulty);
                  },
                  items: difficultyList.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Center(child: Text(valueItem, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            onPressed: () {
              if(valueCategory == null || questionNumber == null || valueDifficulty == null){

                setState(() {
                  errorMessage = "Please fill all the areas!";
                });

              }else{

                gotoQuizPage(context,valueCategory,questionNumber,valueDifficulty);
              }
              },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
              const Text('Start Quiz', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
      ),
    );
  }
}