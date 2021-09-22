require 'yaml'

mappings = YAML.parse(ARGF).to_ruby

symbolmap={}
mappings.each do |row, keyset|
  keyset['keys'].each do |symbol, keypress|
    symbolmap[symbol] = {keypress: keypress, cursor_mode: keyset['cursor_mode'], modifier: keyset['modifier']}
  end
end

puts "|symbol|key|cursor mode|modifier|"
puts "|------|---|-----------|--------|"
symbolmap.each_key.sort.each do |key|
  puts "|#{key}|#{symbolmap[key][:keypress]}|#{symbolmap[key][:cursor_mode]}|#{symbolmap[key][:modifier]}|"
end
