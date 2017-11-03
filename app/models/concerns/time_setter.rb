module TimeSetter
  extend ActiveSupport::Concern

  def set_published_at
    self.published_at = Time.now unless self.published_at
  end
end
