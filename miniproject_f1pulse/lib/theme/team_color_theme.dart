class TeamColor {
  static Map<String, String> colors = {
    'Alfa Romeo': '#960000',
    'AlphaTauri': '#0B2A5B',
    'Alpine F1 Team': '#0090FF',
    'Aston Martin': '#006F62',
    'Ferrari': '#DC0000',
    'Haas F1 Team': '#B6BABD',
    'McLaren': '#FF8700',
    'Mercedes': '#00D2BE',
    'Red Bull Racing': '#0600EF',
    'Williams': '#005AFF',
  };

  static String get(String teamName) {
    return colors[teamName] ?? '#e10600';
  }
}
