
# Create Companies
10.times do
  Company.create!(
    name: Faker::Company.name,
    industry: Faker::Company.industry,
    website: Faker::Internet.url
  )
end
puts "Created Companies"

# Create Contacts
Company.find_each do |company|
  company.contacts.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    position: Faker::Job.title
  )
end
puts "Created Contacts"

# Create Deals
Company.find_each do |company|
  company_contact_ids = company.contacts.ids

  3.times do
    company.deals.create!(
      contact_id: company_contact_ids.sample,
      title: Faker::Company.catch_phrase,
      value: 1500,
      stage: "lead"
    )
  end
end
puts "Created Deals"

# Store IDs
company_ids = Company.ids
contact_ids = Contact.ids
deal_ids = Deal.ids

# Create Activities
10.times do
  Activity.create!(
    company_id: company_ids.sample,
    contact_id: contact_ids.sample,
    deal_id: deal_ids.sample,
    activity_type: "call",
    subject: "first_tell",
    occurred_at: Time.current
  )
end
puts "Created Activities"

# Create Tasks
10.times do
  Task.create!(
    company_id: company_ids.sample,
    contact_id: contact_ids.sample,
    deal_id: deal_ids.sample,
    title: Faker::Company.catch_phrase,
    due_at: 2.days.from_now
  )
end
puts "Created Tasks"
