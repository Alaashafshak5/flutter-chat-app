// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import '../classes/FullScreenImage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

final ReceivePort _port = ReceivePort();

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late PlatformFile? file;
  late List<Map> messages;
  late double height, width;
  late TextEditingController textController;
  late ScrollController scrollController;
  late Socket socket;

  Future getMessages() async {
    var url = 'http://10.0.2.2:5000/get-messages';
    var response = await http.get(Uri.parse(url));
    var d = json.encode(response.body);
    debugPrint(d);
    // // messages.add(d);
    // for (var i = 0; i < response.body.length; i++) {
    //   messages.add({'message': response.body, 'type': 'receive'});
    // }
  }

  Future selectFile() async {
    // debugPrint('helloooo');
    final res = await FilePicker.platform.pickFiles();
    // debugPrint('res $res');
    var uri = Uri.parse("http://10.0.2.2:5000/upload");

    var request = http.MultipartRequest("POST", uri);
    file = res?.files.first;
    // setState(() {

    // });
    if (file != null) {
      var multipartFile =
          await http.MultipartFile.fromPath('myFile', file!.path!);
      // print(multipartFile.contentType);
      request.files.add(multipartFile);
      var response = await request.send();

      // print(response.reasonPhrase);
      // print('hon');
      socket.emit(
          'send_message', json.encode({'message': file!.name, 'text': false}));
      // print('tahet');
      // print(file.name);
      messages.add({'message': file!.name, 'type': 'sender', 'text': false});
      setState((() {}));
    }
    // debugPrint('file $file');
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
      if (data['text']) {
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
              }),
              // file = data['message']
            });
      }

      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    });
    socket.onDisconnect((_) => print('disconnect'));
    getMessages();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });
    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  void downloadFile(String url) async {
    final stat = await Permission.storage.request();

    if (stat.isGranted) {
      final externaldir = await getExternalStorageDirectory();
  
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: externaldir!.path,
        fileName: 'download',
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
      print('taskId $taskId');
      OpenFile.open(externaldir.path);
      // FlutterDownloader.registerCallback(
      //     (id, status, progress) => {print('downloaded')});
      // final tasks = await FlutterDownloader.loadTasks();

      print('taskId $taskId');
    } else {
      print('permission denied');
    }
  }

  Widget buildReceiveMessage(int index) {
    var align, color, child, margin;
    if (messages.elementAt(index)['type'] == 'sender') {
      align = Alignment.centerRight;
      color = Colors.green[900];
      margin = const EdgeInsets.only(bottom: 10.0, right: 5.0, left: 20.0);
      if (!messages.elementAt(index)['text']) {
        // print('sender');
        if (messages.elementAt(index)['message'].contains('jpg') ||
            messages.elementAt(index)['message'].contains('png')) {
          child = GestureDetector(
              onTap: () {
                // print('image pressed');
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FullScreenImage(
                    imageUrl: 'http://10.0.2.2:5000/uploads/${file!.name}',
                    tag: file!.name,
                  );
                }));
              },
              child: Image(
                //  File(file.path!),
                image: FileImage(File(file!.path!)),
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ));
        } else {
          child = Row(children: <Widget>[
            const Icon(Icons.file_download),
            GestureDetector(
                onTap: () {
                  print('opened');
                  OpenFile.open(file!.path);
                },
                child: Text(file!.name))
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
      margin = const EdgeInsets.only(bottom: 10.0, left: 5.0, right: 20.0);
      if (!messages.elementAt(index)['text']) {
        // print('contains: ');
        if (messages.elementAt(index)['message'].contains('jpg') ||
            messages.elementAt(index)['message'].contains('png')) {
          var msg = messages.elementAt(index)['message'];
          debugPrint(msg);
          child = GestureDetector(
              onTap: () {
                // print('image pressed');
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FullScreenImage(
                    imageUrl:
                        'http://10.0.2.2:5000/uploads/${messages.elementAt(index)['message']}',
                    tag: messages.elementAt(index)['message'],
                  );
                }));
              },
              child: Image.network(
                'http://10.0.2.2:5000/uploads/${messages.elementAt(index)['message']}',
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ));
        } else {
          child = Row(children: <Widget>[
            const Icon(Icons.file_download),
            GestureDetector(
                onTap: () async {
                  downloadFile(
                      'https://firebasestorage.googleapis.com/v0/b/storage-3cff8.appspot.com/o/2020-05-29%2007-18-34.mp4?alt=media&token=841fffde-2b83-430c-87c3-2d2fd658fd41');

                  // OpenFile.open(
                  //     'http://10.0.2.2:5000/uploads/${messages.elementAt(index)['message']}');
                  print('opened');
                },
                child: Text('${messages.elementAt(index)['message']}'))
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
          margin: margin,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: child),
    );
  }

  Widget buildMessageList() {
    return SizedBox(
      height: height * 0.8,
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
      child: Row(
        children: [
          SizedBox(
            width: width * 0.5,
            child: TextField(
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
              controller: textController,
            ),
          ),
          TextButton.icon(
            // backgroundColor: Colors.deepPurple,
            onPressed: () {
              selectFile();
              // debugPrint('jkehjkhr');
            },
            icon: const Icon(Icons.image, color: Colors.grey),
            label: const Text(''),
          )
        ],
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
          socket.emit('send_message',
              json.encode({'message': textController.text, 'text': true}));
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
        // debugPrint('jkehjkhr');
      },
      icon: const Icon(Icons.image),
      label: const Text('Upload file'),
    );
  }

  Widget buildInputArea() {
    return SizedBox(
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
            // buildFileButton(),
            buildInputArea(),
          ],
        ),
      ),
    );
  }
}
