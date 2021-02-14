import 'package:flutter/material.dart';
import 'package:moncov/consttants.dart';
import 'package:moncov/api/provinsimodel.dart';
import 'package:moncov/api/provinsiviewmodel.dart';

class ProvinsiScreen extends StatefulWidget {
  @override
  _ProvinsiScreenState createState() => _ProvinsiScreenState();
}

class _ProvinsiScreenState extends State<ProvinsiScreen> {
  List<ProvinsiModel> dataProvinsi = new List();
  void getDataProvinsi() {
    ProvinsiViewModel().getProvinsi().then((value) {
      setState(() {
        dataProvinsi = value;
      });
    });
  }

  Padding dataBody() {
    return Padding(
      padding: EdgeInsets.zero,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text(
              'Provinsi',
              style: judultable,
            ),
          ),
          DataColumn(
            label: Text('Positif', style: judultable),
          ),
          DataColumn(
            label: Text('Sembuh', style: judultable),
          ),
          DataColumn(
            label: Text('Meninggal', style: judultable),
          ),
        ],
        rows: dataProvinsi
            .map(
              (data) => DataRow(
                cells: [
                  DataCell(
                    Text(
                      data.attributes.provinsi,
                      style: provinsitable,
                    ),
                  ),
                  DataCell(
                    Text(
                      data.attributes.kasusPosi.toString(),
                      style: isitable,
                    ),
                  ),
                  DataCell(
                    Text(
                      data.attributes.kasusSemb.toString(),
                      style: isitable,
                    ),
                  ),
                  DataCell(
                    Text(
                      data.attributes.kasusMeni.toString(),
                      style: isitable,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataProvinsi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            dataBody(),
          ],
        ),
      ),
    );
  }
}
