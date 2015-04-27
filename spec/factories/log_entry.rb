FactoryGirl.define do
  factory :log_entry do |f|
    f.installation
    f.user 'Bob'
    f.comments 'Cleaned panels today.'
  end

end