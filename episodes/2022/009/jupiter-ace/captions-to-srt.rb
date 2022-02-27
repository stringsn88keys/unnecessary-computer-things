caption={}
captions=[]

final_caption_pad=15


ARGF.each do |line|
  puts line
  if /^\d+:\d+$/ =~ line
    mm,ss=line.split(':').map(&:to_i)
    timemark = "00:%02d:%02d,000" % [mm,ss]
    if caption != {}
      caption[:end] = timemark
      captions << caption
    end
    caption = {}
    caption[:start] = timemark
    caption[:end] = "00:%02d:%02d,000" % [mm+((ss+final_caption_pad)/60),(ss+final_caption_pad)%60]
    caption[:lines] = []
    next
  end
  caption[:lines] << line.chomp unless line =~ /^\s*$/
end

captions << caption

captions.each_with_index do |caption, line|
  puts line
  puts "#{caption[:start]} --> #{caption[:end]}"
  caption[:lines].each do |l|
    puts l
  end
  puts ""
end

