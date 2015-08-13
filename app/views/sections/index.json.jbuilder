json.array!(@sections) do |section|
  json.extract! section, :id, :title
  json.url section_url(section, format: :json)
end
