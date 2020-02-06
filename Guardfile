# guard

ignore(/.git/)
ignore(/node_modules/)

watch(/.*/) do |file, _|
  system "rubocop --auto-correct #{file}"
  system 'ruby *_test.rb'
end
