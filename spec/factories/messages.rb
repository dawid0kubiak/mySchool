FactoryGirl.define do
  factory :message do
    title
    body
    unread
    deleted
    sender_id
    recipient_id
    created_at
    updated_at
  end

  factory :message1, class: Message do
    id 1
    title 'Tytuł'
    body 'Treść'
    unread true
    deleted false
    sender_id 1
    recipient_id 1

  end

  factory :message2, class: Message do
    id 2
    title 'Tytuł'
    body 'Treść'
    unread true
    deleted false
    sender_id 1
    recipient_id 1

  end

  factory :message3, class: Message do
    id 3
    title 'Tytuł'
    body 'Treść'
    unread true
    deleted false
    sender_id 1
    recipient_id 1

  end
end