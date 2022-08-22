import 'package:flutter/material.dart';
import 'package:flutter_application_11/view/ui.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_11/controller/provider.dart';
import 'package:maps_launcher/maps_launcher.dart';

// ignore: camel_case_types
class details extends StatefulWidget {
  const details({
    Key? key,
  }) : super(key: key);
  @override
  State<details> createState() => _detailsState();
}

// ignore: camel_case_types
class _detailsState extends State<details> {
  @override
  Widget build(
    BuildContext context,
  ) {
    // return Consumer(builder: (context, provider, child) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(this.context).pushReplacement(MaterialPageRoute(
                  builder: (
                BuildContext context,
              ) =>
                      const profile()));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Color.fromARGB(255, 214, 23, 23),
            ),
          ),
          title:
              (Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
            Text(
              'Profile',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ])),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: FutureBuilder<List>(
                future: context.read<DataProvider>().datalist,
                builder: (
                  context,
                  snapshot,
                ) {
                  if (snapshot.hasData) {
                    return Container(
                        padding: const EdgeInsets.only(top: 5),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 165,
                                    height: 222,
                                    child: Card(
                                        color: const Color.fromRGBO(
                                            253, 237, 235, 1),
                                        child: Column(children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: Align(
                                                  child: CircleAvatar(
                                                      radius: 52.0,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: CircleAvatar(
                                                        radius: 50.0,
                                                        backgroundImage: NetworkImage(snapshot
                                                                .data![context
                                                                    .read<
                                                                        DataProvider>()
                                                                    .currentUser]
                                                                .profileImage ??
                                                            'null'),
                                                      )))),
                                          SizedBox(
                                            height: 92,
                                            child: Align(
                                              child: Text(
                                                snapshot
                                                        .data![context
                                                            .read<
                                                                DataProvider>()
                                                            .currentUser]
                                                        .name ??
                                                    'null',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          )
                                        ]))),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "ID:${snapshot.data![context.read<DataProvider>().currentUser].id ?? 'null'}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.5),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "User Name:${snapshot.data![context.read<DataProvider>().currentUser].username ?? 'null'}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.5),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Email:${snapshot.data![context.read<DataProvider>().currentUser].email ?? 'null'}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.5 *
                                                  MediaQuery.textScaleFactorOf(
                                                      context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          // alignment: TableCellVerticalAlignment.baseline,
                                          child: Text(
                                            "Phone:${snapshot.data![context.read<DataProvider>().currentUser].phone ?? 'null'}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.5),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          // alignment: TableCellVerticalAlignment.baseline,
                                          child: Text(
                                            "website:${snapshot.data![context.read<DataProvider>().currentUser].website ?? 'null'}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.5),
                                          ),
                                        ),
                                      ),
                                    ])
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          const TextSpan(
                                            text: 'Company',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  "${snapshot.data![context.read<DataProvider>().currentUser].company ?? 'null'}",
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.purple)),
                                        ]))),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          const TextSpan(
                                            text: 'Name:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  '${snapshot.data![context.read<DataProvider>().currentUser].name ?? 'null'}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black)),
                                        ]))),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          const TextSpan(
                                            text: 'Catch phrase:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  '${snapshot.data![context.read<DataProvider>().currentUser].company.catchPhrase ?? 'null'}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black)),
                                        ]))),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          const TextSpan(
                                            text: 'Bs:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  '${snapshot.data![context.read<DataProvider>().currentUser].company.bs ?? 'null'}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black)),
                                        ]))),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          const TextSpan(
                                            text: 'Address:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  '${snapshot.data![context.read<DataProvider>().currentUser].address.street ?? 'null'},${snapshot.data![context.read<DataProvider>().currentUser].address.suite ?? 'null'},${snapshot.data![context.read<DataProvider>().currentUser].address.city ?? 'null'},${snapshot.data![context.read<DataProvider>().currentUser].address.zipcode ?? 'null'},${snapshot.data![context.read<DataProvider>().currentUser].address.street ?? 'null'}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black)),
                                        ]))),
                                  ),
                                  InkWell(
                                      child: Container(
                                        width: 380,
                                        height: 100,
                                        alignment: Alignment.center,
                                        child:
                                            Image.asset('image/download.jpg'),
                                      ),
                                      onTap: () {
                                        MapsLauncher.launchCoordinates(
                                          double.parse(snapshot
                                                  .data![context
                                                      .read<DataProvider>()
                                                      .currentUser]
                                                  .address
                                                  .geo
                                                  .lat ??
                                              ''),
                                          double.parse(snapshot
                                                  .data![context
                                                      .read<DataProvider>()
                                                      .currentUser]
                                                  .address
                                                  .geo
                                                  .lng ??
                                              ''),
                                        );
                                      }),
                                ],
                              ),
                            )
                          ],
                        ));
                  } else {
                    return Container(
                        margin: const EdgeInsets.only(bottom: 80.0),
                        child: const Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red)),
                        ));
                  }
                })));
    //});
  }
}
