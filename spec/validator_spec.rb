require 'validator'

describe Validator do
  before do
    @v = Validator.new
  end

  describe '#is_binary?' do
    it 'returns true or false if a string is a binary number' do
      expect(@v.is_binary?('0')).to eq true
      expect(@v.is_binary?('1')).to eq true
      expect(@v.is_binary?('01')).to eq true
      expect(@v.is_binary?('10')).to eq true
      expect(@v.is_binary?('1110100010')).to eq true
      expect(@v.is_binary?('')).to eq false
      expect(@v.is_binary?('911')).to eq false
    end
  end

  describe '#is_binary_even?' do
    it 'returns true if a string is an even binary number' do
      expect(@v.is_binary_even?('10')).to eq true
      expect(@v.is_binary_even?('1110100010')).to eq true
      expect(@v.is_binary_even?('1011')).to eq false
    end
  end

  describe '#is_hex?' do
    it 'returns true if a string is a hex value' do
      expect(@v.is_hex?('CAFE')).to eq true
      expect(@v.is_hex?('9F9')).to eq true
      expect(@v.is_hex?('123')).to eq true
      expect(@v.is_hex?('6720EB3A9D1')).to eq true
      expect(@v.is_hex?('')).to eq false
      expect(@v.is_hex?('COFFEE')).to eq false
    end
  end

  describe '#is_word?' do
    it 'returns true if the string is a word' do
      expect(@v.is_word?('hello')).to eq true
      expect(@v.is_word?('wonderful')).to eq true
      expect(@v.is_word?('zyggon')).to eq true
      expect(@v.is_word?('horse-dagger')).to eq true
      expect(@v.is_word?('18-wheeler')).to eq true
      expect(@v.is_word?('')).to eq false
      expect(@v.is_word?('12')).to eq false
      expect(@v.is_word?('!!!')).to eq false
      expect(@v.is_word?('bar*us')).to eq false
    end
  end

  describe '#are_words?' do
    it 'returns true if the string is all words' do
      # and if the optional count parameter matches the number of words
      expect(@v.are_words?('hello')).to eq true
      expect(@v.are_words?('hello world')).to eq true
      expect(@v.are_words?('raggggg hammer dog')).to eq true
      expect(@v.are_words?('18-wheeler tarbox')).to eq true
      expect(@v.are_words?('hello', count: 1)).to eq true
      expect(@v.are_words?('hello world', count: 2)).to eq true
      expect(@v.are_words?('raggggg hammer dog', count: 3)).to eq true
      expect(@v.are_words?('18-wheeler tarbox', count: 2)).to eq true
      expect(@v.are_words?('')).to eq false
      expect(@v.are_words?('12')).to eq false
      expect(@v.are_words?('hey !!!', count: 2)).to eq false
      expect(@v.are_words?('bar*us w!zard', count: 2)).to eq false
      expect(@v.are_words?('hello', count: 2)).to eq false
      expect(@v.are_words?('hello world', count: 3)).to eq false
      expect(@v.are_words?('raggggg hammer dog', count: 1)).to eq false
      expect(@v.are_words?('18-wheeler tarbox', count: 3)).to eq false
    end
  end

  describe '#is_phone_number?' do
    it 'returns true for valid US phone number formats' do
      expect(@v.is_phone_number?('919-555-1212')).to eq true
      expect(@v.is_phone_number?('(919) 555-1212')).to eq true
      expect(@v.is_phone_number?('9195551212')).to eq true
      expect(@v.is_phone_number?('919.555.1212')).to eq true
      expect(@v.is_phone_number?('919 555-1212')).to eq true
      expect(@v.is_phone_number?('')).to eq false
      expect(@v.is_phone_number?('555-121')).to eq false
      expect(@v.is_phone_number?('1212')).to eq false
      expect(@v.is_phone_number?('mobile')).to eq false
    end
  end

  describe '#is_money?' do
    it 'returns true for valid US money formats' do
      expect(@v.is_money?('$4')).to eq true
      expect(@v.is_money?('$19')).to eq true
      expect(@v.is_money?('$19.00')).to eq true
      expect(@v.is_money?('$3.58')).to eq true
      expect(@v.is_money?('$1000')).to eq true
      expect(@v.is_money?('$1000.00')).to eq true
      expect(@v.is_money?('$1,000')).to eq true
      expect(@v.is_money?('$1,000.00')).to eq true
      expect(@v.is_money?('$5,555,555')).to eq true
      expect(@v.is_money?('$5,555,555.55')).to eq true
      expect(@v.is_money?('$45,555,555.55')).to eq true
      expect(@v.is_money?('$456,555,555.55')).to eq true
      expect(@v.is_money?('$1234567.89')).to eq true
      expect(@v.is_money?('')).to eq false
      expect(@v.is_money?('$12,34')).to eq false
      expect(@v.is_money?('$1234.9')).to eq false
      expect(@v.is_money?('$1234.999')).to eq false
      expect(@v.is_money?('$')).to eq false
      expect(@v.is_money?('31')).to eq false
      expect(@v.is_money?('$$31')).to eq false
    end
  end

  describe '#is_zip_code?' do
    it 'returns true for valid zip code formats' do
      expect(@v.is_zip_code?('63936')).to eq true
      expect(@v.is_zip_code?('50583')).to eq true
      expect(@v.is_zip_code?('48418')).to eq true
      expect(@v.is_zip_code?('06399')).to eq true
      expect(@v.is_zip_code?('26433-3235')).to eq true
      expect(@v.is_zip_code?('64100-6308')).to eq true
      expect(@v.is_zip_code?('')).to eq false
      expect(@v.is_zip_code?('7952')).to eq false
      expect(@v.is_zip_code?('115761')).to eq false
      expect(@v.is_zip_code?('60377-331')).to eq false
      expect(@v.is_zip_code?('8029-3924')).to eq false
    end
  end

  describe '#is_date?' do
    it 'returns true for valid date format' do
      expect(@v.is_date?('9/4/1976')).to eq true
      expect(@v.is_date?('1976-09-04')).to eq true
      expect(@v.is_date?('2015-01-01')).to eq true
      expect(@v.is_date?('02/15/2004')).to eq true
      # expect(@v.is_date?('9/4')).to eq false
      # expect(@v.is_date?('2015')).to eq false
    end
  end
  #
  # # ADVANCED MODE BEGINS
  #
  # describe '#is_date? - advanced' do
  #   it 'returns true for valid date format - advanced' do
  #     expect(@v.is_date?('2014 Jan 01')).to eq true
  #     expect(@v.is_date?('2014 January 01')).to eq true
  #     expect(@v.is_date?('Jan. 1, 2015')).to eq true
  #     expect(@v.is_date?('07/40/2015')).to eq false
  #     expect(@v.is_date?('02/30/2015')).to eq false
  #   end
  # end
  #
  # describe '#is_email?' do
  #   it 'returns true for valid email formats' do
  #     expect(@v.is_email?('stroman.azariah@yahoo.com')).to eq true
  #     expect(@v.is_email?('viola91@gmail.com')).to eq true
  #     expect(@v.is_email?('eathel.west@example.org')).to eq true
  #     expect(@v.is_email?('dwehner@harley.us')).to eq true
  #     expect(@v.is_email?('malcolm.haley@hotmail.com')).to eq true
  #     expect(@v.is_email?('ezzard90@hotmail.com')).to eq true
  #     expect(@v.is_email?('legros.curley@gmail.com')).to eq true
  #     expect(@v.is_email?('leatha75@mertz.net')).to eq true
  #     expect(@v.is_email?('bonita43@yahoo.com')).to eq true
  #     expect(@v.is_email?('')).to eq false
  #     expect(@v.is_email?('legros.curley')).to eq false
  #     expect(@v.is_email?('mertz.net')).to eq false
  #     expect(@v.is_email?('bonita43@')).to eq false
  #   end
  # end
  #
  # describe '#is_address?' do
  #   it 'returns true for valid US address formats' do
  #     expect(@v.is_address?('368 Agness Harbor Port Mariah, MS 63293')).to eq true
  #     expect(@v.is_address?('96762 Juluis Road Suite 392 ' \
  #                           'Lake Imogenemouth, AK 20211')).to eq true
  #     expect(@v.is_address?('671 Tawnya Island Apt. 526 ' \
  #                           'Clementeburgh, AK 82652')).to eq true
  #     expect(@v.is_address?('568 Eunice Shoals ' \
  #                           'Parishaven, AK 09922-2288')).to eq true
  #     expect(@v.is_address?('8264 Schamberger Spring, ' \
  #                           'Jordanside, MT 98833-0997')).to eq true
  #     expect(@v.is_address?('')).to eq false
  #     expect(@v.is_address?('99132 Kaylah Union Suite 301')).to eq false
  #     expect(@v.is_address?('Lake Joellville, NH')).to eq false
  #     expect(@v.is_address?('35981')).to eq false
  #   end
  # end
end
