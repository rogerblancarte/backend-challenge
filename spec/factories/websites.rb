FactoryBot.define do
  factory :website do
    # grab "random" url from list of urls that each have
    # a potential of overlapping in interests
    url { [
      'https://www.everlywell.com/discover/',
      'https://github.com/',
      'https://stackoverflow.com/',
      'https://www.23andme.com/',
      'https://codinginflow.com/healthy-programmer'
    ].sample }

    # set after creation of a member
    member_id nil
  end
end

