FactoryGirl.define do
  factory :log_entry do |f|
    f.project
    f.user 'Bob'
    f.comments 'Cleaned panels today.'
  end

end