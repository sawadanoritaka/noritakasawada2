FactoryGirl.define do
  factory :comment do
    blogs nil
    user nil
    content "MyString"
  end
end
