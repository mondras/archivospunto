Maid.rules do
  rule 'Delete day old images' do
    dir('~/Downloads/*').each do |path|
      next unless media_type(path) == 'image'
			if 1.day.since?(accessed_at(path))
        trash(path)
      end
    end
  end
end

