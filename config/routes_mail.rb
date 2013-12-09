Mailman::Rails.receive do
  #to '%id%@%domain%', TextsMailer
  to /.*/, DefaultMailer
end
