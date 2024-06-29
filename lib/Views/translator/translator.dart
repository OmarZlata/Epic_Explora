import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorView extends StatefulWidget {
  @override
  _TranslatorViewState createState() => _TranslatorViewState();
}

class _TranslatorViewState extends State<TranslatorView> {
  GoogleTranslator translator = GoogleTranslator();
  late String _transalateLanguage;
  String selectedLanguage = 'English';

  List<String> listLanguage = [
    "Afrikaans", "Albanian", "Amharic", "Arabic", "Armenian", "Azerbaijani",
    'Basque', 'Belarusian', 'Bengali', 'Bosnian', 'Bulgarian', 'Catalan',
    'Cebuano', 'Chichewa', 'Chinese Simplified', 'Chinese Traditional',
    'Corsican', 'Croatian', 'Czech', 'Danish', 'Dutch', 'English', 'Esperanto',
    'Estonian', 'Filipino', 'Finnish', 'French', 'Frisian', 'Galician',
    'Georgian', 'German', 'Greek', 'Gujarati', 'Haitian Creole', 'Hausa',
    'Hawaiian', 'Hebrew', 'Hindi', 'Hmong', 'Hungarian', 'Icelandic', 'Igbo',
    'Indonesian', 'Irish', 'Italian', 'Japanese', 'Javanese', 'Kannada',
    'Kazakh', 'Khmer', 'Korean', 'Kurdish (Kurmanji)', 'Kyrgyz', 'Lao', 'Latin',
    'Latvian', 'Lithuanian', 'Luxembourgish', 'Macedonian', 'Malagasy', 'Malay',
    'Malayalam', 'Maltese', 'Maori', 'Marathi', 'Mongolian', 'Myanmar (Burmese)',
    'Nepali', 'Norwegian', 'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi',
    'Romanian', 'Russian', 'Samoan', 'Scots Gaelic', 'Serbian', 'Sesotho', 'Shona',
    'Sindhi', 'Sinhala', 'Slovak', 'Slovenian', 'Somali', 'Spanish', 'Sundanese',
    'Swahili', 'Swedish', 'Tajik', 'Tamil', 'Telugu', 'Thai', 'Turkish', 'Ukrainian',
    'Urdu', 'Uzbek', 'Vietnamese', 'Welsh', 'Xhosa', 'Yiddish', 'Yoruba', 'Zulu'
  ];

  String out = 'Result';
  final lang = TextEditingController();
  bool isLoading = false;

  void trans() async {
    if (lang.text.isEmpty) {
      setState(() {
        out = 'Please enter text to translate.';
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      switch (selectedLanguage) {
        case 'Afrikaans':
          _transalateLanguage = 'af';
          break;
        case 'Albanian':
          _transalateLanguage = 'sq';
          break;
        case 'Amharic':
          _transalateLanguage = 'am';
          break;
        case 'Arabic':
          _transalateLanguage = 'ar';
          break;
        case 'Armenian':
          _transalateLanguage = 'hy';
          break;
        case 'Azerbaijani':
          _transalateLanguage = 'az';
          break;
        case 'Basque':
          _transalateLanguage = 'eu';
          break;
        case 'Belarusian':
          _transalateLanguage = 'be';
          break;
        case 'Bengali':
          _transalateLanguage = 'bn';
          break;
        case 'Bosnian':
          _transalateLanguage = 'bs';
          break;
        case 'Bulgarian':
          _transalateLanguage = 'bg';
          break;
        case 'Catalan':
          _transalateLanguage = 'ca';
          break;
        case 'Cebuano':
          _transalateLanguage = 'ceb';
          break;
        case 'Chichewa':
          _transalateLanguage = 'ny';
          break;
        case 'Chinese Simplified':
          _transalateLanguage = 'zh-cn';
          break;
        case 'Chinese Traditional':
          _transalateLanguage = 'zh-tw';
          break;
        case 'Corsican':
          _transalateLanguage = 'co';
          break;
        case 'Croatian':
          _transalateLanguage = 'hr';
          break;
        case 'Czech':
          _transalateLanguage = 'cs';
          break;
        case 'Danish':
          _transalateLanguage = 'da';
          break;
        case 'Dutch':
          _transalateLanguage = 'nl';
          break;
        case 'English':
          _transalateLanguage = 'en';
          break;
        case 'Esperanto':
          _transalateLanguage = 'eo';
          break;
        case 'Estonian':
          _transalateLanguage = 'et';
          break;
        case 'Filipino':
          _transalateLanguage = 'tl';
          break;
        case 'Finnish':
          _transalateLanguage = 'fi';
          break;
        case 'French':
          _transalateLanguage = 'fr';
          break;
        case 'Frisian':
          _transalateLanguage = 'fy';
          break;
        case 'Galician':
          _transalateLanguage = 'gl';
          break;
        case 'Georgian':
          _transalateLanguage = 'ka';
          break;
        case 'German':
          _transalateLanguage = 'de';
          break;
        case 'Greek':
          _transalateLanguage = 'el';
          break;
        case 'Gujarati':
          _transalateLanguage = 'gu';
          break;
        case 'Haitian Creole':
          _transalateLanguage = 'ht';
          break;
        case 'Hausa':
          _transalateLanguage = 'ha';
          break;
        case 'Hawaiian':
          _transalateLanguage = 'haw';
          break;
        case 'Hebrew':
          _transalateLanguage = 'he';
          break;
        case 'Hindi':
          _transalateLanguage = 'hi';
          break;
        case 'Hmong':
          _transalateLanguage = 'hmn';
          break;
        case 'Hungarian':
          _transalateLanguage = 'hu';
          break;
        case 'Icelandic':
          _transalateLanguage = 'is';
          break;
        case 'Igbo':
          _transalateLanguage = 'ig';
          break;
        case 'Indonesian':
          _transalateLanguage = 'id';
          break;
        case 'Irish':
          _transalateLanguage = 'ga';
          break;
        case 'Italian':
          _transalateLanguage = 'it';
          break;
        case 'Japanese':
          _transalateLanguage = 'ja';
          break;
        case 'Javanese':
          _transalateLanguage = 'jw';
          break;
        case 'Kannada':
          _transalateLanguage = 'kn';
          break;
        case 'Kazakh':
          _transalateLanguage = 'kk';
          break;
        case 'Khmer':
          _transalateLanguage = 'km';
          break;
        case 'Korean':
          _transalateLanguage = 'ko';
          break;
        case 'Kurdish (Kurmanji)':
          _transalateLanguage = 'ku';
          break;
        case 'Kyrgyz':
          _transalateLanguage = 'ky';
          break;
        case 'Lao':
          _transalateLanguage = 'lo';
          break;
        case 'Latin':
          _transalateLanguage = 'la';
          break;
        case 'Latvian':
          _transalateLanguage = 'lv';
          break;
        case 'Lithuanian':
          _transalateLanguage = 'lt';
          break;
        case 'Luxembourgish':
          _transalateLanguage = 'lb';
          break;
        case 'Macedonian':
          _transalateLanguage = 'mk';
          break;
        case 'Malagasy':
          _transalateLanguage = 'mg';
          break;
        case 'Malay':
          _transalateLanguage = 'ms';
          break;
        case 'Malayalam':
          _transalateLanguage = 'ml';
          break;
        case 'Maltese':
          _transalateLanguage = 'mt';
          break;
        case 'Maori':
          _transalateLanguage = 'mi';
          break;
        case 'Marathi':
          _transalateLanguage = 'mr';
          break;
        case 'Mongolian':
          _transalateLanguage = 'mn';
          break;
        case 'Myanmar (Burmese)':
          _transalateLanguage = 'my';
          break;
        case 'Nepali':
          _transalateLanguage = 'ne';
          break;
        case 'Norwegian':
          _transalateLanguage = 'no';
          break;
        case 'Pashto':
          _transalateLanguage = 'ps';
          break;
        case 'Persian':
          _transalateLanguage = 'fa';
          break;
        case 'Polish':
          _transalateLanguage = 'pl';
          break;
        case 'Portuguese':
          _transalateLanguage = 'pt';
          break;
        case 'Punjabi':
          _transalateLanguage = 'pa';
          break;
        case 'Romanian':
          _transalateLanguage = 'ro';
          break;
        case 'Russian':
          _transalateLanguage = 'ru';
          break;
        case 'Samoan':
          _transalateLanguage = 'sm';
          break;
        case 'Scots Gaelic':
          _transalateLanguage = 'gd';
          break;
        case 'Serbian':
          _transalateLanguage = 'sr';
          break;
        case 'Sesotho':
          _transalateLanguage = 'st';
          break;
        case 'Shona':
          _transalateLanguage = 'sn';
          break;
        case 'Sindhi':
          _transalateLanguage = 'sd';
          break;
        case 'Sinhala':
          _transalateLanguage = 'si';
          break;
        case 'Slovak':
          _transalateLanguage = 'sk';
          break;
        case 'Slovenian':
          _transalateLanguage = 'sl';
          break;
        case 'Somali':
          _transalateLanguage = 'so';
          break;
        case 'Spanish':
          _transalateLanguage = 'es';
          break;
        case 'Sundanese':
          _transalateLanguage = 'su';
          break;
        case 'Swahili':
          _transalateLanguage = 'sw';
          break;
        case 'Swedish':
          _transalateLanguage = 'sv';
          break;
        case 'Tajik':
          _transalateLanguage = 'tg';
          break;
        case 'Tamil':
          _transalateLanguage = 'ta';
          break;
        case 'Telugu':
          _transalateLanguage = 'te';
          break;
        case 'Thai':
          _transalateLanguage = 'th';
          break;
        case 'Turkish':
          _transalateLanguage = 'tr';
          break;
        case 'Ukrainian':
          _transalateLanguage = 'uk';
          break;
        case 'Urdu':
          _transalateLanguage = 'ur';
          break;
        case 'Uzbek':
          _transalateLanguage = 'uz';
          break;
        case 'Vietnamese':
          _transalateLanguage = 'vi';
          break;
        case 'Welsh':
          _transalateLanguage = 'cy';
          break;
        case 'Xhosa':
          _transalateLanguage = 'xh';
          break;
        case 'Yiddish':
          _transalateLanguage = 'yi';
          break;
        case 'Yoruba':
          _transalateLanguage = 'yo';
          break;
        case 'Zulu':
          _transalateLanguage = 'zu';
          break;
        default:
          _transalateLanguage = 'en';
      }

      var translation = await translator.translate(lang.text, to: _transalateLanguage);
      setState(() {
        out = translation.text;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        out = 'Translation failed. Please try again.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Smart Translator',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 18),
        child: Column(
          children: [
            Text(
              'Enter Text to Translate',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.grey[800],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: lang,
                  style: TextStyle(color: Colors.white),
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter text here',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.grey[800],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey[800],
                  isExpanded: true,
                  value: selectedLanguage,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  style: TextStyle(color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  items: listLanguage.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: trans,
              style: ElevatedButton.styleFrom(

              ),
              child: Text('Translate'),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.grey[800],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  out,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
