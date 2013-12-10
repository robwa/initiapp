Mailman::Rails.receive do
  to '%id%@%domain%', 'TextsMailController#create'
end
