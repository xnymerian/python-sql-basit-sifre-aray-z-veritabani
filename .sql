import sqlite3

db = sqlite3.connect("vt.sqlite")

im = db.cursor()

im.execute("""CREATE TABLE IF NOT EXISTS users
    (user_name, password)""")

datas = [
            ("ahmet123", "12345678"),
            ("mehmet321", "87654321"),
            ("selin456", "123123123")
          ]

for i in datas:
    im.execute("""INSERT INTO kullanicilar VALUES (?, ?)""", i)

db.commit()
while 1==1:
      kull = input("User name: ")
      paro = input("Password: ")

      im.execute("""SELECT * FROM kullanicilar WHERE
      user_name = ? AND password = ?""", (kull, paro))

      data = im.fetchone()

      if data:
         print("Welcome the programme {}!".format(data[0]))
         break
      else:
         print("Password or Username is incorrect!")
