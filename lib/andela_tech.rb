require 'andela_tech/version'

module AndelaTech
  class Error < StandardError; end

  PAIRS = { '(': ')', '{': '}', '[': ']' }

  class Parser
    attr_reader :input, :pairs
    def initialize(input)
      @input = input
      @syntastic = ''
      @syntax = true
    end

    def parse
      input.split('').each do |char|
        guess_tokenized(char)
        break if @syntax == false
      end

      @syntax
    end

    private

    def guess_tokenized(char)
      if @syntax
        if PAIRS.keys.include?(char.to_sym)
          @syntastic << char
        else
          @syntax = next_valid_char?(char)
          @syntastic = (@syntastic.split('') - [@syntastic.split('').last]).join
        end
      end
    end

    def next_valid_char?(char)
      last_opening_char = @syntastic.split('').last
      pp("last -opening-char #{last_opening_char}")
      pp("next--char #{char} #{char.class}")
      pp("pair #{PAIRS[last_opening_char.to_sym]} #{last_opening_char.class}")
      PAIRS[last_opening_char.to_sym] == char
    end
  end
end
