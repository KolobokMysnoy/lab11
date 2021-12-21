require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  
  test "find and save in database" do
    # Создание записи для теста
    db=Answer.new
    @tmp_for_answer= rand(40..90)
    db.iteration=tmp_for_answer
    db.factorial=tmp_for_answer
    db.number=tmp_for_answer
    assert_equal true, db.save
    
    # Попытка сохранить с теми же данными
    db=Answer.new
    db.iteration=tmp_for_answer
    db.factorial=tmp_for_answer
    db.number=tmp_for_answer
    assert_equal false, db.save

    # Поиск записи в базе данных
    # Можно было использовать assert_not_nil
    assert_equal true, Answer.all.find_by(iteration: tmp_for_answer, factorial:tmp_for_answer, number: tmp_for_answer).present?
  end
  
  def teardown  
    # Чистим базу от нашей записи
    Answer.all.find_by(number:tmp_for_answer).delete
  end

  private 
  attr_accessor :tmp_for_answer
end
