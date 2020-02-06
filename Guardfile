# guard

ignore(/.git/)
ignore(/.rspec_status/)
ignore(/Gemfile.lock/)
ignore(/node_modules/)

watch(/.*/) do |file, _|
  puts "\n" + '=' * 80 + "\n"
  system "rubocop --auto-correct #{file}"
  puts "\n" + '-' * 80 + "\n"
  system 'rspec'
end
