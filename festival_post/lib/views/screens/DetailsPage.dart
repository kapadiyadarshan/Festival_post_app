import 'dart:io';
import 'dart:ui';

import 'package:festival_post/models/festival_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../utils/colors_utils.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int fontSize = 48;
  bool fontBold = false;
  bool fontItalic = false;
  Color fontColor = MyColor.theme1;

  String bgImage =
      "https://e0.pxfuel.com/wallpapers/156/840/desktop-wallpaper-pure-simple-art-blank-colors-ipad.jpg";

  TextStyle text = GoogleFonts.abel();

  Color pickerColor = const Color(0xff000000);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  GlobalKey key = GlobalKey();

  List<TextStyle> FontFamily = [
    GoogleFonts.pacifico(),
    GoogleFonts.poppins(),
    GoogleFonts.merriweather(),
    GoogleFonts.kanit(),
    GoogleFonts.hindSiliguri(),
    GoogleFonts.lobster(),
    GoogleFonts.abel(),
  ];

  int m = 0;
  int o = 0;

  @override
  Widget build(BuildContext context) {
    festival Festival = ModalRoute.of(context)!.settings.arguments as festival;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Festival Post"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            RepaintBoundary(
              key: key,
              child: Container(
                height: 360,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: MyColor.theme2,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(Festival.BG[m % Festival.BG.length]),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      "Happy\n${Festival.name}",
                      textAlign: TextAlign.center,
                      style: text.merge(
                        TextStyle(
                          fontSize: fontSize.toDouble(),
                          fontWeight: (fontBold) ? FontWeight.bold : null,
                          fontStyle: (fontItalic)
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: fontColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SelectableText(
                      "My special wishes to you and to all those to are close to you. May you have a celebration that is more special than it has ever been.",
                      textAlign: TextAlign.center,
                      style: text.merge(
                        TextStyle(
                          fontSize: 10,
                          fontWeight: (fontBold) ? FontWeight.bold : null,
                          fontStyle: (fontItalic)
                              ? FontStyle.italic
                              : FontStyle.normal,
                          color: fontColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Bold
                IconButton(
                  onPressed: () {
                    setState(() {
                      fontBold = !fontBold;
                    });
                  },
                  icon: const Icon(Icons.format_bold),
                  style: IconButton.styleFrom(
                    backgroundColor: MyColor.theme2,
                    foregroundColor: MyColor.theme1,
                  ),
                ),
                //Italic
                IconButton(
                  onPressed: () {
                    setState(() {
                      fontItalic = !fontItalic;
                    });
                  },
                  icon: const Icon(Icons.format_italic),
                  style: IconButton.styleFrom(
                    backgroundColor: MyColor.theme2,
                    foregroundColor: MyColor.theme1,
                  ),
                ),
                //Copy
                IconButton(
                  onPressed: () async {
                    Clipboard.setData(
                      ClipboardData(
                          text:
                              "Happy ${Festival.name}\n\n\n\nMay your day be filled with blessings Like the sun that lights the sky and may you always have the courage to spread your wings and fly. Festival Greetings to you! : Festival Post App"),
                    ).then(
                      (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Wishes Copied..."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green.shade300,
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.copy),
                  style: IconButton.styleFrom(
                    backgroundColor: MyColor.theme2,
                    foregroundColor: MyColor.theme1,
                  ),
                ),
                //Save Gallary
                IconButton(
                  onPressed: () async {
                    final boundary = key.currentContext?.findRenderObject()
                        as RenderRepaintBoundary?;
                    final image = await boundary?.toImage(pixelRatio: 12);
                    final byteData =
                        await image?.toByteData(format: ImageByteFormat.png);
                    final imageBytes = byteData?.buffer.asUint8List();

                    if (imageBytes != null) {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      final imagePath =
                          await File("${directory.path}/quotes_image.png")
                              .create();
                      await imagePath.writeAsBytes(imageBytes);

                      ImageGallerySaver.saveFile(imagePath.path);
                    }
                  },
                  icon: const Icon(Icons.download),
                  style: IconButton.styleFrom(
                    backgroundColor: MyColor.theme2,
                    foregroundColor: MyColor.theme1,
                  ),
                ),
                //share
                IconButton(
                  onPressed: () async {
                    final boundary = key.currentContext?.findRenderObject()
                        as RenderRepaintBoundary?;
                    final image = await boundary?.toImage(pixelRatio: 12);
                    final byteData =
                        await image?.toByteData(format: ImageByteFormat.png);
                    final imageBytes = byteData?.buffer.asUint8List();

                    if (imageBytes != null) {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      final imagePath =
                          await File("${directory.path}/quotes_image.png")
                              .create();
                      await imagePath.writeAsBytes(imageBytes);

                      ShareExtend.share(imagePath.path, "file");
                    }
                  },
                  icon: const Icon(Icons.share),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColor.theme2,
                    foregroundColor: MyColor.theme1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            //Change font colour
            GestureDetector(
              onTap: () {
                setState(() {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Pick a Color"),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: pickerColor,
                                onColorChanged: changeColor,
                              ),
                            ),
                            backgroundColor: MyColor.theme2,
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    fontColor = pickerColor;
                                    Navigator.of(context).pop();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColor.theme2,
                                  foregroundColor: MyColor.theme1,
                                ),
                                child: const Text("Got it"),
                              ),
                            ],
                          ));
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColor.theme2,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: fontColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Change Font Colour",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyColor.theme1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //Change Background
            GestureDetector(
              onTap: () {
                setState(() {
                  m++;
                  bgImage = Festival.BG[m % (Festival.BG.length)];
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: MyColor.theme2,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(bgImage),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Change Background",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //Change font family
            GestureDetector(
              onTap: () {
                setState(() {
                  o++;
                  text = FontFamily[o % (FontFamily.length)];
                });
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColor.theme2,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Aa",
                      style: text.merge(
                        const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Change Font Family",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
