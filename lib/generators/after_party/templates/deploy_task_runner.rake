namespace :after_party do
  task :run => :environment do
    require File.join(Rails.root, 'lib/data_version_file.rb')
    tasks = DataVersionFile.pending_files.map {|f| "after_party:#{f.task_name}"}

    tasks.each {|t| Rake::Task[t].invoke}

    if tasks.empty?
      puts "no pending tasks to run"
    end

  end
end