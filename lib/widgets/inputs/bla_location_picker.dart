import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/services/locations_service.dart';
import 'package:blablacar/theme/theme.dart';
import 'package:blablacar/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

class BlaLocationPicker extends StatefulWidget {
  final Location? initLocation;
  const BlaLocationPicker({super.key, required this.initLocation});

  @override
  State<BlaLocationPicker> createState() => _BlaLocationPickerState();
}

class _BlaLocationPickerState extends State<BlaLocationPicker> {
  String currentSearchBar = "";

  void onTap(Location location) {
    Navigator.pop<Location>(context, location);
  }

  void onBackTap() {
    Navigator.pop<Location>(context);
  }

  void onChanged(String search) {
    setState(() {
      currentSearchBar = search;
    });
  }

  List<Location> get filteredLocation {
    if (currentSearchBar.length > 1) {
      return LocationsService.availableLocations
          .where(
            (location) => location.name.toUpperCase().contains(
              currentSearchBar.toUpperCase(),
            ),
          )
          .toList();
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    if (widget.initLocation != null) {
      setState(() {
        currentSearchBar = widget.initLocation!.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            SearchBar(
              initSearch: currentSearchBar,
              onBackTap: onBackTap,
              onChanged: onChanged,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocation.length,
                itemBuilder: (context, index) => LocationTile(
                  location: filteredLocation[index],
                  onTap: onTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final String initSearch;
  final VoidCallback onBackTap;
  final ValueChanged<String> onChanged;

  const SearchBar({
    super.key,
    required this.initSearch,
    required this.onBackTap,
    required this.onChanged,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void onClearTap() {
    _searchController.clear();
  }

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initSearch;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get searchIsNotEmpty => _searchController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BlaColors.greyLight,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: widget.onBackTap,
            icon: Icon(
              Icons.arrow_back_ios,
              color: BlaColors.iconLight,
              size: 16,
            ),
          ),

          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _searchController,
              onChanged: widget.onChanged,
              style: TextStyle(color: BlaColors.textLight),
              decoration: InputDecoration(
                hintText: "Any city, street...",
                border: InputBorder.none,
                filled: false,
              ),
            ),
          ),

          searchIsNotEmpty
              ? IconButton(
                  onPressed: onClearTap,
                  icon: Icon(Icons.close, color: BlaColors.iconLight, size: 16),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
    ;
  }
}

class LocationTile extends StatelessWidget {
  final Location location;
  final ValueChanged<Location> onTap;

  const LocationTile({super.key, required this.location, required this.onTap});

  String get title => location.name;

  String get subTitle => location.country.name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onTap(location),
          leading: Icon(Icons.history, color: BlaColors.iconLight),

          title: Text(title, style: BlaTextStyles.body),
          subtitle: Text(
            subTitle,
            style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
          ),

          trailing: Icon(
            Icons.arrow_forward_ios,
            color: BlaColors.iconLight,
            size: 16,
          ),
        ),
        BlaDivider(),
      ],
    );
  }
}
