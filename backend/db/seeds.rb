# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

n = 1

### Patient Seeds ###
50.times {
    Patient.create(name: Faker::Name.name, dob: Faker::Date.birthday(min_age: 0, max_age: 117), gender: Faker::Gender.binary_type, telephone: Faker::PhoneNumber.phone_number, address: Faker::Address.full_address, hosp_num: Faker::Number.number(digits: 10), nhs_num: Faker::NationalHealthService.british_number) 
}

### Patient Seeds ###
5.times {
    Clinician.create(name: Faker::Name.name, username: Faker::Internet.username, email: Faker::Internet.email, password: '12345', specialty: 'GP') 
}

50.times {
    Contact.create(date_time: Faker::Time.between_dates(from: Date.today - 1, to: Date.today + 5, period: :all), duration: 30, contact_type: 'GP Consultation', patient_id: rand(1..5), clinician_id: 1)
    # Contact.create(date_time: '2016-06-22 19:10:25', duration: 30, contact_type: 'GP Consultation', patient_id: rand(1..50), clinician_id: rand(1..5))
}

# 100.times {
#     HeartRate.create(value: rand(40..220), date_time: '2016-06-22 19:10:25', patient_id: rand(1..5)) 
# }

500.times {
    HeartRate.create(value: rand(40..220), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    BloodPressure.create(systolic_value: rand(100..220), diastolic_value: rand(60..90), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    O2Sat.create(value: rand(60..100), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    Temp.create(value: rand(35.5..38.5).round(2), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5))
}

500.times {
    RespRate.create(value: rand(8..18), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    ActiveCalorie.create(value: rand(1200..4800), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    CalorieIntake.create(value: rand(1600..3000), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    BloodGlucose.create(value: rand(4.0..9.0).round(2), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    ExerciseDuration.create(value: rand(0..180), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

10.times {
    Fall.create(value: rand(0..5), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    FlightsClimbed.create(value: rand(0..12), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

10.times {
    IrregEpisode.create(value: rand(0..5), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    MindfulMinute.create(value: rand(0..60), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    Step.create(value: rand(0..15000), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

500.times {
    TimeStanding.create(value: rand(0..720), date_time: Faker::Time.between_dates(from: Date.today - 365, to: Date.today + 3, period: :all), patient_id: rand(1..5)) 
}

Patient.all.each_with_index{|p, index| Height.create(value: rand(161.9..175.3).round(2), date_time: Faker::Time.between_dates(from: Date.today - 10, to: Date.today - 1, period: :all), patient_id: index)}
Patient.all.each_with_index{|p, index| Weight.create(value: rand(69.0..84.0).round(2), date_time: Faker::Time.between_dates(from: Date.today - 10, to: Date.today - 1, period: :all), patient_id: index)}









