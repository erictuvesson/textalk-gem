namespace :textalk do
  desc "Download a copy of all the articles."
  task :download, [:file_path] => :environment  do |t, args|
    require "textalk/utils/backup"
    excel = Textalk::Utils::Backup.download
    File.write(args.file_path, excel)
  end

  desc "Download all article images."
  task :download_images, [:folder_path] => :environment  do |t, args|
    require "textalk/utils/backup"
    Textalk::Utils::Backup.download_images(args.folder_path)
  end
end
