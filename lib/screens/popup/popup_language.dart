import 'package:flutter/material.dart';

class PopupLanguage extends StatefulWidget {
  const PopupLanguage({super.key});

  @override
  State<PopupLanguage> createState() => _PopupLanguageState();
}

class _PopupLanguageState extends State<PopupLanguage> {
  String _selectedLanguage = "English";
  final List<String> _languages = [
    "Afrikaans",
    "Aghem",
    "Akan",
    "Albanian",
    "Amharic",
    "Arabic",
    "Armenian",
    "Assamese",
    "Azerbaijani",
    "Basque",
    "Belarusian",
    "Bengali",
    "Bosnian",
    "Bulgarian",
    "Catalan",
    "Cebuano",
    "Chichewa",
    "Chinese",
    "Corsican",
    "Croatian",
    "Czech",
    "Danish",
    "Dutch",
    "English",
    "Esperanto",
    "Estonian",
    "Filipino",
    "Finnish",
    "French",
    "Frisian",
    "Galician",
    "Georgian",
    "German",
    "Greek",
    "Gujarati",
    "Haitian Creole",
    "Hausa",
    "Hawaiian",
    "Hebrew",
    "Hindi",
    "Hmong",
    "Hungarian",
    "Icelandic",
    "Igbo",
    "Indonesian",
    "Irish",
    "Italian",
    "Japanese",
    "Javanese",
    "Kannada",
    "Kazakh",
    "Khmer",
    "Kinyarwanda",
    "Korean",
    "Kurdish",
    "Kyrgyz",
    "Lao",
    "Latin",
    "Latvian",
    "Lithuanian",
    "Luxembourgish",
    "Macedonian",
    "Malagasy",
    "Malay",
    "Malayalam",
    "Maltese",
    "Maori",
    "Marathi",
    "Mongolian",
    "Myanmar",
    "Nepali",
    "Norwegian",
    "Odia",
    "Pashto",
    "Persian",
    "Polish",
    "Portuguese",
    "Punjabi",
    "Romanian",
    "Russian",
    "Samoan",
    "Scots Gaelic",
    "Serbian",
    "Sesotho",
    "Shona",
    "Sindhi",
    "Sinhala",
    "Slovak",
    "Slovenian",
    "Somali",
    "Spanish",
    "Sundanese",
    "Swahili",
    "Swedish",
    "Tajik",
    "Tamil",
    "Tatar",
    "Telugu",
    "Thai",
    "Turkish",
    "Turkmen",
    "Ukrainian",
    "Urdu",
    "Uyghur",
    "Uzbek",
    "Vietnamese",
    "Welsh",
    "Xhosa",
    "Yiddish",
    "Yoruba",
    "Zulu"
  ];

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * 0.733,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: AlertDialog(
              title: Padding(
                padding: const EdgeInsets.only(left: 45),
                child: const Text(
                  "Language",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: _buildLanguageList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildLanguageList() {
    List<Widget> languageWidgets = [];
    for (int i = 0; i < _languages.length; i++) {
      languageWidgets.add(
        ListTile(
          title: Text(_languages[i]),
          onTap: () {
            setState(() {
              _selectedLanguage = _languages[i];
            });
            Navigator.of(context).pop();
          },
        ),
      );
      if (i < _languages.length - 1) {
        languageWidgets.add(Divider());
      }
    }
    return languageWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.023,
            ),
            Text("Selected Language: $_selectedLanguage"),
         SizedBox(
              height: MediaQuery.of(context).size.height * 0.023,
            ),
            ElevatedButton(
              child: Text("Select Language"),
              onPressed: _showLanguageDialog,
            ),
          ],
        ),
      ),
    );
  }
}
