require 'rails_helper'
require 'support/firered_bedroom_helper'

RSpec.describe Game::MapReader, type: :service do
  describe '.fetch_map_header' do
    it 'returns the correct map header data' do
      expected_map_header = {
        "map_layout": 137_188_092,
        "events": 138_123_148,
        "map_scripts": 135_695_523,
        "connections": 0,
        "music": 300,
        "map_layout_id": 2,
        "region_map_section_id": 88,
        "cave": 0, "weather": 0,
        "map_type": 8,
        "biking_allowed": 0,
        "allow_escaping": false,
        "allow_running": false,
        "show_map_name": 0,
        "floor_num": nil,
        "battle_type": nil
      }

      expect(Game::MapReader.fetch_map_header).to eq(expected_map_header)
    end
  end

  describe '.fetch_map_dimensions' do
    it 'returns the correct map dimensions' do
      expected_map_dimensions = { map_width: 27, map_height: 23 }
      map_dimensions = Game::MapReader.fetch_map_dimensions

      expect(map_dimensions[:map_width]).to eq(expected_map_dimensions[:map_width])
      expect(map_dimensions[:map_height]).to eq(expected_map_dimensions[:map_height])
    end
  end
end

RSpec.describe Game::TileReader, type: :service do
  describe '.fetch_metatile_behaviors' do
    it 'returns the correct metatile_behaviors' do
      expected_metatile_behaviors = %w[0 0 0 0 0 0 0 6f 0 0 0 0 0 0 0 0 0 0 0 65
                                       0 0 0 0 0 0 0 0 0 6c 0 0 0 0 0 0 0 0 0 0 0 0 9d 0 0 0 0 0 8b 8a 8a 81 81 86 89 89 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 60 86 83 83 0 0 0 0 0 0 0 0 0 0 0 97 0 0 0 81 81 97 0 0 0 0 0 0 0 0 0 9b 0 0 0 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 97 0 0 0 0 0 0 0 0 9c 0 0 0 85 85 84 0 0 0 0 0 0 0 0 0 0 0 0 8b 89 89 81 90 0 0 0 0 0 0 0 0 9c 94 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6f 0 0 0 8a 8a 0 0 0 81 81 65 0 0 0 0 0 0 0 0 0 0 6c 0 0 0 0 0 94 94 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8b 89 89 81 90 0 0 0 0 0 0 0 0 0 94 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6f 0 0 0 8a 8a 0 0 0 81 81 65 0 0 0 0 0 0 0 0 0 0 6c 0 0 0 0 0 94 94 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9d 9c 0 60 0 0 0 0 0 0 0 0 0 0 0 0 85 85 0 0 0 0 0 60 0 0 0 0 0 94 0 0 0 81 0 0 0 0 0 0 0 81 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6c 0 0 0 6d 6e 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6d 6e 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33 0 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 81 91 0 0 81 91 83 93 81 91 11e 12e 8e 9e 0 0 88 98 0 0 86 96 0 0 81 91 0 0 81 91 a0 b0 81 91 a2 b2 81 91 a4 b4 cc dc 0 0 105 115 0 0 107 117 0 0 162 172 8a 9a e2 dc 8a 9a 81 91 c0 d0 81 91 c2 d2 81 91 c4 d4 cc dc 0 0 125 135 0 0 127 137 0 0 81 91 8c 9c 81 91 8c 9c 81 91 e0 f0 81 91 e2 f2 81 91 e4 f4 ac bc 0 0 ae be 0 0 81 91 b7 c7 81 91 b8 d2 81 91 83 ee a6 b6 0 0 a8 b2 0 0 aa b4 0 0 a2 b2 0 0 a2 b2 0 0 81 91 d7 e7 81 91 c2 e9 81 91 fe 10e 81 91 d7 c7 81 91 0 0 81 91 b7 c7 81 91 b8 d2 c2 d2 0 0 c2 d2 8a 9a c2 d2 8c 9c 88 98 0 0 81 91 d7 e7 81 91 0 e9 81 91 d7 e7 81 91 c2 e9 81 91 fe 0 164 174 8a 9a 102 112 11e 12e 102 91 83 93 81 91 0 0 81 91 0 df c2 d2 0 0 c2 d2 0 df 81 91 0 d8 81 91 0 e8 c2 d2 0 d8 c2 d2 0 e8 81 91 140 150 81 91 0 e8 c2 d2 0 e8 e6 f6 0 0 e2 f8 0 0 e4 fa 0 0 c6 d6 0 0 c4 d4 c4 d4 a2 b2 0 0 cf b2 0 0 df b2 0 0 1a0 1a2 8e 0 123 113 0 0 81 91 16c 17c cc dc 0 0 11c 12c 0 0 100 110 0 0 102 112 0 0 102 112 0 0 146 91 0 0 81 91 0 0 108 118 0 0 10a 11a 0 0 13c 12c 0 0 120 110 0 0 81 91 0 0 122 112 0 0 81 156 0 0 81 91 0 0 128 138 0 0 12a 13a 0 0 81 91 b8 d2 120 130 0 0 122 132 0 0 122 132 0 0 144 154 0 0 142 152 0 0 142 152 0 0 d7 c7 0 0 c2 d2 0 0 c2 d2 0 0 c2 e9 0 b7 142 152 b7 c7 142 152 b8 d2 142 152 a4 b4 142 152 a0 b0 e2 f2 0 0 e2 f2 17c 17d c2 b2 0 0 a2 b2 0 0 90 90 0 0 148 158 0 0 14a 15a 0 0 14a 15a 0 0 81 91 17e 0 81 91 17f 0 160 15a 0 0 14e 15a 0 0 102 112 0 0 14c 158 0 0 14e 15a 0 0 14e 15a 0 0 1a0 1a2 a0 b0 1a0 1a2 a4 b4 14e 170 0 0 14e 15a 0 0 14c 148 0 0 14c 15c 0 0 14e 15e 0 0 14e 15e 0 0 14a 15e 0 0 102 112 b7 c7 81 91 0 0 81 91 166 176 81 91 168 178 81 91 0 0 14e 158 e2 f2 14a 15a c0 d0 14e 15a c4 d4 81 91 d7 e7 14e 15a e0 f0 14e 15a e2 f2 14e 15a e4 f4 14e 15d c0 d0 14e 159 e2 f2 14e 15a c0 d0 14e 15a c4 d4 81 131 d7 e7 81 91 83 93 144 154 d7 e7]
      metatile_behaviors = Game::TileReader.fetch_metatile_behaviors

      expect(metatile_behaviors).to eq(expected_metatile_behaviors)
    end
  end
end
