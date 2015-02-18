class NulogyExtension

  def to_jd(date)
    Date.parse(date.to_s).jd
  rescue ArgumentError => e
    raise ArgumentError.new(e), "Invalid date: '#{date}'"
  end

end

