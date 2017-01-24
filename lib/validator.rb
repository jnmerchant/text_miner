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
end
