FactoryGirl.define do
  factory :project_pic do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support','sunfixrs.jpg')) }
  end

end
