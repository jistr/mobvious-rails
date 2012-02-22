guard 'minitest' do
  watch(%r|^spec/(.*)_spec\.rb|)
  watch(%r|^lib/(.*)\.rb|)            { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r|^spec/spec_helper\.rb|)    { "spec" }
end

guard 'coffeescript', output: 'tmp/javascripts-compiled', hide_success: true do
  watch(/^app\/assets\/javascripts\/(.*).coffee/)
end

guard 'coffeescript', output: 'tmp/spec-javascripts-compiled', hide_success: true do
  watch(/^spec\/javascripts\/(.*).coffee/)
end

