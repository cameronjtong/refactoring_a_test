# guard

ignore(/.idea/)
ignore(/.git/)
ignore(/.rspec_status/)
ignore(/Gemfile.lock/)
ignore(/node_modules/)

watch(/.*/) do |files|
  puts "\n" + '=' * 80 + "\n"
  file = files[0]
  puts "file:#{file}"
  system "rubocop --auto-correct #{file}"
  puts "\n" + '-' * 80 + "\n"
  system 'rspec'
end
