import 'package:flutter/material.dart';
import 'package:flutter_sqflite_study_sample/src/model/sample.dart';
import 'package:flutter_sqflite_study_sample/src/repository/sql_sample_crud_repository.dart';
import 'package:flutter_sqflite_study_sample/src/utils/data.dart';

class DetailView extends StatefulWidget {
  final Sample sample;
  const DetailView({super.key, required this.sample});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Future<Sample?> _loadSampleOne() async {
    return SqlSampleCrudRepository.getSampleOne(widget.sample.id!);
  }

  void update(Sample sample) async {
    double value = DataUtils.randomValue();
    var updateSample = sample.clone(yn: value.toInt() % 2 == 0, value: value);
    var result = await SqlSampleCrudRepository.update(updateSample);
    print(result);
    setState(() {});
  }

  void delete(Sample sample) async {
    var result = await SqlSampleCrudRepository.delete(sample.id!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.sample.id.toString(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder<Sample?>(
              future: _loadSampleOne(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Not foind data by id ${widget.sample.id}'));
                }
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'name : ${data!.name}',
                        style: const TextStyle(fontSize: 25),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'yn : ${widget.sample.yn}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'value : ${widget.sample.value}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'createdAt : ${widget.sample.createdAt}}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            update(data);
                          },
                          child: const Text('업데이트 랜덤 값')),
                      ElevatedButton(
                        onPressed: () {
                          delete(data);
                        },
                        child: const Text('삭제'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
        ));
  }
}
