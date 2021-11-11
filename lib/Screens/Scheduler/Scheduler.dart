import 'package:desktop_app/Screens/release%20groups/release_groups.dart';
import 'package:desktop_app/components/bots.dart';
import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/profile.dart';
import 'package:desktop_app/components/status.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/header.dart';
import 'package:desktop_app/components/header.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event.dart';

class Scheduler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          StatusPanel(),
          Container(
            width: size.width - 350,
            height: size.height,
            decoration: BoxDecoration(color: bgColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Column(
                  children: [
                    Container(
                      width: size.width - 350,
                      margin: EdgeInsets.all(10),
                      child: Header(title: 'Scheduler'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: size.width - 350,
                      height: size.height - 236,
                      child: Center(child: SchedulerScreen()),
                    ),
                    Container(
                      width: size.width - 350,
                      height: 150,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SchedulerScreen extends StatefulWidget {
  @override
  _SchedulerScreenState createState() => _SchedulerScreenState();
}

class _SchedulerScreenState extends State<SchedulerScreen> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDate = DateTime.now();

  DateTime todayDate = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  TextEditingController _eventControllerDate = TextEditingController();
  String valueChoosen;

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height - 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width / 1.9,
              height: size.height / 1.6,
              decoration: BoxDecoration(
                color: bg3Color,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: secondaryColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 4.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  ),
                ],
              ),
              child: TableCalendar(
                focusedDay: selectedDate,
                firstDay: DateTime(2020),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDate = selectDay;
                    selectedDate = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDate, date);
                },
                eventLoader: _getEventsfromDay,
                calendarStyle: CalendarStyle(
                  defaultTextStyle: GoogleFonts.inter(color: Colors.white),
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  selectedTextStyle: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  todayDecoration: BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                headerStyle: HeaderStyle(
                  titleTextStyle: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  titleCentered: true,
                  formatButtonDecoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  formatButtonTextStyle: GoogleFonts.inter(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Spacer(flex: 2),
            Container(
              width: MediaQuery.of(context).size.width / 4.4,
              height: MediaQuery.of(context).size.height / 1.6,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate == todayDate
                            ? ' Today '
                            : (selectedDate.month.toString() +
                                '-' +
                                selectedDate.day.toString() +
                                '-' +
                                selectedDate.year.toString()),
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 4.4,
                        height: MediaQuery.of(context).size.height / 1.71,
                        decoration: BoxDecoration(
                          color: bg3Color,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: 1, color: secondaryColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 4.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ..._getEventsfromDay(selectedDate).map(
                              (Event event) => EventCard(event: event),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: side2Color,
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: secondaryColor),
                          ),
                          child: IconButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: secondaryColor,
                                title: Text(
                                  'Add Event',
                                  style: GoogleFonts.inter(color: Colors.white),
                                ),
                                content: Container(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      DropdownButton(
                                        dropdownColor: bg3Color,
                                        hint: Text('Choose Release Group'),
                                        value: valueChoosen,
                                        onChanged: (value) {
                                          setState(() {
                                            valueChoosen = value;
                                          });
                                        },
                                        items:
                                            releasegroupsList.map((valueItem) {
                                          return DropdownMenuItem(
                                            value: valueItem.title,
                                            child: Text('${valueItem.title}'),
                                          );
                                        }).toList(),
                                      ),
                                      TextFormField(
                                        controller: _eventControllerDate,
                                        decoration: new InputDecoration(
                                            hintText: 'Enter Event Time'),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      if (_eventControllerDate.text.isEmpty) {
                                      } else {
                                        if (selectedEvents[selectedDate] !=
                                            null) {
                                          selectedEvents[selectedDate].add(
                                              Event(selectedDate, valueChoosen,
                                                  _eventControllerDate.text));
                                        } else {
                                          selectedEvents[selectedDate] = [
                                            Event(selectedDate, valueChoosen,
                                                _eventControllerDate.text)
                                          ];
                                        }
                                      }
                                      Navigator.pop(context);
                                      _eventController.clear();
                                      setState(() {});
                                      return;
                                    },
                                    child: Text(
                                      'OK',
                                      style: GoogleFonts.inter(
                                          color: Colors.white),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: GoogleFonts.inter(
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            icon: Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    this.event,
  }) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 55,
      width: MediaQuery.of(context).size.width / 4.5,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: secondaryColor),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: secondaryColor),
                image: DecorationImage(
                  image: AssetImage('assests/images/new_logo.png'),
                  fit: BoxFit.contain,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 8.5,
            child: Text(
              event.title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 26.5,
            child: Text(
              event.eventTime,
              style: GoogleFonts.inter(
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right_rounded,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
