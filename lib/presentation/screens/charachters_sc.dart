import 'package:bloc_breaking_bad/business_logic/cubit/charachter_cubit.dart';
import 'package:bloc_breaking_bad/data/models/charachter.dart';
import 'package:bloc_breaking_bad/presentation/widgets/charachterContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class charachtersScreen extends StatefulWidget {
  const charachtersScreen({super.key});

  @override
  State<charachtersScreen> createState() => _charachtersScreenState();
}

class _charachtersScreenState extends State<charachtersScreen> {
  late List<Character> allCharachters;
  List<Character> filtredList = [];
  bool isSearching = false;
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allCharachters =
        BlocProvider.of<CharachterCubit>(context).getAllCharachters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharachterCubit, CharachterState>(
      builder: (context, state) {
        if (state is CharachterLoaded) {
          allCharachters = state.charachters;
          return buildLoadedListWidget();
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return Column(
      children: [
        Container(
          height: kToolbarHeight,
          child: isSearching ? searchBar() : normalBar(),
        ),
        Expanded(
          child: GridView.builder(
            itemCount:filtredList.isEmpty?allCharachters.length:filtredList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 3 / 2),
            itemBuilder: (context, index) {
              return CharachtersContainer(character:filtredList.isEmpty?allCharachters[index]:filtredList[index]);
            },
          ),
        ),
      ],
    );
  }

  normalBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Text('charachters'),
        IconButton(onPressed: () {
          setState(() {
            isSearching=true;
          });
        }, icon: Icon(Icons.search))
      ],
    );
  }

  searchBar() {
    return Row(
      children: [
        BackButton(
          onPressed: () {
            setState(() {
              isSearching = false;
              filtredList=[];
              textEditingController.clear();
            });
          },
        ),
        Expanded(
          child: TextField(controller: textEditingController,decoration: InputDecoration(hintText: 'search.......'),onChanged: (value) {
            setState(() {
              filtredList=allCharachters.where((element) => element.name.toLowerCase().startsWith(value)).toList();
            });
          },),
        ),
        IconButton(onPressed: () {
          textEditingController.clear();
          filtredList=[];
        }, icon: Icon(Icons.dangerous_outlined))
      ],
    );
  }
}
