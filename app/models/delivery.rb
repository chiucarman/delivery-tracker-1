# == Schema Information
#
# Table name: deliveries
#
#  id              :integer          not null, primary key
#  arrival_date    :date
#  delivery_status :boolean
#  description     :string
#  details         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  recipient_id    :integer
#
class Delivery < ApplicationRecord
end
