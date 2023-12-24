import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final _movies = [
    Movie(
        id: 1,
        imageName: 'images/American_Psycho.jpg',
        title: 'Американский психопат',
        time: 'Март 16, 2023',
        description:
            'Днем он ничем не отличается от окружающих, и в толпе вы не обратите на него внимания. Но ночью этот благовоспитанный гражданин превращается в изощренного убийцу, терроризирующего спящий город. Современный дикарь, презирающий законы человечества, питается только испепеляющим пламенем своей ненависти, которая растет с каждым новым преступлением.'),
    Movie(
      id: 2,
      imageName: 'images/Drive.jpg',
      title: 'Драйв',
      time: 'Май 20, 2011',
      description:
          'Великолепный водитель – при свете дня он выполняет каскадерские трюки на съёмочных площадках Голливуда, а по ночам ведет рискованную игру. Но один опасный контракт – и за его жизнь назначена награда.',
    ),
    Movie(
      id: 3,
      imageName: 'images/Batman.jpg',
      title: 'Бэтмен',
      time: 'Март 1, 2022',
      description:
          'После двух лет поисков правосудия на улицах Готэма Бэтмен становится для горожан олицетворением беспощадного возмездия. Когда в городе происходит серия жестоких нападений на высокопоставленных чиновников, улики приводят Брюса Уэйна в самые тёмные закоулки преступного мира, где он встречает Женщину-Кошку, Пингвина, Кармайна Фальконе и Загадочника.',
    ),
    Movie(
      id: 4,
      imageName: 'images/John_Weak.jpg',
      title: 'Джон Уик',
      time: 'Сентябрь 19, 2014',
      description:
          'Джон Уик - на первый взгляд, самый обычный среднестатистический американец, который ведет спокойную мирную жизнь. Однако мало кто знает, что он был наёмным убийцей, причём одним из лучших профессионалов в своём деле.',
    ),
    Movie(
      id: 5,
      imageName: 'images/Inland.jpg',
      title: 'Остров Проклятых',
      time: 'Февраль 13, 2010',
      description:
          'Два американских судебных пристава отправляются на один из островов в штате Массачусетс, чтобы расследовать исчезновение пациентки клиники для умалишенных преступников. При проведении расследования им придется столкнуться с паутиной лжи, обрушившимся ураганом и смертельным бунтом обитателей клиники.',
    ),
    Movie(
      id: 6,
      imageName: 'images/Breaking_Bad.jpg',
      title: 'Во все тяжкие',
      time: 'Январь 20, 2008',
      description:
          'Школьный учитель химии Уолтер Уайт узнаёт, что болен раком лёгких. Учитывая сложное финансовое состояние дел семьи, а также перспективы, Уолтер решает заняться изготовлением метамфетамина. Для этого он привлекает своего бывшего ученика Джесси Пинкмана, когда-то исключённого из школы при активном содействии Уайта.',
    ),
  ];

  var _filteredMovievs = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovievs = _movies.where((Movie movie) {
        return movie.title.toUpperCase().contains(query.toUpperCase());
      }).toList();
    } else {
      _filteredMovievs = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovievs = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTab(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_page/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovievs.length,
          itemExtent: 200,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovievs[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2)),
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(movie.imageName),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onMovieTab(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}
