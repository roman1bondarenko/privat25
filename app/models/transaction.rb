class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'Bill'
  belongs_to :recipient, class_name: 'Bill'
end
