require './lib/quote'

intent "RandomQuote" do
  tell(Quote.random, ssml: true)
end