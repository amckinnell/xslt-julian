class NulogyExtensions

  def to_jd(date)
    Date.parse(date.to_s).jd
  end

end

