module Julian

  def self.to_jd(date)
    Date.parse(date).jd
  end

end
