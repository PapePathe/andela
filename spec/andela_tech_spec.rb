RSpec.describe AndelaTech::Parser do
  # Given a string s containing just the characters
  # '(', ')', '{', '}', '[' and ']',
  # determine if the input string is valid.  
  # An input string is valid if:  
  # Open brackets must be closed by the same type of brackets. 
  # Open brackets must be closed in the correct order.    
  # Example 1:  Input: s = "()" Output: true 
  #Example 2:  Input: s = "()[]{}" Output: true 
  #Example 3:  Input: s = "(]" Output: false Example 4:  
  #Input: s = "([)]" Output: false 

  subject { result.parse }

  let(:result) { described_class.new(input) }

  describe 'example1' do
    context '()' do
      let(:input) { '()' }
      it { is_expected.to eq(true) }
    end

    context '([)]' do
      let(:input) { '([)]' }
      it { is_expected.to eq(false) }
    end

    context '([])' do
      let(:input) { '([])' }
      it { is_expected.to eq(true) }
    end
    context '(]' do
      let(:input) { '(]' }
      it { is_expected.to eq(false) }
    end

    context do
      let(:input) { '()[]{}' }
      it { is_expected.to eq(true) }
    end
  end
end
