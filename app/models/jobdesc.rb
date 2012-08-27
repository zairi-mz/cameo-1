class Jobdesc < ActiveRecord::Base
  has_many :maintenances
  
  def job_listing
    "#{job_code}    | #{description}"
  end
end
