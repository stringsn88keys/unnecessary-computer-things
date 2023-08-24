loadstar_root=ENV['LOADSTAR_ROOT'] || "E:/LOADSTAR/Compleat LOADSTAR/LS64"

vice_locations = {
  c64: "E:/Emu/GTK3VICE-3.6.1-win64/bin/x64sc.exe"

}


files=Dir[File.join(loadstar_root,"**/*.d64")].each do |file|
  puts file
  command="#{vice_locations[:c64]} -autostart \"#{file}\""
  Kernel.system(command)
end
