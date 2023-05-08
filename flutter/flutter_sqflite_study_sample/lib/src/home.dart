import 'package:flutter/material.dart';
import 'package:flutter_sqflite_study_sample/src/model/sample.dart';
import 'package:flutter_sqflite_study_sample/src/repository/sql_sample_crud_repository.dart';
import 'package:flutter_sqflite_study_sample/src/utils/data.dart';
import 'detail_view.dart';

class Home extends StatefulWidget {
  // const Home({super.key});
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void createRandomSample() async {
    var value = DataUtils.randomValue();
    var sample = Sample(
      name: DataUtils.makeUUID(),
      value: value,
      yn: value % 2 == 0,
      createdAt: DateTime.now(),
    );
    await SqlSampleCrudRepository.create(sample);
    update();
  }

  // update() {
  //   setState(() {});
  // }
  update() => setState(() {});

  Widget _sampleOne(Sample sample) {
    return GestureDetector(
      onTap: () {
        print('onTap >>>>>>> ');
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => DetailView(sample: sample),
          ),
        )
            .then((context) {
          print('pop >>>>> ');
          // _loadSampleList();
          update();
        });
        //     .then((bool res) {
        //   // check here if you got your data or not
        //   if (res != null && res == true) {
        //     refreshPage();
        //   }
        // });
        // update();
      },
      // behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: sample.yn ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 7),
                Text(sample.name),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              sample.createdAt.toString(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Sample>> _loadSampleList() async {
    print('loadData ....>>>>>');
    return await SqlSampleCrudRepository.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite example'),
      ),
      body: FutureBuilder<List<Sample>>(
          future: _loadSampleList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Not support sqflite'),
              );
            }
            if (snapshot.hasData) {
              var datas = snapshot.data;
              return ListView(
                children: List.generate(
                    datas!.length, (index) => _sampleOne(datas[index])),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createRandomSample,
        child: const Icon(Icons.add),
      ),
    );
  }
}
