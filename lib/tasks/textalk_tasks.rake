namespace :textalk do
  desc "Download a copy of all the articles."
  task :download, [:file_path] => :environment  do |t, args|
    require "textalk/backup"
    excel = Textalk::Backup.download
    File.write(args.file_path, excel)
  end

  desc "Download all article images."
  task :download_images, [:folder_path] => :environment  do |t, args|
    require "textalk/backup"
    Textalk::Backup.download_images(args.folder_path)
  end
end
