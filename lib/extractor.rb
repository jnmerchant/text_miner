class Extractor
  def phone_numbers(text)
    text.scan(/\(\d{3}\) \d{3}-\d{4}/)
  end

  def emails(text)
    text.scan(/[\w\.]+@\w+\./i) #not complete
  end

end
