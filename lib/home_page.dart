import 'package:quran_flutter/remote_resource.dart';
import 'package:quran_flutter/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final remoteResource = RemoteResource();

  final List<Datum> surahList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final result = await remoteResource.fetchQuran();

      setState(() {
        surahList.addAll(result);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Al-Qur'an"),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: surahList.length,
              itemBuilder: (context, index) {
                final surah = surahList[index];

                return buildSurahCard(surah);
              },
            ),
    );
  }

  Widget buildSurahCard(Datum surah) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondaryContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withValues(
              alpha: 0.5,
            ),
            spreadRadius: 0.5,
            offset: const Offset(0, 0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          // Nanti pindah ke halaman detail
        },
        child: Row(
          spacing: 8,
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/jewish-star.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .colorScheme
                        .secondary,
                    BlendMode.srcIn,
                  ),
                  width: 52,
                  height: 52,
                ),
                Center(
                  child: Text(
                    '${surah.number}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    surah.englishNameTranslation ?? '',
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: [
                  Text(
                    surah.name ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${surah.numberOfAyahs} Ayat',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}