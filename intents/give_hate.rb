require './lib/quote'

intent "GiveHate" do
  tell(Quote.quotes[:hate].sample, ssml: true)
end