import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/api/client.dart';
import 'package:home/models/auth/residentials.dart';
import 'package:home/pages/search/search_error.dart';
import 'package:home/pages/search/search_head.dart';
import 'package:home/pages/search/search_on_wait.dart';
import 'package:home/pages/search/search_result.dart';
import 'package:home/store/application_state.dart';
import 'package:home/widgets/checkbox/main.dart';
import 'package:home/widgets/footer/main_footer.dart';
import 'package:text_divider/text_divider.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchTerm = '';

  // List<dynamic> _data = [];
  bool _isSearch = false;
  TextEditingController searchController = TextEditingController();
  int? _getResidentialErrorCode;
  ResidentialList? _residentialList;

  int _page = 0;

  void setPage(page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    req();

    searchController.addListener(_updateSearchTerm);
  }

  @override
  void dispose() {
    searchController.removeListener(_updateSearchTerm);
    super.dispose();
  }

  void req() async {
    final client = DioClient();
    try {
      final response = await client.get("residential/rent");
      final newData = ResidentialList.fromJson(response);

      setState(() {
        _residentialList = newData;
      });
    } on DioException catch (e) {
      final errorData = e.response?.data;

      setState(() {
        _getResidentialErrorCode = e.response?.statusCode;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "${e.response?.statusCode}: ${errorData['error']}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Unable to connect to server",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ));
      }
    }
  }

  void _updateSearchTerm() {
    setState(() {
      _searchTerm = searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: ((store) => store.state),
      builder: (ctx, vm) {
        return Container(
          decoration: BoxDecoration(
              color: vm.theme.brightness == Brightness.light
                  ? Colors.white
                  : Colors.grey.shade900),
          child: _getResidentialErrorCode == 401
              ? const SearchError()
              : _residentialList == null
                  ? const SearchOnWait()
                  : SearchResult(
                      residentialList: _residentialList!,
                      vm: vm,
                    ),
        );
      },
    );
  }
}


// return SingleChildScrollView(