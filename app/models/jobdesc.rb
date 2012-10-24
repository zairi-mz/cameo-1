class Jobdesc < ActiveRecord::Base
  has_many :maintenances
  validates_presence_of :job_code, :description
  
  def job_listing
    "#{job_code}    | #{description}"
  end
end
