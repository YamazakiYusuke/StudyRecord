
User.create!(
  name: 'yusuke',
  email: 'yusuke@gmail.com',
  password: 'hogehoge'
)

User.create!(
  name: 'mao',
  email: 'mao@gmail.com',
  password: 'hogehoge'
)

20.times do |n|
  StudyTime.create!(
    time_length: [1, 2].sample,
    date: [2021-01-24, 2021-01-23].sample,
    user_id: [1, 2].sample,
    comment: ["プログラミング", "数学", "ロシア語"].sample,
  )
end