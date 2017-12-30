class Quote
  def self.quotes
    @@quotes ||= QUOTES.each_with_object({}) do |(k, quotes), memo|
      memo[k] = quotes.map{ |quote| "<speak><prosody pitch=\"low\">#{quote}</prosody></speak>"}
    end
  end

  def self.random(filters = QUOTES.keys)
    filter(filters).values.flatten.uniq.sample
  end

  def self.filter(filters = [])
    quotes.select {|k,_v| filters.map(&:to_sym).include?(k.to_sym) }
  end

  private

  QUOTES = {
    love: [
      "The force is strong with this one",
      "Search your feelings, you know it to be true!",
      "If you only knew the power of the Dark Side",
      "Impressive! Most impressive.",
      "Obi-Wan has taught you well",
      "You <emphasis level=\"strong\">may</emphasis> yet be of some use to us",
    ],
    hate: [
      "If you only knew the <emphasis level=\"strong\">power</emphasis> of the Dark Side",
      "There is no escape, Don't make me destroy you",
      "No, <emphasis level=\"strong\">I</emphasis> am your father!",
      "Be careful not to choke on your aspirations",
    ],
    negative: [
      "I feel a great disturbance in the force",
      "I find your lack of faith disturbing",
      "If you only knew the power of the Dark Side",
      "Don't be too proud of this technological terror you've created. The ability to destroy a planet is <emphasis level=\"strong\">insignificant</emphasis> next to the power of the force.",
      "Don't make me destroy you",
      "Don't act so surprised your highness"
    ],
    how_are_you: [
      "I feel a great disturbance in the force",
      "There is no escape, Don't make me destroy you",
      "Don't be too proud of this technological terror you've created. The ability to destroy a planet is <emphasis level=\"strong\">insignificant</emphasis> next to the power of the force.",
      "If you only knew the power of the Dark Side",
      "Your thoughts betray you",
      "Impressive! Most impressive.",
      "Obi-Wan has taught you well"
    ],
    positive: [
      "Impressive! Most impressive.",
      "Obi-Wan has taught you well"
    ],
    other: [
      "Obi-Wan never told you what <emphasis level=\"strong\">happened</emphasis> to your father",
      "No, <emphasis level=\"strong\">I<emphasis> am you father!",
      "I hope so for your sake, the Emperor is not as <emphasis level=\"strong\">forgiving</emphasis> as I am.",
      "When I left you I was but the learner. Now <emphasis level=\"strong\">I</emphasis> am the master.",
      "Commander, tear this ship apart until you have found those plans, and bring me the passengers. I want them <emphasis level=\"strong\">alive</emphasis>.",
      "Where are those transmissions you intercepted. What have you done with those plans.",
      "If this is a consullar ship, <emphasis level=\"strong\">where<emphasis> is the ambassador.",
      "Don't act so surprised your highness",
      "I want to know what happened to the plans they <emphasis level=\"strong\">sent</emphasis> you",
      "you are part of a rebel alliance and a traitor",
      "There will be no one to stop us this time",
      "She <emphasis level=\"strong\">may</emphasis> yet be of some use to us",
      "Send a scanning crew on board. I want every part of this ship checked"
    ]
  }.freeze
end