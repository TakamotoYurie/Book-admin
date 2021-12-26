# パーシャルなのでインスタンス変数は直接使わず、show.json.jbuilderから「book: @book」の記述で送ってもらう。
json.extract! book, :price