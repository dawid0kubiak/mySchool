Grade.create(short_name: '6', value: 6)
Grade.create(short_name: '5', value: 5)
Grade.create(short_name: '4', value: 4)
Grade.create(short_name: '3', value: 3)
Grade.create(short_name: '2', value: 2)
Grade.create(short_name: '1', value: 1)

t1 = Teacher.create(name: 'Jan', lastname: 'Kowalski',
                    email: 'jan.kowalski@serwer.pl', phone: '123789654')
t2 = Teacher.create(name: 'Tadeusz', lastname: 'Zapolski',
                    email: 'tadeusz.zapolskki@serwer.pl', phone: '123123123')

Subject.create(name: 'j.polski').teachers << t1
Subject.create(name: 'matematyka').teachers << t2
Subject.create(name: 'historia').teachers << t1

Pupil.create(name: 'Marta', lastname: 'Kubiak').subjects = Subject.all
Pupil.create(name: 'Wojciech', lastname: 'Kubiak').subjects = Subject.all
