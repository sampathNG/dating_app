import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:dating_app/ui_utils/colors.dart';
import 'package:dating_app/ui_utils/custom_container.dart';
import 'package:dating_app/ui_utils/custom_text_field.dart';
import 'package:dating_app/ui_utils/strings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/json/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.whiteBg,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                CustomContainer(
                  height: constraints.maxHeight * 0.7,
                  width: constraints.maxHeight * 0.7,
                  borderRadius: 50,
                  backgroundColor: MyColors.containerBackground1,
                  padding: 0,
                  margin: EdgeInsets.zero,
                  onPressed: () {},
                  child: Image.network('https://picsum.photos/250?image=9'),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.02,
                ),
                Text(
                  "Emilie",
                  style: Style.appBarTitleStyle.copyWith(
                    fontSize: constraints.maxWidth * 0.05,
                  ),
                ),
              ],
            );
          },
        ),
        centerTitle: false,
        actions: [
          LayoutBuilder(
            builder: (context, constraints) {
              return PopupMenuButton<int>(
                icon: const Icon(Icons.more_vert),
                color: Colors.white, // Overall box color
                onSelected: (int result) {
                  switch (result) {
                    case 0:
                      // Handle option 1
                      break;
                    case 1:
                      // Handle option 2
                      break;
                    case 2:
                      // Handle option 3
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                  PopupMenuItem<int>(
                    value: 0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.primaryColorWithOpacity,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: constraints.maxHeight * 0.04,
                        width: constraints.maxWidth * 0.3,
                        child: Center(
                            child: Text('Block',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    color: MyColors.primaryColor))),
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.primaryColorWithOpacity,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: constraints.maxHeight * 0.04,
                        width: constraints.maxWidth * 0.3,
                        child: Center(
                            child: Text('Report',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    color: MyColors.primaryColor))),
                      ),
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.primaryColorWithOpacity,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: constraints.maxHeight * 0.04,
                        width: constraints.maxWidth * 0.3,
                        child: Center(
                            child: Text('Remove',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.04,
                                    color: MyColors.primaryColor))),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Chat(
        customBottomWidget: buildChatField(context),
        textMessageBuilder: buildChatBoxContainer,
        messages: _messages,
        onAttachmentPressed: _handleAttachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        showUserAvatars: false,
        showUserNames: false,
        user: _user,
      ),
    );
  }

  Widget buildChatBoxContainer(types.TextMessage message,
      {required int messageWidth, required bool showName}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: MyColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomContainer(
                margin: EdgeInsets.zero,
                padding: 0,
                paddingEdge: EdgeInsets.zero,
                width: messageWidth.toDouble(),
                backgroundColor: MyColors.whiteBg,
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.text,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: constraints.maxWidth * 0.04,
                            color: MyColors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                DateFormat('hh:mm:ss')
                    .format(DateTime.fromMillisecondsSinceEpoch(message.createdAt!))
                    .toString(),
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: constraints.maxWidth * 0.04,
                    color: MyColors.black.withOpacity(0.4)),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.01,
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildChatField(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(
            left: constraints.maxWidth * 0.05,
            right: constraints.maxWidth * 0.05,
            bottom: constraints.maxHeight * 0.05,
          ),
          child: SizedBox(
            height: constraints.maxHeight * 0.08,
            child: CustomTextField(
              labelText: AppStrings.writeAMessage,
              autoFocus: true,
              hintTextStyle: GoogleFonts.roboto(
                  fontSize: constraints.maxWidth * 0.04,
                  color: const Color(0xff1B1A57),
                  fontWeight: FontWeight.w400),
              labelStyle: GoogleFonts.roboto(
                  fontSize: constraints.maxWidth * 0.04,
                  color: const Color(0xff1B1A57),
                  fontWeight: FontWeight.w400),
              onTap: () {},
              onChanged: (value) {},
              borderColor: MyColors.backGroundColor,
              fillColor: MyColors.backGroundColor,
              isFilled: true,
              borderRadius: 16,
              borderWidth: 1.0,
              focusedBorderWidth: 0.0,
              onFieldSubmitted: (value) {
                _handleSendPressed(types.PartialText(
                  text: value,
                ));
              },
              hintText: AppStrings.writeAMessage,
              margin: const EdgeInsets.only(top: 0, bottom: 0),
              contentPadding: const EdgeInsets.only(top: 0, bottom: 0),
              keyboardType: TextInputType.text,
              isLabelEnabled: false,
              overrideHintText: true,
              elevation: 0,
              focusedBorderColor: MyColors.borderColor,
              trailingFunction: () {},
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.04,
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.02,
                  ),
                ],
              ),
              showTrailingWidget: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _handleAttachmentPressed();
                    },
                    child: Icon(
                      Icons.attach_file,
                      color: const Color(0xff1B1A57),
                      size: constraints.maxWidth * 0.05,
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.02,
                  ),
                  CustomContainer(
                    borderRadius: 50,
                    height: constraints.maxHeight * 0.08,
                    width: constraints.maxHeight * 0.08,
                    backgroundColor: MyColors.primaryColor,
                    margin: EdgeInsets.zero,
                    paddingEdge: EdgeInsets.zero,
                    padding: 0,
                    child: Center(
                      child: Icon(
                        Icons.mic,
                        color: const Color(0xffffffff),
                        size: constraints.maxHeight * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.02,
                  ),
                ],
              ),
              textStyle: GoogleFonts.workSans(
                  fontSize: constraints.maxWidth * 0.04, color: MyColors.black, fontWeight: FontWeight.w500),
              showLeadingWidget: true,
            ),
          ),
        );
      },
    );
  }
}
