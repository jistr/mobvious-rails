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

  callback(:run_all_end) do
    `rake jasmine:ci`
    if $? == 0
      ::Guard::Notifier.notify('CoffeeScript tests passed.', { title: 'CoffeeScript tests' })
    else
      ::Guard::Notifier.notify('CoffeeScript tests failed.', { title: 'CoffeeScript tests', image: :failed })
    end
  end
end

