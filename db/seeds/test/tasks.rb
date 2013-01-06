# -*- coding: utf-8 -*-

puts "creating seed records"
Task.create(
  name: "test this app!",
  due_time: Time.now + 1.hour,
  done: false,
  description: "Red!\nGreen!\nRefactor!"
)
