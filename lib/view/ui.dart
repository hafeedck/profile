import 'dart:io';
import 'package:flutter_application_11/controller/api.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/view/profilepage.dart';
import 'package:flutter_application_11/controller/provider.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  Apicall apiClass = Apicall();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
            //backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                exit(0);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.pink,
              ),
            ),
          ),
          body: FutureBuilder<List>(
              future: context.read<DataProvider>().datalist,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.red,
                            child: Column(children: [
                              GestureDetector(
                                  onTap: () async {
                                    context
                                        .read<DataProvider>()
                                        .updateCurrentUser(context, index);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const details(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      child: CircleAvatar(
                                          radius: 52.0,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 50.0,
                                            backgroundImage: NetworkImage(
                                                snapshot.data![index]
                                                        .profileImage ??
                                                    'null'),
                                          )))),
                              GestureDetector(
                                onTap: () async {
                                  context
                                      .read<DataProvider>()
                                      .updateCurrentUser(context, index);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const details(),
                                    ),
                                  );
                                },
                                child: Text(
                                  snapshot.data![index].name ?? 'null',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                              )
                            ]),
                          );
                        }),
                  );
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
              }));
    });
  }
}
