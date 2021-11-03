import 'package:flutter/material.dart';

class HomeState extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeState> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  bool clickedCentreFAB = false; 
  int selectedIndex = 0; 
  String text = "Home";


  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hora do Remédio'),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushNamed(context, '/primeira');
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {});
        },
        children: <Widget>[
          Container(
              child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        "Nome: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.black),
                      )
                    ]),
                    Row(children: <Widget>[
                      Text(
                        " Joao da Silva ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.black),
                      )
                    ]),
                  ],
                ),
              ),
            ],
          )),
          Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                          child: Center(
                              child: Text("Segunda feira",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23)))),
                      Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5.0),
                          child: Column(
                            children: <Widget>[
                              Text("Cloroquina",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.yellow)),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Text(
                                        "Dias da semana: ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      )
                                    ]),
                                    Row(children: <Widget>[
                                      Text(
                                        "Horário: ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      )
                                    ]),
                                    Row(children: <Widget>[
                                      Column(children: <Widget>[
                                        Text(
                                          "Já tomou o remédio hoje? ",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ]),
                                      Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.check_box,
                                            color: Colors.green,
                                            size: 17,
                                          )
                                        ],
                                      )
                                    ]),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        color: Colors.purple[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Column(
                    children: <Widget>[
                      Text("Cloroquina",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text(
                                "Médico que prescritor: ",
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              )
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Função: ",
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              )
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Validade: ",
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              )
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: Colors.purple[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          )),
          Container(
              //color: Colors.pink,
              ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked,
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
                  updateTabSelection(0);
                  _pageController.animateToPage(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? Colors.yellow[600] : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1);
                  _pageController.animateToPage(1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.calendar_today,
                  color: selectedIndex == 1 ? Colors.yellow[600] : Colors.white,
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2);
                  _pageController.animateToPage(2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.medication_rounded,
                  color: selectedIndex == 2 ? Colors.yellow[600] : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3);
                  _pageController.animateToPage(3,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.info_rounded,
                  color: selectedIndex == 3 ? Colors.yellow[600] : Colors.white,
                ),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.purple[800],
      ),
    );
  }
}
