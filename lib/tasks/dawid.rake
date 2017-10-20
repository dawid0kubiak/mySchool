namespace :dawid do
  desc "TODO"
  task reinstall: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    puts 'Koniec'
  end

end
