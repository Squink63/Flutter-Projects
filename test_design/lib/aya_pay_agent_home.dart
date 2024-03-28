import 'package:flutter/material.dart';

class AYAPayAgentHomePage extends StatefulWidget {
  const AYAPayAgentHomePage({super.key});

  @override
  State<AYAPayAgentHomePage> createState() => _AYAPayAgentHomePageState();
}

class _AYAPayAgentHomePageState extends State<AYAPayAgentHomePage> {
  bool isVisible = true;
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(148, 46, 43, 1.0),
        leading: Row(
          children: [
            Spacer(),
            Builder(
              builder: (context) {
                return InkWell(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset("assets/images/menu.png",
                    width: 30,
                    height: 30,
                    color: Colors.white
                  ),
                );
              }
            ),
          ],
        ),
        leadingWidth: 40,
        title: Text("AYAPay Agent",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),
        ),

        actions: [
          Row(
            children: [
              Icon(Icons.notification_important_outlined,
                color: Colors.white,
              ),

              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      ),
      drawer: Builder(
        builder: (context) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 170,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(148, 46, 43, 1.0)
                    ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.person,
                            size: 85,
                          ),

                          SizedBox(
                            width: 8,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Text("Agent One",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                                ),
                              ),
                              Text("09123456789",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,

                                ),
                              ),
                              Text("Balance: 300 MMK",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,

                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Notifications"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("App Settings"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text("Location"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.feedback),
                  title: const Text("Feedback"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.question_mark),
                  title: const Text("About"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Log Out"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text("Share App"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),

          BottomNavigationBarItem(
              icon: Image.asset("assets/images/tea-leaf.png",
                width: 5,
                height: 5,
              ), label: ""),

          BottomNavigationBarItem(
              icon: Icon(Icons.wallet), label: "Wallet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromRGBO(148, 46, 43, 1.0),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,
            horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(148, 46, 43, 1.0)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromRGBO(148, 46, 43, 1.0)
                          )
                        ),
                        child: Image.asset("assets/images/top-up.png",
                          width: 40,
                          height: 40,
                          color: Color.fromRGBO(148, 46, 43, 1.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromRGBO(148, 46, 43, 1.0)
                            )
                        ),
                        child: Image.asset("assets/images/arrow.png",
                          width: 40,
                          height: 40,
                          color: Color.fromRGBO(148, 46, 43, 1.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromRGBO(148, 46, 43, 1.0)
                            )
                        ),
                        child: Image.asset("assets/images/cash.png",
                          width: 40,
                          height: 40,
                          color: Color.fromRGBO(148, 46, 43, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("Manage",
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  isVisible = !isVisible;
                });
              },
                child: Icon(isVisible ? Icons.visibility : Icons.visibility_off)
            ),
          ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Balance",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Spacer(),
                Text(isVisible ? "3,323 MMK" : "*****",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Image.asset("assets/images/body.png",
              width: 350,
              height: 400,
            ),
          )

        ],
      ),
    );
  }
}
