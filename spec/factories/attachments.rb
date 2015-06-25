FactoryGirl.define do
  factory :attachment do
    attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support','sunfixrs.jpg')) }
  end

end
