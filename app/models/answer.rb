class Answer < ApplicationRecord
    validates :iteration,:factorial,:number, uniqueness: true
end
