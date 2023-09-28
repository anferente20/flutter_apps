// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_app.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThemeAppCollection on Isar {
  IsarCollection<ThemeApp> get themeApps => this.collection();
}

const ThemeAppSchema = CollectionSchema(
  name: r'ThemeApp',
  id: 3839805646408873045,
  properties: {
    r'isDarkMode': PropertySchema(
      id: 0,
      name: r'isDarkMode',
      type: IsarType.bool,
    ),
    r'selectedColor': PropertySchema(
      id: 1,
      name: r'selectedColor',
      type: IsarType.long,
    )
  },
  estimateSize: _themeAppEstimateSize,
  serialize: _themeAppSerialize,
  deserialize: _themeAppDeserialize,
  deserializeProp: _themeAppDeserializeProp,
  idName: r'isarID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _themeAppGetId,
  getLinks: _themeAppGetLinks,
  attach: _themeAppAttach,
  version: '3.1.0+1',
);

int _themeAppEstimateSize(
  ThemeApp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _themeAppSerialize(
  ThemeApp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isDarkMode);
  writer.writeLong(offsets[1], object.selectedColor);
}

ThemeApp _themeAppDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThemeApp(
    isDarkMode: reader.readBool(offsets[0]),
    selectedColor: reader.readLong(offsets[1]),
  );
  object.isarID = id;
  return object;
}

P _themeAppDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _themeAppGetId(ThemeApp object) {
  return object.isarID ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _themeAppGetLinks(ThemeApp object) {
  return [];
}

void _themeAppAttach(IsarCollection<dynamic> col, Id id, ThemeApp object) {
  object.isarID = id;
}

extension ThemeAppQueryWhereSort on QueryBuilder<ThemeApp, ThemeApp, QWhere> {
  QueryBuilder<ThemeApp, ThemeApp, QAfterWhere> anyIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ThemeAppQueryWhere on QueryBuilder<ThemeApp, ThemeApp, QWhereClause> {
  QueryBuilder<ThemeApp, ThemeApp, QAfterWhereClause> isarIDEqualTo(Id isarID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarID,
        upper: isarID,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterWhereClause> isarIDNotEqualTo(
      Id isarID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterWhereClause> isarIDGreaterThan(
      Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarID, includeLower: include),
      );
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterWhereClause> isarIDLessThan(Id isarID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarID, includeUpper: include),
      );
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterWhereClause> isarIDBetween(
    Id lowerIsarID,
    Id upperIsarID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarID,
        includeLower: includeLower,
        upper: upperIsarID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ThemeAppQueryFilter
    on QueryBuilder<ThemeApp, ThemeApp, QFilterCondition> {
  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> isDarkModeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDarkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> isarIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarID',
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> isarIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarID',
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> isarIDEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> isarIDGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> isarIDLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarID',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> isarIDBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> selectedColorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedColor',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition>
      selectedColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedColor',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> selectedColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedColor',
        value: value,
      ));
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterFilterCondition> selectedColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ThemeAppQueryObject
    on QueryBuilder<ThemeApp, ThemeApp, QFilterCondition> {}

extension ThemeAppQueryLinks
    on QueryBuilder<ThemeApp, ThemeApp, QFilterCondition> {}

extension ThemeAppQuerySortBy on QueryBuilder<ThemeApp, ThemeApp, QSortBy> {
  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> sortByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.asc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> sortByIsDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.desc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> sortBySelectedColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.asc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> sortBySelectedColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.desc);
    });
  }
}

extension ThemeAppQuerySortThenBy
    on QueryBuilder<ThemeApp, ThemeApp, QSortThenBy> {
  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> thenByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.asc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> thenByIsDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDarkMode', Sort.desc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> thenByIsarID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.asc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> thenByIsarIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarID', Sort.desc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> thenBySelectedColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.asc);
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QAfterSortBy> thenBySelectedColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedColor', Sort.desc);
    });
  }
}

extension ThemeAppQueryWhereDistinct
    on QueryBuilder<ThemeApp, ThemeApp, QDistinct> {
  QueryBuilder<ThemeApp, ThemeApp, QDistinct> distinctByIsDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDarkMode');
    });
  }

  QueryBuilder<ThemeApp, ThemeApp, QDistinct> distinctBySelectedColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedColor');
    });
  }
}

extension ThemeAppQueryProperty
    on QueryBuilder<ThemeApp, ThemeApp, QQueryProperty> {
  QueryBuilder<ThemeApp, int, QQueryOperations> isarIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarID');
    });
  }

  QueryBuilder<ThemeApp, bool, QQueryOperations> isDarkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDarkMode');
    });
  }

  QueryBuilder<ThemeApp, int, QQueryOperations> selectedColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedColor');
    });
  }
}
