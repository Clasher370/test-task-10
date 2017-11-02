def start_date
  (Time.now - 1.minute).to_s
end

def end_date
  Time.now.to_s
end

def test_mail
  'test@mail.com'
end
