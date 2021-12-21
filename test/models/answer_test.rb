require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  test "the truth" do
    Answer.create(iteration:-1, factorial:-2,number:-3)
    fl= Answer.new(iteration:-1, factorial:-2,number:-3)
    assert_equal false, fl.save
  end
end
