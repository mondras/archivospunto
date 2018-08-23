MIMES = %w(
  application/apple-diskimage
  application/compress
  application/epub+zip
  application/excel
  application/font-woff
  application/gpx+xml
  application/gzip
  application/iso-image
  application/json
  application/mobipocket-ebook
  application/mp4
  application/msword
  application/octet-stream
  application/pdf
  application/pdf
  application/pkicert
  application/postscript
  application/python
  application/rar-compressed
  application/vnd.oasis.opendocument.text
  application/vnd.openxmlformats-officedocument.presentationml.presentation
  application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  application/vnd.openxmlformats-officedocument.wordprocessingml.document
  application/x-apple-diskimage
  application/x-bzip2
  application/x-gtar
  application/x-gzip
  application/x-tgz
  application/zip
  audio/midi
  audio/mpeg
  image/png
  text/calendar
  text/comma-separated-values
  text/comma-separated-values
  text/html
  text/plain
  text/tab-separated-values
  text/vcalendar
  video/quicktime
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
