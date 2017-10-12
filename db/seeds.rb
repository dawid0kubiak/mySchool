Grade.create(short_name: '6', value: 60)
Grade.create(short_name: '5', value: 50)
Grade.create(short_name: '4', value: 40)
Grade.create(short_name: '3', value: 30)
Grade.create(short_name: '2', value: 20)
Grade.create(short_name: '1', value: 10)

u1 = User.create(email: 'p.tutka@i-bp.pl', password: 'zaq12wsx', password_confirmation: 'zaq12wsx', role: :teacher, name: 'Paweł', lastname: 'Tutka')
User.create(email: 'd.kubiak@i-bs.pl', password: 'zaq12wsx', password_confirmation: 'zaq12wsx', role: :admin)
User.create(email: 'admin@admin', password: 'zaq12wsx', password_confirmation: 'zaq12wsx', role: :admin)


Subject.create(name: 'j.polski', user_id: u1.id)
Subject.create(name: 'matematyka', user_id: u1.id)
Subject.create(name: 'historia', user_id: u1.id)

Pupil.create(name: 'Marta', lastname: 'Kubiak').subjects = Subject.all
Pupil.create(name: 'Wojciech', lastname: 'Kubiak').subjects = Subject.all
