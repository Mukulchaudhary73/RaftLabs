import 'package:flutter/material.dart';
import 'package:raftlabs/models/apiModel.dart';
import 'package:raftlabs/utils/api.dart';
import 'package:raftlabs/utils/customWidgets.dart';

class FetchDataPage extends StatelessWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(
      height: 10,
    );
    TextEditingController _searchBarController = TextEditingController();
    String toBeSearched = "";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Data'),
      ),
      body: FutureBuilder(
        future: API().getApiDataFunc(),
        builder: (context, data) {
          if (data.hasError) {
            return const Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                    child:
                        Text("Oops. Something went wrong. Try again later!")));
          } else if (data.hasData) {
            var incomingDataObjects = data.data as List<SampleApi>;
            return Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  /*
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 124, 205, 116).withOpacity(.38),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 50,
                    child: TextFormField(
                      controller: _searchBarController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20, top: 8),
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: "Search..",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),*/
                  Expanded(
                    child: ListView.builder(
                      itemCount: incomingDataObjects.length,
                      itemBuilder: ((context, index) {
                        final object = incomingDataObjects[index];
                        final apiName = object.api;
                        final desc = object.description;
                        final cors = object.cors;
                        final https = object.https;
                        final auth = object.auth;
                        final link = object.link;
                        final category = object.category;
                        var num = index + 1;

                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                nameText: "$num. API Name",
                              ),
                              box,
                              CustomFormFieldWidget(
                                hintText: apiName.toString(),
                              ),
                              box,
                              CustomText(
                                nameText: "Description",
                              ),
                              box,
                              CustomFormFieldWidget(
                                hintText: desc.toString(),
                              ),
                              box,
                              CustomText(
                                nameText: "Link",
                              ),
                              box,
                              CustomFormFieldWidget(
                                hintText: link.toString(),
                              ),
                              box,
                              CustomText(
                                nameText: "Category",
                              ),
                              box,
                              CustomFormFieldWidget(
                                hintText: category.toString(),
                              ),
                              box,
                              CustomText(
                                nameText: "Cors",
                              ),
                              box,
                              CustomFormFieldWidget(
                                hintText: cors.toString(),
                              ),
                              box,
                              CustomText(
                                nameText: "Auth",
                              ),
                              box,
                              CustomFormFieldWidget(
                                hintText: auth.toString(),
                              ),
                              box,
                              CustomText(
                                nameText: "HTTPS",
                              ),
                              box,
                              CustomFormFieldWidget(
                                hintText: https.toString(),
                              ),
                              box,
                              const Center(
                                  child: Text(
                                "*********************",
                                style: TextStyle(color: Colors.green),
                              )),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        );
                      }),
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
        },
      ),
    );
  }
}
