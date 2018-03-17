MIMES = %w(
  application/pdf
  application/vnd.openxmlformats-officedocument.presentationml.presentation
  application/zip
  application/iso-image
  application/x-gzip
  application/x-gtar
  application/x-tgz
  application/x-apple-diskimage
  application/x-bzip2
  text/calendar
  text/comma-separated-values
  text/plain
  text/html
)
Maid.rules do
  rule 'Delete day old documents' do
    dir('~/Downloads/*').each do |path|
      delete = false
      delete = true if media_type(path) == 'image'
      delete = true if MIMES.include?(mime_type(path))
			if 1.day.since?(accessed_at(path)) && delete
        trash(path)
      end
    end
  end

  rule 'Finances' do
    dir('~/Downloads/*.QFX').each do |path|
      if path.include?('9707')
        rename(path, "~/Library/Mobile Documents/com~apple~CloudDocs/accounting/inbox/9707.qfx")
      end
      if path.include?('8910')
        rename(path, "~/Library/Mobile Documents/com~apple~CloudDocs/accounting/inbox/8910.qfx")
      end
    end
  end
end
