import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'detail_surah_model.dart';
import 'remote_resource.dart';

class DetailSurahPage extends StatefulWidget {
  final int id;

  const DetailSurahPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailSurahPage> createState() =>
      _DetailSurahPageState();
}

class _DetailSurahPageState
    extends State<DetailSurahPage> {
  final RemoteResource remoteResource =
      RemoteResource();

  late AudioPlayer player;

  DetailSurahData? detailSurah;

  bool isLoading = true;
  String errorMessage = '';

  int currentAyahIndex = 0;

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();

    player = AudioPlayer();

    loadSurah();

    player.positionStream.listen((value) {
      if (mounted) {
        setState(() {
          position = value;
        });
      }
    });

    player.durationStream.listen((value) {
      if (mounted) {
        setState(() {
          duration = value ?? Duration.zero;
        });
      }
    });

    player.currentIndexStream.listen((index) {
      if (mounted && index != null) {
        setState(() {
          currentAyahIndex = index;
        });
      }
    });
  }

  Future<void> loadSurah() async {
    try {
      final data =
          await remoteResource.fetchSurahDetail(
        widget.id,
      );

      if (data != null) {
        detailSurah = data;

        final audioSources = data.ayahs
            .where(
              (ayah) =>
                  ayah.audio != null &&
                  ayah.audio!.isNotEmpty,
            )
            .map(
              (ayah) => AudioSource.uri(
                Uri.parse(ayah.audio!),
              ),
            )
            .toList();

        if (audioSources.isNotEmpty) {
          await player.setAudioSources(
            audioSources,
          );
        }
      }

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = e.toString();
          isLoading = false;
        });
      }
    }
  }

  Future<void> playAyah(int index) async {
    if (detailSurah == null) {
      return;
    }

    if (index < 0 ||
        index >= detailSurah!.ayahs.length) {
      return;
    }

    try {
      await player.seek(
        Duration.zero,
        index: index,
      );

      await player.play();

      setState(() {
        currentAyahIndex = index;
      });
    } catch (e) {
      debugPrint(
        'Gagal memutar audio: $e',
      );
    }
  }

  Future<void> togglePlay() async {
    if (player.playing) {
      await player.pause();
    } else {
      await player.play();
    }

    setState(() {});
  }

  Future<void> playPrevious() async {
    if (currentAyahIndex > 0) {
      await playAyah(
        currentAyahIndex - 1,
      );
    }
  }

  Future<void> playNext() async {
    if (detailSurah == null) {
      return;
    }

    if (currentAyahIndex <
        detailSurah!.ayahs.length - 1) {
      await playAyah(
        currentAyahIndex + 1,
      );
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int number) {
      return number.toString().padLeft(2, '0');
    }

    final minutes = twoDigits(
      duration.inMinutes.remainder(60),
    );

    final seconds = twoDigits(
      duration.inSeconds.remainder(60),
    );

    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          detailSurah?.englishName ??
              'Detail Surah',
        ),
      ),
      body: buildBody(),
      bottomNavigationBar:
          buildAudioController(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 50,
              ),
              const SizedBox(height: 12),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = true;
                    errorMessage = '';
                  });

                  loadSurah();
                },
                child: const Text(
                  'Coba Lagi',
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (detailSurah == null) {
      return const Center(
        child: Text(
          'Data surah tidak ditemukan',
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 120,
      ),
      children: [
        buildSurahHeader(),
        const SizedBox(height: 12),
        buildAyahList(),
      ],
    );
  }

  Widget buildSurahHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            detailSurah?.name ?? '',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            detailSurah?.englishName ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            detailSurah?.englishNameTranslation ?? '',
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Text(
                detailSurah?.revelationType ?? '',
              ),
              const SizedBox(width: 12),
              Text(
                '${detailSurah?.numberOfAyahs ?? 0} Ayat',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAyahList() {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(),
      itemCount: detailSurah!.ayahs.length,
      itemBuilder: (context, index) {
        final ayah =
            detailSurah!.ayahs[index];

        final isPlaying =
            currentAyahIndex == index &&
            player.playing;

        return buildAyahCard(
          ayah,
          index,
          isPlaying,
        );
      },
    );
  }

  Widget buildAyahCard(
    Ayat ayah,
    int index,
    bool isPlaying,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPlaying
            ? Theme.of(context)
                .colorScheme
                .primaryContainer
            : Theme.of(context)
                .colorScheme
                .surfaceContainerHighest,
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
                child: Text(
                  '${ayah.numberInSurah ?? index + 1}',
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: () {
                  playAyah(index);
                },
                icon: Icon(
                  isPlaying
                      ? Icons.volume_up
                      : Icons.play_circle_outline,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Text(
            ayah.text ?? '',
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 26,
              height: 2,
            ),
          ),

          const SizedBox(height: 20),

          const Divider(),

          const SizedBox(height: 12),

          Text(
            ayah.translation ?? '',
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAudioController() {
    if (detailSurah == null ||
        detailSurah!.ayahs.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxDuration = duration.inMilliseconds
        .toDouble();

    final currentPosition =
        position.inMilliseconds.toDouble();

    final sliderMax =
        maxDuration > 0 ? maxDuration : 1.0;

    final sliderValue =
        currentPosition.clamp(
      0.0,
      sliderMax,
    );

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: 0.15,
              ),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              value: sliderValue,
              max: sliderMax,
              onChanged: maxDuration <= 0
                  ? null
                  : (value) {
                      player.seek(
                        Duration(
                          milliseconds:
                              value.toInt(),
                        ),
                      );
                    },
            ),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(position),
                ),
                Text(
                  'Ayat ${currentAyahIndex + 1}',
                ),
                Text(
                  formatDuration(duration),
                ),
              ],
            ),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: playPrevious,
                  icon: const Icon(
                    Icons.skip_previous,
                  ),
                  iconSize: 32,
                ),

                const SizedBox(width: 12),

                IconButton(
                  onPressed: togglePlay,
                  icon: Icon(
                    player.playing
                        ? Icons.pause_circle
                        : Icons.play_circle,
                  ),
                  iconSize: 52,
                ),

                const SizedBox(width: 12),

                IconButton(
                  onPressed: playNext,
                  icon: const Icon(
                    Icons.skip_next,
                  ),
                  iconSize: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}