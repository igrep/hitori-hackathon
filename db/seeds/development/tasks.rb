# -*- coding: utf-8 -*-

puts "creating seed records"
Task.create(
  name: "フレッシュプリキュアを見る",
  due_time: Time.now + 1.week,
  status: "not yet"
)
Task.create(
  name: "ひだまりスケッチを見る",
  due_time: Time.now + 3.days,
  status: "not yet"
)
Task.create(
  name: "<script> alert('XSS脆弱性を試す') </script>",
  due_time: Time.now + 1.hour,
  status: "doing"
)
Task.create(
  name: "Hakellの問題を作る",
  due_time: nil,
  status: "done"
)
Task.create(
  name: "もっと強くなる",
  due_time: nil,
  status: "doing"
)
Task.create(
  name: "ひとりハッカソンをとにかくやれ",
  due_time: Time.now,
  status: "doing"
)
Task.create(
  name: "ブログシステムを変える",
  due_time: Time.now + 3.weeks,
  status: "not yet"
)
Task.create(
  name: "Haskell Advent Calendar",
  due_time: Time.parse("2012/12/03"),
  status: "not yet"
)
Task.create(
  name: "ML/LL Advent Calendar",
  due_time: Time.parse("2012/12/22"),
  status: "not yet"
)
Task.create(
  name: "Vim Advent Calendar",
  due_time: Time.parse("2012/12/29"),
  status: "not yet"
)
