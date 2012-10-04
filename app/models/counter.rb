class Counter < ActiveRecord::Base
  belongs_to  :component
  validates_presence_of :date_run
  validates_presence_of :run_hours
  validates_numericality_of :run_hours
end
