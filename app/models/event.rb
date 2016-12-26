class Event < ApplicationRecord

  scope :current_month, -> {
    start = Time.zone.now
    where(clocked_in: start.beginning_of_month..start.end_of_month)
  }

  # NOTE: another ways to get current_month from DB
  # scope :current_month, -> { where("clocked_in between ? AND ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month)}
  # scope :current_month, -> { where("EXTRACT(month from clocked_in) = ? AND", Time.zone.now.month, Time.zone.now.year)}

  scope :current_week, -> {
    start = Time.zone.now
    where(clocked_in: start.beginning_of_week..start.end_of_week)
  }

  scope :payroll_week, -> {
    start = Time.zone.now.beginning_of_week
    ending = start.end_of_week + 7.days
    where(clocked_in: start..ending)
  }

  scope :business_days, -> {
    where("DAYOFWEEK(clocked_in) in (?)", 2..6)
  }
end
