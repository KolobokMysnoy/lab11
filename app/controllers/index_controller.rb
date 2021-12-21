# frozen_string_literal: true

class IndexController < ApplicationController
  before_action :parse_param
  def index; end

  def view
    find_answers
    @answer_to_task = Answer.all
  end

  def all
    # Database -> xml
    # render xlm: Answer.all.to_xml
    fin = []
    Answer.all.each do |x|
      if x.iteration.present?
        hash = { iteration: x.iteration, factorial: x.factorial, number: x.number }
        fin.push(hash)
      end
    end
    # Прогружаем страницу в зависимости от данных
    if fin.any?(&:present?)
      render xml: fin.to_xml
    else
      render plain: 'No data'
    end
  end

  private

  def find_answers
    # Поиск наших ответов
    number2 = 2
    it = 1
    fact = 1
    found = 0
    Answer.destroy_all
    while found < @value && number2 < 50
      unless Answer.find_by(number: number2)
        local_data = Answer.new
        alls = number2 * (number2 - 1) * (number2 + 1)
        while fact < alls
          fact *= it
          it += 1
        end

        if fact == alls
          # Если значение нам подходит
          puts "Iteration-#{it} \n Factorial-#{fact} \n Number- #{number2}"
          local_data.iteration = it
          local_data.factorial = fact
          local_data.number = number2
          found += 1
        end
        #  Попытка сохранить наши данные
        begin
          raise 'Error data' unless local_data.save
        rescue StandardError
          puts 'Data was here'
        end

      end
      number2 += 1
    end
  end

  def parse_param 
    if params[:username]
      @value=Integer(params[:username])
    end
    if @value && @value>4 then
      @value=4
    end
  end
end
