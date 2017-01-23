class Validator
  def is_binary?(text)
    if /^[01]+$/.match text
      true
    else
      false
    end
  end

  def is_binary_even?(text)
    if /[1]$/.match text
      false
    else
      true
    end
  end
end
