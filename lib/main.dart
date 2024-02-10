import 'package:flutter/material.dart';
import 'package:forniteapp/providers/skin_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SkinProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SkinsPage(),
    );
  }
}

class SkinsPage extends StatelessWidget {
  const SkinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final skinProvider = context.watch<SkinProvider>();
    final textStyle = GoogleFonts.luckiestGuy();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PULPIIN STORE',
          style: textStyle,
        ),
      ),
      body: skinProvider.listSkins.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: skinProvider.categorias.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, index) {
                      final category = skinProvider.categorias[index];

                      return Container(
                        width: 140,
                        height: 80,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 112, 187, 248),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            category,
                            style: textStyle.copyWith(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: skinProvider.listSkins.length,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemBuilder: (_, index) {
                      final skin = skinProvider.listSkins[index];

                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 190,
                            width: 190,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: NetworkImage(skin
                                            .newDisplayAsset
                                            ?.materialInstances[0]
                                            .images
                                            .background ??
                                        'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg'))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    skin.layout.name,
                                    style:
                                        textStyle.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 190,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                scrollDirection: Axis.horizontal,
                                itemCount: skin.items.length,
                                itemBuilder: (_, index) {
                                  final itemSkin = skin.items[index];

                                  return Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        image: NetworkImage(itemSkin
                                                .images.smallIcon ??
                                            'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg'),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'hola',
                                          style: textStyle.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 10,
                    ),
                  ),
                ),
              ],
            ),
      // : GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //       crossAxisSpacing: 10.0,
      //       mainAxisSpacing: 10.0,
      //     ),
      //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //     itemCount: providerSkin.listSkins.length,
      //     itemBuilder: (_, index) {
      //       final skin = providerSkin.listSkins[index];

      //       return Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(15),
      //           image: DecorationImage(
      //             image: NetworkImage(
      //               skin.newDisplayAsset?.materialInstances[0].images
      //                       .background ??
      //                   'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
      //             ),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.all(5.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               Text(
      //                 skin.layout.name,
      //                 style: textStyle.copyWith(
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     },
      //   ),
    );
  }
}
