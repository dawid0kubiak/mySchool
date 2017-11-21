FactoryGirl.define do
  factory :admin, class: User do
    email 'admin@admin'
    password 'zaq12wsx'
    firstname 'Jurand'
    lastname 'ze Spychowa'
    role 'admin'
  end

  factory :user do
    email 'user@user'
    password 'zaq12wsx'
    firstname 'Maćko'
    lastname 'z Bogdańca'
  end
end
