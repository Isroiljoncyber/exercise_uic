mixin Queries {
  static String getAllCharacters = '''
  query Character {
    characters {
      results {
        created
        id
        image
        name
        status
          location 
            {
              name
              type
            }
          }
        } 
      }
  ''';

  static String getRequiredCharacter = r'''
          query Character($characterId: ID!) {
            character(id: $characterId) {
              gender
              id
              image
              location {
                dimension
                name
                type
              }
              name
              origin {
                dimension
                name
                type
              }
              species
              status
          }
      }
    ''';
}
