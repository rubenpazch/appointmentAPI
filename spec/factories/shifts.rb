FactoryBot.define do
  factory :shift do
    totalShift { 1 }
    interval { 1 }
    startDate { '2021-01-12' }
    endDate { '2021-01-12' }
    user { nil }
  end
end
