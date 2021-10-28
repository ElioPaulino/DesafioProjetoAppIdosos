import 'package:flutter/material.dart';

class HomeState extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeState> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  late PageController _pageController;
  int _page = 0;
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
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
      backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text(
            'Hora do Remédio',
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.purple[800],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerDocked, //specify the location of the FAB
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
        bottomNavigationBar: Theme(
        
          data: Theme.of(context).copyWith(
              canvasColor: Colors.purple[800],
              primaryColor: Colors.purple,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.white30))),
          child: BottomNavigationBar(
            elevation: 4.0,
              currentIndex: _page,
              onTap: (p) {
                _pageController.animateToPage(p,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              items: [
                BottomNavigationBarItem(
                  
                    icon: Icon(
                      Icons.home,
                      color: _page == 0 ? Colors.yellow[600] : Colors.white,
                    ),
                    // ignore: deprecated_member_use
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.yellow[600]),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.calendar_today,
                      color: _page == 1 ? Colors.yellow[600] : Colors.white,
                    ),
                    // ignore: deprecated_member_use
                    title: Text(
                      "Calendário",
                      style: TextStyle(color: Colors.yellow[600]),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.medication_rounded,
                      color: _page == 2 ? Colors.yellow[600] : Colors.white,
                    ),
                    // ignore: deprecated_member_use
                    title: Text(
                      "Remédios",
                      style: TextStyle(color: Colors.yellow[600]),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.info_rounded,
                      color: _page == 3 ? Colors.yellow[600] : Colors.white,
                    ),
                    // ignore: deprecated_member_use
                    title: Text(
                      "Informações",
                      style: TextStyle(color: Colors.yellow[600]),
                    )),
                /* BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today), title: Text("Agendamentos"))*/
              ]),
        ),
        body: SafeArea(
          
          child: PageView(
            
            controller: _pageController,
            onPageChanged: (p) {
              setState(() {
                _page = p;
              });
            },
            children: <Widget>[
              Container(
                color: Colors.black,
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
              ),
              Container(
                color: Colors.blue,
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
              ),
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
              ),
              Container(
                color: Colors.green,
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
              )
            ],
          ),
        ));
  }
}
