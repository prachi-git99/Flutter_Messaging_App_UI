import 'package:chatting/models/message_model.dart';
import 'package:chatting/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  const ChatScreen({required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0,),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.secondary
              : Color(0xFFFFEFEE),
          borderRadius: isMe
              ? BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0))
              : BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(message.text,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0)),
        ],
      ),
    );
    if(isMe){
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          icon: message.isLiked ? Icon(Icons.favorite):Icon(Icons.favorite_border,),
          iconSize: 30.0,
          color:message.isLiked ? Colors.red:Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }

  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color:Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value){
              },
              decoration: InputDecoration.collapsed(hintText: 'Send a message...'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color:Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
