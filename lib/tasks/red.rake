namespace :red do
  task loop: :environment do
    # raise NotImplementedError
    # # 1. debug by just running the prompt multiple times with reload
    # # 2. try to cut down on what we are saving to the memories
    loop do
      Intelligence::ConversationHandler.handle_conversation
      Game::MemoryMaker.create_location_memory
      Game::MemoryMaker.create_destination_list_memory
      x, y, description, explanation = Intelligence::LocomotionHandler.calculate_path
      Game::MemoryMaker.create_chosen_location_memory(x, y, description, explanation)
      begin
        Game::Charter.chart_path(x:, y:)
      rescue Game::PathNotFoundError
        ap 'Path not found error, continuing'
        next
      end
      Retroarch::KeyboardService.a
    end
  end

  task launch_game: :environment do
    command = [
      '/Applications/RetroArch.app/Contents/MacOS/RetroArch',
      '-L "/Users/andrew/Library/Application Support/RetroArch/cores/mgba_libretro.dylib"',
      Rails.root.join('db', 'data', 'games', 'firered.gba').to_s,
      "--appendconfig=#{Rails.root.join('db', 'data', 'retroarch_config', 'live-savestate.cfg')}"
    ].join(' ')

    system(command)
    puts 'Game launched successfully'
  end
end
