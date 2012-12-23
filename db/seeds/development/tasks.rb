# -*- coding: utf-8 -*-

puts "creating seed records"
Task.create(
  name: "フレッシュプリキュアを見る",
  due_time: Time.now + 1.week,
  done: false
)
Task.create(
  name: "ひだまりスケッチを見る",
  due_time: Time.now + 3.days,
  done: false
)
Task.create(
  name: "<script> alert('XSS脆弱性を試す') </script>",
  due_time: Time.now + 1.hour,
  done: false
)
Task.create(
  name: "Hakellの問題を作る",
  due_time: nil,
  done: true
)
Task.create(
  name: "もっと強くなる",
  due_time: nil,
  done: false
)
Task.create(
  name: "ひとりハッカソンをとにかくやれ",
  due_time: Time.now,
  done: false
)
Task.create(
  name: "ブログシステムを変える",
  due_time: Time.now + 3.weeks,
  done: false
)
Task.create(
  name: "Haskell Advent Calendar",
  due_time: Time.parse("2012/12/03"),
  done: false
)
Task.create(
  name: "ML/LL Advent Calendar",
  due_time: Time.parse("2012/12/22"),
  done: false
)
Task.create(
  name: "Vim Advent Calendar",
  due_time: Time.parse("2012/12/29"),
  done: false
)
