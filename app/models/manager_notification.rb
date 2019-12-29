class ManagerNotification < ApplicationRecord
  validates :message, presence: true

  belongs_to :manager
  belongs_to :bill
end
