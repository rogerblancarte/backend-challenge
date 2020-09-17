FactoryBot.define do
  factory :heading do
    # Grab "random" heading tag content.
    # Content is intentionally overlapping on some keywords for future tests
    content { [
      '<h1>Health and sports, fun things</h1>',
      '<h1>Sports! How cool</h1>',
      '<h2>Coding: is it good for your health?</h2>',
      '<h2>Progamming 101: keep it fun!</h2>',
      '<h3>Tests tests tests</h3>',
      '<h3>program yourself</h3>',
    ].sample }

    # set after creation of a member
    association :website
  end
end

