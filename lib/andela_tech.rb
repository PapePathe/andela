require 'andela_tech/version'

module AndelaTech
  class Error < StandardError; end

  PAIRS = { '(': ')', '{': '}', '[': ']' }

  class Parser
    attr_reader :input, :pairs
    def initialize(input)
      @input = input
      @pairs = { '(': 0, ')': 0, '{': 0, '}': 0, '[': 0, ']': 0 }
      @syntastic = ''
      @syntax = true
    end

    def parse
      # iterate the string
      # check if each char is part of the pairs hash
      # count the groups of pairs
      #  return count.
      input.split('').each do |char|
        guess_tokenized(char)
        pairs[char.to_sym] = pairs.fetch(char.to_sym, 0) + 1
      end

      parsed_pairs
    end

    private

    def parsed_pairs
      parentheses = pairs.fetch(:')', 0) == pairs.fetch(:')', 0)
      curly_braces = pairs.fetch(:'{', 0) == pairs.fetch(:'}', 0)
      brackets = pairs.fetch(:'[', 0) == pairs.fetch(:']', 0)

      pp(parentheses, curly_braces, brackets, pairs)
      parentheses && curly_braces && brackets && syntax_correct?
    end

    def syntax_correct?
      @syntax
    end

    def guess_tokenized(char)
      @syntax = next_valid_char?(char) unless @syntastic.empty?
      @syntastic << char unless @syntax
    end

    def next_valid_char?(char)
      true
    end
  end
end
