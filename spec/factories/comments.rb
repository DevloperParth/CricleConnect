FactoryBot.define do
  factory :comment do
    comment {"nice"}
    user
    post
  end
end
