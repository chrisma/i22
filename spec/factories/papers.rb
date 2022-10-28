FactoryBot.define do
  factory :paper do
    title {"COMPUTING MACHINERY AND INTELLIGENCE"}
    venue {"Mind 49: 433-460"}
    year {1950}
    # https://github.com/thoughtbot/factory_bot/blob/main/GETTING_STARTED.md#building-or-creating-multiple-records
    authors {build_list :author, 1}
  end
end