# Write your code below game_hash
def shoe_size(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      return player[:shoe] if player[:player_name] == player_name
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_data|
    return team_data[:colors] if team_data[:team_name] == team_name
  end
end

def team_names
  game_hash.map { |team, team_data| team_data[:team_name] }
end

def player_numbers(team_name)
  team_data = game_hash.find { |team, data| data[:team_name] == team_name }
  team_data[:players].map { |player| player[:number] }
end

def player_stats(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      return player if player[:player_name] == player_name
    end
  end
end

def big_shoe_rebounds
  player = game_hash.values.flat_map { |team_data| team_data[:players] }.max_by { |player| player[:shoe] }
  player[:rebounds]
end

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def most_points_scored
  game_hash.values.flat_map { |team_data| team_data[:players] }.max_by { |player| player[:points] }[:player_name]
end

def winning_team
  home_points = game_hash[:home][:players].sum { |player| player[:points] }
  away_points = game_hash[:away][:players].sum { |player| player[:points] }
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  game_hash.values.flat_map { |team_data| team_data[:players] }.max_by { |player| player[:player_name].length }[:player_name]
end

def long_name_steals_a_ton?
  player_with_longest_name == game_hash.values.flat_map { |team_data| team_data[:players] }.max_by { |player| player[:steals] }[:player_name]
end
