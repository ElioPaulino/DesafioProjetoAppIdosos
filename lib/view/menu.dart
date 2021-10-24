import 'package:flutter/material.dart';

class HomeState extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeState> {
  bool clickedCentreFAB = false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex = 0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hora do Remédio'),
        backgroundColor: Colors.purple[800],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            //in this demo, only the button text is updated based on the bottom app bar clicks
            child: RaisedButton(
              child: Text(text),
              onPressed: () {},
            ),
          ),
          //this is the code for the widget container that comes from behind the floating action button (FAB)
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
              height:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width: clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                  color: Colors.purple[800]),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB; 
            Navigator.pushNamed(context, '/calendario');
          });
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.purple[800],
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  updateTabSelection(0, "print1");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0
                      ? Colors.yellow[600]
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "print2");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.calendar_today,
                  color: selectedIndex == 1
                      ? Colors.yellow[600]
                      : Colors.white,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2, "print3");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.medication_rounded,
                  color: selectedIndex == 2
                      ? Colors.yellow[600]
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, "print4");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.info_rounded,
                  color: selectedIndex == 3
                      ? Colors.yellow[600]
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.purple[800],
      ),
    );
  }
}