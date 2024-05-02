import 'package:flutter/material.dart';
import 'package:main_test/controller/homescreen_controller.dart';
import 'package:main_test/view/addscreen/addscreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<Homescreencontroller>(context, listen: false).fetchData();
  }

  deleteData(int id) async {
    await Provider.of<Homescreencontroller>(context, listen: false)
        .deleteData(id);
    // to refetch
    await fetchData();
  }

  // addData() async {
  //   await Provider.of<Homescreencontroller>(context, listen: false).addData();
  //   // to refetch
  //   await fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    final homescreenstate = Provider.of<Homescreencontroller>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: homescreenstate.resmodel?.data!.employee?.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    homescreenstate.resmodel?.data?.employee?[index].id
                            .toString() ??
                        "",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    homescreenstate.resmodel?.data?.employee?[index].name ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    homescreenstate.resmodel?.data?.employee?[index].role ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 239, 46, 12)),
                  ),
                  IconButton(
                      onPressed: () {
                        deleteData(homescreenstate
                                .resmodel?.data?.employee?[index].id ??
                            -1);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDataScreen(),
              ));
          // await addData();
        },
      ),
    );
  }
}
