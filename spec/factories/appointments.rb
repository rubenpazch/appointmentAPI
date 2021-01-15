FactoryBot.define do
  factory :appointment do
    appointmentDate { '2021-01-12' }
    startTime { '2021-01-12 00:46:23' }
    endTime { '2021-01-12 00:46:23' }
    status { false }
    user { nil }
  end
end
