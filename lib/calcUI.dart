// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';

class calcUI extends StatefulWidget {
  const calcUI({Key? key}) : super(key: key);

  @override
  State<calcUI> createState() => _calcUIState();
}

class _calcUIState extends State<calcUI> {
  List button = [
    'AC',
    'DEL',
    '(',
    ')',

    '7',
    '8',
    '9',
    '+',

    '4',
    '5',
    '6',
    '*',

    '1',
    '2',
    '3',
    '-',

    '0',
    '.',
    '=',
    '/',
  ];
  bool enableDark = false;
  String ans = '0';
  String val = '';
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          backgroundColor: enableDark?Theme.of(context).accentColor:Theme.of(context).primaryColor,
          body: Column(
            children: [
              Container(
                width: w,
                height: h*0.28,
                color: enableDark?Theme.of(context).accentColor:Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5,top: 10,right: 5),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ToggleSwitch(
                                  iconSize: 22,
                                    initialLabelIndex: 0,
                                    activeFgColor: enableDark?Color(0xff6b6f77):Theme.of(context).accentColor,
                                    inactiveFgColor: enableDark?Theme.of(context).primaryColor:Color(0xffdddddd),
                                    activeBgColors: [
                                      [enableDark?Color(0xff2a2d37):Color(0xfff4f1f2),],
                                      [enableDark?Color(0xfff4f1f2):Color(0xff2a2d37),],
                                    ],
                                    inactiveBgColor: enableDark?Color(0xff2a2d37):Color(0xfff4f1f2),
                                    minHeight: 30,
                                    minWidth: 40,
                                    totalSwitches: 2,
                                onToggle: (index){
                                    setState(() {
                                      if(index==0)
                                        enableDark=false;
                                      else
                                        enableDark=true;
                                    });
                                },
                                  icons: [
                                    CupertinoIcons.sun_max,
                                    CupertinoIcons.moon,
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              '$val',
                              style: TextStyle(
                                color: enableDark
                                    ?Theme.of(context).primaryColor
                                    :Theme.of(context).accentColor,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '$ans',
                              style: TextStyle(
                                color: enableDark
                                    ?Theme.of(context).primaryColor
                                    :Theme.of(context).accentColor,
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: enableDark?Color(0xff2a2d37):Color(0xfff4f1f2),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: GridView.count(
                        crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 8,
                    children: [
                      for(String icon in button)
                        GestureDetector(
                          onTap: (){
                            valUpdate(icon);
                          },
                          child: Container(
                            width: w*0.05,
                            height: w*0.05,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: (icon=='AC'||icon=='DEL')?
                                    Colors.redAccent:
                                (icon=='+'||icon=='-'||icon=='*'||icon=='/'||icon=='=')?
                                    Colors.greenAccent:(icon=='('||icon==')')?Colors.blueAccent:
                                    enableDark?Theme.of(context).primaryColor:Theme.of(context).accentColor,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Text(
                                  icon,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: (icon=='AC'||icon=='DEL')?
                                    Colors.redAccent:
                                    (icon=='+'||icon=='-'||icon=='*'||icon=='/'||icon=='=')?
                                    Colors.greenAccent.shade400:
                                    (icon=='('||icon==')')?Colors.blueAccent:
                                    enableDark?Theme.of(context).primaryColor:
                                    Theme.of(context).accentColor,
                                  ),
                                ),
                            ),
                          ),
                        ),
                    ],
                    ),
                  ),),
            ],
          ),
    ),
    );
  }
  void valUpdate(String s){
    if(s=='0')
      val=val+'0';
    if(s=='1')
      val=val+'1';
    if(s=='2')
      val=val+'2';
    if(s=='3')
      val=val+'3';
    if(s=='4')
      val=val+'4';
    if(s=='5')
      val=val+'5';
    if(s=='6')
      val=val+'6';
    if(s=='7')
      val=val+'7';
    if(s=='8')
      val=val+'8';
    if(s=='9')
      val=val+'9';
    if(s=='+')
      val=val+'+';
    if(s=='-')
      val=val+'-';
    if(s=='*')
      val=val+'*';
    if(s=='/')
      val=val+'/';
    if(s=='AC')
      {
        val='';
        ans='0';
      }
    if(s=='DEL')
      {
        if(val=='')
          val='';
        else
          val=val.substring(0,val.length-1);
      }
    if(s==')')
      val=val+')';
    if(s=='(')
      val=val+'(';
    if(s=='.')
      val=val+'.';
    if(s=='=')
      {ans=calc(val);
        val='';
      }
    setState(() {

    });

  }
  String calc(String v){
    String modVal = v;
    Parser p = Parser();
    Expression e = p.parse(modVal);
    ContextModel cm = ContextModel();
    num eval = e.evaluate(EvaluationType.REAL, cm);
    String a = eval.toString();
    return a.length>20?eval.toStringAsPrecision(10):a;
  }
}
