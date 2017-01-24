class Validator
  def is_binary?(text)
    !!/^[01]+$/.match(text)
  end

  def is_binary_even?(text)
    !/[1]$/.match text
  end

  def is_hex?(text)
    !!/^[0-9a-f]+$/i.match(text)
  end

  def is_word?(text)
    !!/^\d*[a-z\-][a-z\-\d]*$/i.match(text)
  end

  def are_words?(text, options={})
    word_count = text.split.size
    count = options.fetch(:count, word_count)
    if word_count == count && !!/^\d*[a-z\-\s][a-z\-\s]*$/i.match(text)
      true
    else
      false
    end
  end

  def is_phone_number?(text)
    !!/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$/.match(text)
  end

  def is_money?(text)
    !!/^\$[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$/.match(text)
  end

  def is_zip_code?(text)
    # !!/^\d{5}(?:[-\s]\d{4})?$/.match(text)
    !!/^\d{5}(-\d{4})?$/.match(text)
  end

  def is_date?(text)
    !!/[0-9\/.\-0-9\/.\-0-9]/.match(text)
  end

end
