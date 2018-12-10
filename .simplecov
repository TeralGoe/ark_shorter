SimpleCov.start 'rails' do
  add_filter '/spec/'
  add_filter '/channels/'
  add_filter '/jobs/'
  add_filter '/mailers/'

  add_group 'Serializers', 'app/serializers'
end
