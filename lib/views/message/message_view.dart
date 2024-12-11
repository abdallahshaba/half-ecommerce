import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {



  final String encryptionKey = "1234567890123456"; 
  final String salt = "randomSaltValue";





 String encryptMessage(String message) {
  final key = encrypt.Key.fromUtf8(encryptionKey);
  final iv = encrypt.IV.fromLength(16); 
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final encrypted = encrypter.encrypt(message + salt, iv: iv);
  return "${iv.base64}:${encrypted.base64}";
}


String decryptMessage(String encryptedMessage) {
  final key = encrypt.Key.fromUtf8(encryptionKey);


  final parts = encryptedMessage.split(':');
  if (parts.length != 2) {
    throw ArgumentError("Error decrypting message");
  }

  final iv = encrypt.IV.fromBase64(parts[0]); 
  final encryptedText = parts[1]; 

  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final decrypted = encrypter.decrypt64(encryptedText, iv: iv);

  return decrypted.replaceAll(salt, ""); 
}





  TextEditingController messageController = TextEditingController();
  MyServices myServices = Get.find();

  final _firesstore = FirebaseFirestore.instance;
  String? messageText;

  void getMessages() async {
    final messages = await _firesstore.collection("messages").get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColor.kBackgroundColorMain,
        title: Text("Message Us", style: Styles.boldtextStyle22.copyWith(color: Colors.white)),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: StreamBuilder<QuerySnapshot>(
                stream: _firesstore.collection("messages").orderBy("time", descending: false).snapshots(),
                builder: (context, snapshot) {
                  List<MessageDesign> messagesWidgets = [];
                  if (!snapshot.hasData) {
                    return Center(
                      child: Lottie.asset(AppImageAsset.dataEmpty, height: 220, width: 300),
                    );
                  }

                  final messages = snapshot.data!.docs;
                  for (var message in messages) {
                    final messageText = decryptMessage(message.get("text"));
                    final messageSender = message.get("sender");
                    final String? currentUser = myServices.sharedPreference.getString("username");

                    final messageWidget = MessageDesign(
                      text: messageText,
                      sender: messageSender,
                      isMe: currentUser == messageSender,
                    );
                    messagesWidgets.add(messageWidget);
                  }

                  return ListView(
                    children: messagesWidgets,
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    style: Styles.boldtextStyle16,
                    decoration: InputDecoration(
                      errorStyle: Styles.boldtextStyle12.copyWith(color: Colors.red),
                      hintStyle: Styles.boldtextStyle18.copyWith(color: const Color.fromARGB(255, 113, 108, 108)),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      hintText: "Enter Your message",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (messageText != null && messageText!.isNotEmpty) {
               
                      final encryptedMessage = encryptMessage(messageText!);
                      _firesstore.collection("messages").add({
                        "text": encryptedMessage, 
                        "sender": myServices.sharedPreference.getString("username"),
                        "time": FieldValue.serverTimestamp(),
                      });
                      messageController.clear();
                    } else {
                      Get.snackbar("Note..", "The field is empty",
                        duration: const Duration(milliseconds: 2500),
                        icon: const Icon(Icons.done),
                        animationDuration: const Duration(milliseconds: 1000),
                        backgroundColor: AppColor.kBackgroundColorMain2);
                    }
                  },
                  icon: const Icon(Icons.send, color: Color.fromARGB(255, 61, 196, 7)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessageDesign extends StatelessWidget {
  const MessageDesign({this.sender, required this.isMe, this.text, super.key});
  final String? text;
  final String? sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text("$sender", style: Styles.boldtextStyle12.copyWith(color: Colors.black45)),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                : BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            color: isMe ? AppColor.kBackgroundColorMain : Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, left: 7, right: 7, bottom: 7),
              child: Text("$text", style: Styles.boldtextStyle14.copyWith(color: isMe ? Colors.white : Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
