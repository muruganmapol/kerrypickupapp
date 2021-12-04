// @dart=2.9
import 'package:flutter/material.dart';
import 'package:fml/pages/pickupgcninvoiceform.dart';
import 'package:fml/pages/pickupperson.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Pickupgcnform extends StatefulWidget {
  const Pickupgcnform({Key key}) : super(key: key);

  @override
  _PickupgcnformState createState() => _PickupgcnformState();
}

class _PickupgcnformState extends State<Pickupgcnform> {
  final timeController = TextEditingController();
  final timeController2 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 126, 61),
        centerTitle: true,
        title: const Text(
          "Pickup GCN Form",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orange[50],
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xff0d47a1),
                          child: IconButton(
                            icon: Icon(
                              Icons.description,
                            ),
                            iconSize: 20,
                            color: Colors.white,
                            splashColor: Colors.purple,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Pickupgcninvoiceform()),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFieldTags(
                            tagsStyler: TagsStyler(
                              tagTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              tagDecoration: BoxDecoration(
                                color: const Color.fromARGB(255, 6, 72, 172),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              tagCancelIcon: const Icon(Icons.cancel,
                                  size: 16.0,
                                  color: Color.fromARGB(255, 235, 214, 214)),
                              tagPadding: const EdgeInsets.all(10.0),
                            ),
                            textFieldStyler: TextFieldStyler(
                                helperText: '', hintText: 'Enter GCN'),
                            onTag: (tag) {},
                            onDelete: (tag) {},
                            validator: (tag) {
                              if (tag.length > 15) {
                                return "hey that's too long";
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          child: TextFormField(
                            readOnly: true,
                            controller: timeController2,
                            decoration: InputDecoration(
                              labelText: "GATE IN TIME",
                              hintText: "gate in time",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.timelapse),
                            ),
                            onTap: () async {
                              var time = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );
                              timeController2.text = time.format(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          child: TextFormField(
                            readOnly: true,
                            controller: timeController,
                            decoration: InputDecoration(
                              labelText: "GATE OUT TIME",
                              hintText: "gate out time",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.timelapse),
                            ),
                            onTap: () async {
                              var time = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );
                              timeController.text = time.format(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8, // default\minimum height
                      ),
                      Text(
                        "Signature ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4, // default\minimum height
                      ),
                      Container(
                          child: SfSignaturePad(
                              // key: signatureGlobalKey,
                              backgroundColor: Colors.grey[300],
                              strokeColor: Colors.black,
                              minimumStrokeWidth: 1.0,
                              maximumStrokeWidth: 4.0),
                          height: 120,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey))),
                      SizedBox(
                        height: 10, // default\minimum height
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     color: Colors.orange[50],
            //     child: ListTile(
            //       title: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               height: 10, // default\minimum height
            //             ),
            //             Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: <Widget>[
            //                 Expanded(
            //                   flex: 2,
            //                   child: Text(
            //                     "GCN",
            //                     style: TextStyle(fontSize: 14),
            //                   ),
            //                 ),
            //                 Expanded(
            //                   flex: 4,
            //                   child: TextFieldTags(
            //                       tagsStyler: TagsStyler(
            //                           tagTextStyle: TextStyle(
            //                             fontWeight: FontWeight.normal,
            //                             color: Colors.black,
            //                           ),
            //                           tagDecoration: BoxDecoration(
            //                             color: Colors.white70,
            //                             borderRadius:
            //                                 BorderRadius.circular(5.0),
            //                           ),
            //                           tagCancelIcon: Icon(Icons.cancel,
            //                               size: 18.0, color: Colors.red),
            //                           tagPadding: const EdgeInsets.symmetric(
            //                               vertical: 8.0)),
            //                       textFieldStyler: TextFieldStyler(
            //                         contentPadding:
            //                             EdgeInsets.symmetric(vertical: 0.0),
            //                         textFieldEnabledBorder:
            //                             UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black),
            //                         ),
            //                         textFieldFocusedBorder:
            //                             UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black),
            //                         ),
            //                         textFieldBorder: const OutlineInputBorder(
            //                             borderSide:
            //                                 BorderSide(color: Colors.white)),
            //                         hintText: '',
            //                       ),
            //                       onTag: (tag) {},
            //                       onDelete: (tag) {}),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //               height: 8, // default\minimum height
            //             ),
            //             Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: <Widget>[
            //                 Expanded(
            //                   flex: 2,
            //                   child: Text("Gate in"),
            //                 ),
            //                 Expanded(
            //                   flex: 4,
            //                   child: TextFormField(
            //                     readOnly: true,
            //                     // controller: timeController,
            //                     decoration: const InputDecoration(
            //                       contentPadding: EdgeInsets.all(0),
            //                       isDense: true,
            //                       enabledBorder: UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black)),
            //                       focusedBorder: UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black)),
            //                       hintText: '',
            //                       floatingLabelBehavior:
            //                           FloatingLabelBehavior.never,
            //                     ),
            //                     onTap: () async {
            //                       var time = await showTimePicker(
            //                         initialTime: TimeOfDay.now(),
            //                         context: context,
            //                       );
            //                       // timeController.text = time.format(context);
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //               height: 8, // default\minimum height
            //             ),
            //             Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: <Widget>[
            //                 Expanded(
            //                   flex: 2,
            //                   child: Text("Gate Out"),
            //                 ),
            //                 Expanded(
            //                   flex: 4,
            //                   child: TextFormField(
            //                     readOnly: true,
            //                     // controller: timeController2,
            //                     decoration: const InputDecoration(
            //                       contentPadding: EdgeInsets.all(0),
            //                       isDense: true,
            //                       enabledBorder: UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black)),
            //                       focusedBorder: UnderlineInputBorder(
            //                           borderSide:
            //                               BorderSide(color: Colors.black)),
            //                       hintText: '',
            //                       floatingLabelBehavior:
            //                           FloatingLabelBehavior.never,
            //                     ),
            //                     onTap: () async {
            //                       var time = await showTimePicker(
            //                         initialTime: TimeOfDay.now(),
            //                         context: context,
            //                       );
            //                       // timeController2.text = time.format(context);
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //               height: 8, // default\minimum height
            //             ),
            //             Text(
            //               "Signature  ",
            //               style: TextStyle(fontWeight: FontWeight.bold),
            //             ),
            //             SizedBox(
            //               height: 4, // default\minimum height
            //             ),
            //             Container(
            //                 child: SfSignaturePad(
            //                     // key: signatureGlobalKey,
            //                     backgroundColor: Colors.grey[300],
            //                     strokeColor: Colors.black,
            //                     minimumStrokeWidth: 1.0,
            //                     maximumStrokeWidth: 4.0),
            //                 height: 80,
            //                 decoration: BoxDecoration(
            //                     border: Border.all(color: Colors.grey))),
            //             SizedBox(
            //               height: 10, // default\minimum height
            //             ),
            //           ]),
            //       trailing: new Column(
            //         children: <Widget>[
            //           new Container(
            //             child: CircleAvatar(
            //               radius: 20,
            //               backgroundColor: Color(0xff0d47a1),
            //               child: IconButton(
            //                 icon: Icon(
            //                   Icons.description,
            //                 ),
            //                 iconSize: 20,
            //                 color: Colors.white,
            //                 splashColor: Colors.purple,
            //                 onPressed: () {
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) =>
            //                             const Pickupgcninvoiceform()),
            //                   );
            //                 },
            //               ),
            //             ),

            //             // margin: EdgeInsets.only(top: 5.0),
            //           )
            //         ],
            //       ),
            //       onTap: () {},
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
