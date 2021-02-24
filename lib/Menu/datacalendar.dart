import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salooni/Agendamento/detalhe.dart';
import 'package:salooni/Calendario/ProcedimentoDia.dart';
import 'package:table_calendar/table_calendar.dart';

class dataCalendar extends StatefulWidget {
  @override
  _dataCalendarState createState() => _dataCalendarState();
}

class _dataCalendarState extends State<dataCalendar> {
  CalendarController _calendarController;

  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xFF7697ce), fontWeight: fontWeight);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _calendarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _alturaTela = MediaQuery.of(context).size.height;
    double _LarguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFededed),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, _alturaTela * 0.09, 0, 0),
                child: Text(
                  "Calendário",
                  style: TextStyle(
                      color: Color(0xFF7697ce),
                      fontSize: _alturaTela * 0.04,
                      fontFamily: "Generic"),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal)),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                      color: Color(0xFF7697ce),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  weekendStyle: TextStyle(
                      color: Color(0xFF7697ce),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: Color(0xFF7697ce),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Color(0xFF7697ce),
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Color(0xFF7697ce),
                  ),
                ),
                calendarController: _calendarController,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    color: Color(0xFF7697ce),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text("Agenda",
                              style: TextStyle(
                                color: Color(0xFFededed),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                                textAlign: TextAlign.center
                            )),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF575ba8)),
                              borderRadius: BorderRadius.circular(30.0)),

                          child: Column(
                            children: <Widget>[
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _LarguraTela * 0.04,
                                      _alturaTela * 0.02,
                                      _LarguraTela * 0.4,
                                      _alturaTela * 0.02),
                                  child: Text("Cliente",
                                      style: TextStyle(
                                          color: Color(0xFFededed),
                                          fontSize: _LarguraTela * 0.04)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      _alturaTela * 0.02,
                                      0,
                                      _alturaTela * 0.02),
                                  child: Text("Claudia dos Santos",
                                      style: TextStyle(
                                          color: Color(0xFF0f0f0f),
                                          fontSize: _LarguraTela * 0.04)),
                                )
                              ]),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _LarguraTela * 0.04,
                                      _alturaTela * 0.01,
                                      _LarguraTela * 0.34,
                                      _alturaTela * 0.02),
                                  child: Text("Especialista",
                                      style: TextStyle(
                                          color: Color(0xFFededed),
                                          fontSize: _LarguraTela * 0.04)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      _alturaTela * 0.01,
                                      0,
                                      _alturaTela * 0.02),
                                  child: Text("Maria dos Santos ",
                                      style: TextStyle(
                                          color: Color(0xFF0f0f0f),
                                          fontSize: _LarguraTela * 0.04)),
                                )
                              ]),
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _LarguraTela * 0.04,
                                      _alturaTela * 0.01,
                                      0,
                                      _alturaTela * 0.02),
                                  child: Text("Horario",
                                      style: TextStyle(
                                          color: Color(0xFFededed),
                                          fontSize: _LarguraTela * 0.04)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _LarguraTela * 0.04,
                                      _alturaTela * 0.01,
                                      _LarguraTela * 0.3,
                                      _alturaTela * 0.02),
                                  child: Text("10:30",
                                      style: TextStyle(
                                          color: Color(0xFF0f0f0f),
                                          fontSize: _LarguraTela * 0.04)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      _LarguraTela * 0.04,
                                      _alturaTela * 0.01,
                                      0,
                                      _alturaTela * 0.02),
                                  child: Container(
                                    height: _alturaTela * 0.04,
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => detalhe()));
                                      },
                                      child: Text(
                                        "Detalhes",
                                        style: TextStyle(
                                            color: Color(0xFF0f0f0f),
                                            fontSize: _LarguraTela * 0.03),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                              color: Color(0xFFededed))),
                                      color: Color(0xFFededed),
                                      //color: Color(0xFF9977ae),
                                    ),
                                  ),
                                )
                              ]),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              _LarguraTela * 0.6, _alturaTela * 0.01, 0, 0),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ProcedimentoDia()));

                            },
                            child: Text(
                              "Mostrar mais",
                              style: TextStyle(
                                color: Color(0xFFededed),
                                fontFamily: "SaniTrixieSans",
                                fontSize: _LarguraTela * 0.05,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
