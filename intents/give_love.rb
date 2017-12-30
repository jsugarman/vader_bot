require './lib/quote'

intent "GiveLove" do
  tell(Quote.quotes[:love].sample, ssml: true)
end