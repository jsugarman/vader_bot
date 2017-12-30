require './lib/quote'

intent "HowAreYou" do
  tell(Quote.quotes[:how_are_you].sample, ssml: true)
end