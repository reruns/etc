class Card
  SUIT_STRINGS = {
      :clubs    => "♣",
      :diamonds => "♦",
      :hearts   => "♥",
      :spades   => "♠"
    }

    VALUE_STRINGS = {
      :deuce => "2",
      :three => "3",
      :four  => "4",
      :five  => "5",
      :six   => "6",
      :seven => "7",
      :eight => "8",
      :nine  => "9",
      :ten   => "10",
      :jack  => "J",
      :queen => "Q",
      :king  => "K",
      :ace   => "A"
    }

    POKER_VALUE = {
      :deuce => 2,
      :three => 3,
      :four  => 4,
      :five  => 5,
      :six   => 6,
      :seven => 7,
      :eight => 8,
      :nine  => 9,
      :ten   => 10,
      :jack  => 11,
      :queen => 12,
      :king  => 13,
      :ace   => 14
    }

    def initialize(value, suit)
      raise "not a valid suit or value" unless SUIT_STRINGS.has_key?(suit) &&
                                              VALUE_STRINGS.has_key?(value)
      @value, @suit = value, suit
    end


    def self.values
      VALUE_STRINGS.keys
    end

    def self.suits
      SUIT_STRINGS.keys
    end

    def self.poker_value(value)
      raise "ace has a special value" if value == :ace
      POKER_VALUE[value]
    end

    def to_s
      VALUE_STRINGS[value] + SUIT_STRINGS[suit]
    end

    def ==(card)
      value == card.value && suit == card.suit
    end

    attr_reader :value, :suit
end
