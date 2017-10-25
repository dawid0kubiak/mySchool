Grade.create(short_name: '6', value: 6)
Grade.create(short_name: '5+', value: 5.5)
Grade.create(short_name: '5', value: 5)
Grade.create(short_name: '5-', value: 4.75)
Grade.create(short_name: '4+', value: 4.5)
Grade.create(short_name: '4', value: 4)
Grade.create(short_name: '4-', value: 3.75)
Grade.create(short_name: '3+', value: 3.5)
Grade.create(short_name: '3', value: 3)
Grade.create(short_name: '3-', value: 2.75)
Grade.create(short_name: '2+', value: 2.5)
Grade.create(short_name: '2', value: 2)
Grade.create(short_name: '1', value: 1)

u1 = User.create(email: Faker::Internet.email, password: 'zaq12wsx', password_confirmation: 'zaq12wsx',
                 role: :teacher, firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
u2 = User.create(email: Faker::Internet.email, password: 'zaq12wsx', password_confirmation: 'zaq12wsx',
                 role: :teacher, firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
User.create(email: 'd.kubiak@i-bs.pl', password: 'zaq12wsx', password_confirmation: 'zaq12wsx',
            role: :admin, firstname: 'Dawid', lastname: 'Kubiak')
u3 = User.create(email: 'admin@admin', password: 'zaq12wsx', password_confirmation: 'zaq12wsx', role: :admin)


Subject.create(name: 'j.polski', user_id: u1.id)
Subject.create(name: 'matematyka', user_id: u1.id)
Subject.create(name: 'historia', user_id: u1.id)

Pupil.create(name: 'Marta', lastname: 'Kubiak').subjects = Subject.all
Pupil.create(name: 'Wojciech', lastname: 'Kubiak').subjects = Subject.all

Message.create(title: 'Tytuł 2', body: 'Coś tam innego', sender_id: u1.id, recipient_id: u3.id)
Message.create(title: 'Tytuł 3', body: 'Coś tam innego', sender_id: u2.id, recipient_id: u3.id)
Message.create(title: 'Tytuł 4', body: 'Coś tam innego', sender_id: u3.id, recipient_id: u2.id)