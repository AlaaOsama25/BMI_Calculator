import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.pink
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
int _Height = 178;
int _Weight = 70;
int _Age = 26;
bool _Color= false;
bool _Color2 = false;
late double _Result;
String? _Result2;
String? _Description;

void _Calculation(int h , int w) {
  _Result = (w / h / h)*10000;


  if(_Result>0 && _Result<18.5) {
    _Result2 = 'UNDERWEIGHT';
    _Description = '''
 Your BMI Indicates Your Weight is in The
 UnderWeight Category of Your Height.
 Weakness is an Undesirable Situation 
 that Poses a Risk to Some Diseases.''';
  }
  else if (_Result>=18.5 && _Result<=24.9) {
    _Result2 = 'NORMALWEIGHT';
    _Description = '''
 Your BMI Indicates Your Weight is in The
 Normal Category of Your Height. Take Care
 to Maintain this Weight by Eating Adequate
 and Balanced Nutrition and Regular 
 Physical Activity.''';
  }
  else if (_Result>=25 && _Result<=29.9 ) {
    _Result2 = 'OVERWEIGHT';
    _Description = '''
 Your BMI Indicates Your Weight is in The
 OverWeight Category of Your Height. 
 Being Over Weight Leads to Obesity, 
 Which is a Risk Factor for Many Diseases, 
 If Necessary Precautions are not Taken. ''';
  }
  else if (_Result>=30) {
    _Result2 = 'OBESITY';
    _Description = '''
 Your BMI Indicates Your Weight is in The
 Obese Category of Your Height. 
 Obesity, Cardiovascular Diseases,
 Hypertension etc. It is a Risk Factor
 for Chronic Diseases.''';
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          backgroundColor: Colors.black,
        ),
        body: Column(children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _Color2 = false;
                      _Color = true;
                    });
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Icon(
                          Icons.male,
                          color: _Color ? Colors.pink : Colors.white,
                          size: 75,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20),
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white10,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _Color = false;
                      _Color2 = true;
                    });
                  },
                  child: Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.female,
                            color: _Color2 ? Colors.pink : Colors.white,
                            size: 75,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 20),
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white10,
                      )),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: Container(
                    child: Column(
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '${_Height.toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                              Text(
                                'CM',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: 13),
                              )
                            ]
                        ),
                        Slider(
                            value: _Height.toDouble(),
                            min: 120,
                            max: 230,
                            onChanged: (double chagedheight)
                            {
                              setState(() {
                                _Height = chagedheight.round();
                              });
                            }
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white10,
                    )),
              ),
            ]),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${_Weight.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                      SizedBox(height: 10),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            child: (
                                Icon(Icons.remove,
                                  size: 30,
                                  color: Colors.white,
                                )
                            ),
                            onPressed: (){
                              setState(() {
                                if(_Weight>30)
                                  _Weight--;
                              });
                            },
                            fillColor: Colors.white24,
                            constraints: BoxConstraints.tightFor(
                                height: 42,
                                width: 46
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          SizedBox(width: 10,),
                          RawMaterialButton(
                            child: (
                                Icon(Icons.add_outlined,
                                  size: 30,
                                  color: Colors.white,
                                )
                            ),
                            onPressed: (){
                              setState(() {
                                if(_Weight<120)
                                  _Weight++;
                              });
                            },
                            fillColor: Colors.white24,
                            constraints: BoxConstraints.tightFor(
                                height: 42,
                                width: 46
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          )

                        ],)
                    ],
                  ),

                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white10,
                  ),
                ),
              ),

              Expanded(
                child: Container(
                    child: Column(
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${_Age.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              child: (
                                  Icon(Icons.remove,
                                    size: 30,
                                    color: Colors.white,
                                  )
                              ),
                              onPressed: (){
                                setState(() {
                                  if(_Age>5)
                                    _Age--;
                                });
                              },
                              fillColor: Colors.white24,
                              constraints: BoxConstraints.tightFor(
                                  height: 42,
                                  width: 46
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(width: 10,),
                            RawMaterialButton(
                              child: (
                                  Icon(Icons.add_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  )
                              ),
                              onPressed: (){
                                setState(() {
                                  if(_Age<100)
                                    _Age++;
                                });
                              },
                              fillColor: Colors.white24,
                              constraints: BoxConstraints.tightFor(
                                  height: 42,
                                  width: 46
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            )

                          ],)
                      ],
                    ),

                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white10,
                    )),
              ), // last one
            ]),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _MySecondPageState()),
              );
              setState(() {
                _Calculation(_Height, _Weight);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Center( child :(
                      Text('CALCULATE',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,

                        ),)
                  ),
                  ),
                  height: 75,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30),
                  )

              ),
            ),
          )
        ]));
  }
}
class _MySecondPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text('YOUR RESULT',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
            // ),
          ),
          Expanded(
            flex:10,
            child: Container(
                child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('$_Result2',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            )
                        ),
                        //SizedBox(height: 10,),
                        Text('${_Result.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('$_Description',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey,
                                    letterSpacing: 1
                                )
                            ),
                          ],
                        )
                      ]
                  ),
                ),
                width: double.infinity,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                )
            ),),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Center( child :(
                      Text('RECALCULATE',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),)),),
                  height: 75,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
