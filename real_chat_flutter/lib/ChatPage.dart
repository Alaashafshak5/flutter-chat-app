import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'FullScreenImage.dart';
// import 'package:axios/axios.dart' as axios;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late PlatformFile file;
  late List<Map> messages;
  late double height, width;
  late TextEditingController textController;
  late ScrollController scrollController;
  late Socket socket;

  Future getMessages() async {
    var url = 'http://10.0.2.2:5000/get-messages';
    var response = await http.get(Uri.parse(url));
    var d = json.encode(response.body);
    // print(d);
    // // messages.add(d);
    // for (var i = 0; i < response.body.length; i++) {
    //   messages.add({'message': response.body, 'type': 'receive'});
    // }
  }

  Future selectFile() async {
    final res = await FilePicker.platform.pickFiles();

    setState(() {
      if (res != null) {
        file = res.files.first;
      }
    });
    print(file);
    var uri = Uri.parse("http://10.0.2.2:5000/upload");

    var request = http.MultipartRequest("POST", uri);
    var multipartFile = await http.MultipartFile.fromPath('myFile', file.path!);
    // print(multipartFile.contentType);
    request.files.add(multipartFile);
    var response = await request.send();

    print(response.reasonPhrase);
    // print('hon');
    socket.emit('send_message', json.encode({'message': file.toString()}));
    // print('tahet');
    // print(file.name);
    setState(() => {
          messages.add({'message': file.name, 'type': 'sender', 'text': false}),
          // messages.add({'message': file.name, 'type': 'receiver', 'text': false})
        });
  }

  @override
  void initState() {
    //Initializing the message list
    messages = <Map>[];
    //Initializing the TextEditingController and ScrollController
    textController = TextEditingController();
    scrollController = ScrollController();
    socket = io("http://10.0.2.2:5000", <String, dynamic>{
      "transports": ["websocket"],
    });
    socket.connect();
    socket.onConnect((_) {
      debugPrint('connect');
      socket.emit('connection', 'test');
    });
    socket.on('receive_message', (jsonData) {
      print('receive');
      print(jsonData);
      Map<String, dynamic> data = json.decode(jsonData);
      if (!data['message'].contains('Platform')) {
        setState(() => {
              messages.add(
                  {'message': data['message'], 'type': 'receive', 'text': true})
            });
      } else {
        //  Map<String, dynamic> data = json.decode(jsonData);
        setState(() => {
              // var n = .name;
              messages.add({
                'message': data['message'],
                'type': 'receive',
                'text': false
              })
            });
      }

      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    });
    socket.onDisconnect((_) => print('disconnect'));
    getMessages();
    super.initState();
  }

  Widget buildReceiveMessage(int index) {
    var align, color, child;
    if (messages.elementAt(index)['type'] == 'sender') {
      align = Alignment.centerRight;
      color = Colors.green[900];
      if (!messages.elementAt(index)['text']) {
        // print('sender');
        if (messages.elementAt(index)['message'].contains('jpg') ||
            messages.elementAt(index)['message'].contains('png')) {
          child = GestureDetector(
              onTap: () {
                print('image pressed');
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FullScreenImage(
                    imageUrl: file.name,
                    tag: "generate_a_unique_tag",
                  );
                }));
              },
              child: Image.file(
                File(file.path!),
                width: double.infinity,
                fit: BoxFit.cover,
              ));
        } else {
          child = Row(children: <Widget>[
            const Icon(Icons.file_download),
            GestureDetector(
                onTap: () {
                  OpenFile.open('uploads/${file.name}');
                  print('opened');
                },
                child: Text('${file.name}'))
          ]);
        }
      } else {
        child = Text(
          messages.elementAt(index)['message'],
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        );
      }
    } else {
      align = Alignment.centerLeft;
      color = Colors.grey[600];
      if (!messages.elementAt(index)['text']) {
        print('contains: ');
        print(messages.elementAt(index)['message'].contains('jpg') ||
            messages.elementAt(index)['message'].contains('png'));
        if (messages.elementAt(index)['message'].contains('jpg')) {
          child = Image.network(
            'http://10.0.2.2:5000/uploads/${file.name}',
            width: double.infinity,
            fit: BoxFit.cover,
          );
        } else {
          child = Row(children: <Widget>[
            Icon(Icons.file_download),
            GestureDetector(
                onTap: () {
                  OpenFile.open('uploads/${file.name}');
                  print('opened');
                },
                child: Text('${file.name}'))
          ]);
        }
      } else {
        child = Text(
          messages.elementAt(index)['message'],
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        );
      }
    }

    return Container(
      alignment: align,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          margin: const EdgeInsets.only(bottom: 10.0, right: 20.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: child),
    );
  }

  Widget buildMessageList() {
    return Container(
      height: height * 0.7,
      width: width,
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return buildReceiveMessage(index);
        },
      ),
    );
  }

  Widget buildChatInput() {
    return Container(
      width: width * 0.7,
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(left: 40.0),
      child: TextField(
        decoration: const InputDecoration.collapsed(
          hintText: 'Send a message...',
        ),
        controller: textController,
      ),
    );
  }

  Widget buildSendButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blue[800],
      onPressed: () {
        //Check if the textfield has text or not
        if (textController.text.isNotEmpty) {
          //Send the message as JSON data to send_message event
          socket.emit(
              'send_message', json.encode({'message': textController.text}));
          //Add the message to the list
          setState(() => {
                messages.add({
                  'message': textController.text,
                  'type': 'sender',
                  'text': true
                })
              });
          textController.text = '';
          //Scrolldown the list to show the latest message
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 600),
            curve: Curves.ease,
          );
        }
      },
      child: const Icon(
        Icons.send,
        size: 30,
      ),
    );
  }

  Widget buildFileButton() {
    return TextButton.icon(
      // backgroundColor: Colors.deepPurple,
      onPressed: () {
        selectFile();
      },
      icon: const Icon(Icons.image),
      label: const Text('Upload file'),
    );
  }

  Widget buildInputArea() {
    return Container(
      height: height * 0.1,
      width: width,
      child: Row(
        children: <Widget>[
          buildChatInput(),
          buildSendButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.1),
            buildMessageList(),
            buildFileButton(),
            buildInputArea(),
          ],
        ),
      ),
    );
  }
}
