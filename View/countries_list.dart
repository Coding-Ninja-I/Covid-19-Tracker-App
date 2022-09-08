import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/View/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
       // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                }, //So that if you write 'ind', it will change and display India
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with country name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: statesServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white),
                                    subtitle: Container(
                                        height: 10,
                                        width: 89,
                                        color: Colors.white),
                                    leading: Container(
                                        height: 10,
                                        width: 50,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            String country_name = snapshot.data![index][
                                'country']; // For typing "ind" in the search option and it shows the respective country

                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text("Cases : " +
                                        snapshot.data![index]['cases']
                                            .toString()),
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                    trailing: Wrap(
                                      spacing: 12,
                                      children: <Widget>[
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailScreen(
                                                            name:
                                                                snapshot.data![
                                                                        index]
                                                                    ['country'],
                                                            image: snapshot.data![
                                                                        index][
                                                                    'countryInfo']
                                                                ['flag'],
                                                            totalCases: snapshot
                                                                    .data![
                                                                index]['cases'],
                                                            totalRecovered:
                                                                snapshot.data![
                                                                        index][
                                                                    'recovered'],
                                                            totalDeaths:
                                                                snapshot.data![
                                                                        index]
                                                                    ['deaths'],
                                                            todayRecovered:
                                                                snapshot.data![
                                                                        index][
                                                                    'todayRecovered'],
                                                            critical: snapshot
                                                                        .data![
                                                                    index]
                                                                ['critical'],
                                                            active:
                                                                snapshot.data![
                                                                        index]
                                                                    ['active'],
                                                            test: snapshot
                                                                    .data![
                                                                index]['tests'],
                                                            continent: snapshot
                                                                        .data![
                                                                    index]
                                                                ['continent'],
                                                          )));
                                            },
                                            icon: Icon(Icons.arrow_forward_ios))
                                      ],
                                    ),
                                  )
                                ],
                              );
                            } else if (country_name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Column(
                                children: [
                                  ListTile(
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text("Cases : " +
                                        snapshot.data![index]['cases']
                                            .toString()),
                                    leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                    trailing: Wrap(
                                      spacing: 12,
                                      children: <Widget>[
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailScreen(
                                                            name:
                                                                snapshot.data![
                                                                        index]
                                                                    ['country'],
                                                            image: snapshot.data![
                                                                        index][
                                                                    'countryInfo']
                                                                ['flag'],
                                                            totalCases: snapshot
                                                                    .data![
                                                                index]['cases'],
                                                            totalRecovered:
                                                                snapshot.data![
                                                                        index][
                                                                    'recovered'],
                                                            totalDeaths:
                                                                snapshot.data![
                                                                        index]
                                                                    ['deaths'],
                                                            todayRecovered:
                                                                snapshot.data![
                                                                        index][
                                                                    'todayRecovered'],
                                                            critical: snapshot
                                                                        .data![
                                                                    index]
                                                                ['critical'],
                                                            active:
                                                                snapshot.data![
                                                                        index]
                                                                    ['active'],
                                                            test: snapshot
                                                                    .data![
                                                                index]['tests'],
                                                            continent: snapshot
                                                                        .data![
                                                                    index]
                                                                ['continent'],
                                                          )));
                                            },
                                            icon: Icon(Icons.arrow_forward_ios))
                                      ],
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
