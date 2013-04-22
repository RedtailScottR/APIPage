class Analytic < ActiveRecord::Base
  attr_accessible :MachineName, :APIKey, :UserID, :method, :method_success, :method_time, :recadd

  def self.totalc_where(method)
    where("method = ?", :method).count
  end

end
