class Separator

  def words(text)
    return nil if text =~ /^\d+$/
    text.scan(/[\w-]+/)
  end

  def phone_number(text)
    match = /(?<area>\d{3})-(?<number>\d{3}-\d{4})/.match(text)

    retun nil if match.nil?

    {'area_code': match[:area], 'number': match[:number]}

  end
end
