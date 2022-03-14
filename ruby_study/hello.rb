print "初めてのルビー" #　文字列にして表示させるための命令
puts "よろしく" #　　+改行
p "hello world" #　主にデバッグ用に使われる

=begin
セミクロン
命令の区切りにはセミコロンも使えたりするけど、改行があれば省略できるから、1 行に複数の命令を書きたいときくらいしか使わないということも覚えておこう。
コメント
パウンド記号（#）の後がコメントになるから、動作に影響を与えない
複数行を一気にコメントにしたい場合には、=begin と =end で囲ってあげよおう。
そうすることで動作に関係ない埋め込みドキュメントとして認識される。

=end

#変数
#英小文字かもしくはアンダーバー（_）で始めないといけない
#変数と違ってプログラム中で値を書き換えてほしくないものに対して使う。
msg = "hello ruby"
puts msg

#定数
#最初が英大文字でないといけない
NUMBER = 11
puts NUMBER

#NUMBER = 12
#puts NUMBER

=begin
Rubyでは警告は出してくれるけど、そこで処理が止まるわけではなくて
値が書き換わって表示されてしまうから、その点に注意しつつ、
こういう警告を無視せずにきちんと対処するようにしておこう
=end

#Objects
#Rubyでは全ての値がオブジェクトになっている
#length, reverse, round, floor などを　メソッドと呼ぶ
#　１０ や "hello world" などの実際の値のことはインスタンスと呼ぶ
#オブジェクトの種類によって Stringクラス, Float クラスと呼ぶ　/ これ以外でもたくさんのクラスが用意されてる。
msg2 = "hello ruby".length
msg3 = "hello ruby2".reverse
puts msg2 #10 　/    .length をつければ文字数を返してくれる
puts msg3 #2ybur olleh　 /  .reverse という命令をつけてあげると、この文字列を逆順にした文字列を返してくれる。

number = 15.5;
puts number.round #16 / round という命令をつけてあげると四捨五入（ししゃごにゅう）して 1 を返してくれる

puts number.floor #15　/ .floor という命令をつけてあげると小数点（しょうすうてん）以下を切り捨ててくれる

#数値に関するオブジェクト
p 4.8.class #オブジェクトがどのクラスに属しているか確認
p 4.8.methods #どのようなメソッドを持っているかを調べる
#足し算は +、引き算は -、掛け算は *（アスタリスク）、割り算は /(スラッシュ)
#余り（あまり）については　％（パーセント）、　べき乗（べきじょう）は **（アスタリスクアスタリスク）


#有理数（分数）の扱いもできて、その場合は Rational を使えばok

p 10 + 3
p 10 * 3
p 10 - 5
p 10 / 3
p 10.0 / 5
p 10 % 5
p Rational(2,5) + Rational(3,4) #2/5 + 3/4
p 2/5r + 3/4r #Rationalの短い書き方

p 50.7.round #四捨五入 / 51
p 50.7.floor #小数点以下を切り捨てる / 50
p 50.3.ceil #小数点以下を切り上げの場合 /51

#文字列に関するオブジェクト
#文字列はシングルクォーテーション,ダブルクォーテーションで囲ってあげれば OK
#でも、シングルクォーテーションの場合、特殊文字が使えない、式展開ができない、という特徴がある

puts "hello\nworld\nruby" #hello
                          #world
                          #ruby
puts 'hello\n world\n ruby' #hello\n world\n ruby

# #{} #(バウンド記号)　{}(波括弧（なみかっこ）)
puts "price #{1000 * 3}" #price 3000
puts 'price #{1000 * 5}' #price #{1000 * 5}

name = "aimyon"
puts "hello #{name}"

puts "hello" + " world" #hello world
puts "hello" * 10 #hellohellohellohellohellohellohellohellohellohello

#!(ビックリマーク)
# upcase / upcaseは文字列を大文字にしたものを返すだけ
# upcase! 破壊的なメソッド / upcase! は文字列を大文字にしたものを返しつつ、元の文字列も大文字に書き換える

name = "aimyon"
puts name.upcase #AIMYON
puts name #aimyon
puts name.upcase! #AIMYON
puts name #AIMYON

team = "HANSHIN"
puts team.downcase #hanshin
puts team.reverse #NIHSNAH

#?(はてなマーク) / 真偽値(しんぎち)を返すメソッド（true, false）
puts name.empty? # false / 空(から)かどうかを調べるメソッド
puts name.include?("A") #true / 特定の文字が含まれているかどうか調べるメソッド

#配列

#作り方
teams = ["hanshin", "kyojin", "orix"]

#要素へのアクセス
p teams[0] #"hanshin" / 大括弧(だいかっこ)の中の数値を添字（そえじ）と呼ぶ
p teams[0..2] #["hanshin", "kyojin", "orix"] / 0 から 2 まで
p teams[0...2] #["hanshin", "kyojin"] / 0 から 2 の直前まで
p teams[4] #nil / 範囲外の数値を指定するとnilというオブジェクトが返ってくるが、これは何もないという意味の特殊なオブジェクト

#配列の書き換え
teams[1] = "chibalotte"
p teams #["hanshin", "chibalotte", "orix"]
teams[1..2] = ["yakult", "softBank"]
p teams #["hanshin", "yakult", "softBank"]

#配列の追加
teams.push("kyojin")
p teams #["hanshin", "yakult", "softBank", "kyojin"]
teams << "rakuten" #pushの簡単な書き方
p teams #["hanshin", "yakult", "softBank", "kyojin", "rakuten"]

p teams.size #5 / 要素の数を示してくれる
p teams.sort #アルファベット順に並び替えるメソッド

#ハッシュ（hash）オブジェクト
# key / value 
#例えば　　阪神が ２点で ソフトバンクが １点だった場合、チームとスコアをペアにして管理するために使う

#ハッシュの作り方
#scores = {"hanshin" => 2, "softbank" => 1}
#scores = {:hanshin => 2, :softbank => 1} #シンボル(symbol)
#:(コロン)から始まる識別子(しきべつし)のようなオブジェクトで、文字列を使うより動作が高速で Rubyではよく使われる
scores = {hanshin: 2, softbank: 1} #シンボルの簡単な書き方

#ハッシュのそれぞれの要素へのアクセス
p scores[:hanshin] #scoresにキーである :hanshin を与えてあげると、その値である 2 を引っ張ってくることができます。

#ハッシュの値（あたい）の書き換え
scores[:hanshin] = 3;
p scores #{:hanshin=>3, :softbank=>1}

p scores.size #要素の数を引っ張ってくる
p scores.keys #キーの一覧を引っ張ってくる / [:hanshin, :softbank]
p scores.values #値の一覧だけ引っ張ってくる / [3, 1]
p scores.has_key?(:hanshin) #true / 特定のキーがあるかどうか調べる


#変換
x = 5
y = "2"

p x + y.to_i #7 整数(せいすう)　
p x + y.to_f #7.0　浮動小数点数(ふどうしょうすうてんすう)
p x.to_s + y #"52"　#String

age = {masaki: 29, aimyon: 28}

p age.to_a #[[:masaki, 29], [:aimyon, 28]] #配列に表現
p age.to_h #{:masaki=>29, :aimyon=>28} #ハッシュに戻す

# %
puts %Q(hello) # == puts "hello"
puts %(hello) #上と同じ意味　/ Qは省略可能

puts %q(hello) # == puts 'hello' 

puts "he\"llo" #he"llo
puts %(hel"lo) #hel"lo
=begin
 "" の中で " を使いたかったり、'' の中で ' を使いたい場合、これらは区切り文字ではないよという意味で \（バックスラッシュ） を付けてあげる必要がある
でも　%の記法の場合はそうする必要はなくて単に " だとか ' をそのまま書ければOK
=end

p ["red", "blue"]
p ['red', 'blue']

#配列の他の書き方
# " や ' をたくさん書くのが面倒な場合使えばOK
p %W(red blue)
p %w(red blue) 

# "文字列" % 値
# %s
# %d
# %f

 #p "name: %s" % "aimyon" #"name: aimyon"
 #p "name: %10s" % "aimyon" #"name:     aimyon"　 / 10桁分の幅を確保してくれる
 #p "name: %-10s" % "aimyon" #"name: aimyon    " / 10桁分を確保しつつ左寄せ（ひだりよせ）にしてくれる

 p "id: %05d, rate: %010.2f" % [555, 5.677] #"id: 00555, rate: 0000005.68"　/ 5 桁にしたいけど 5桁に満たない場合は 0で埋めて欲しいという意味
 #値が複数の場合は配列を利用
 #全体の文字数が 10文字、そのうち小数点以下が 2文字 / 全体の文字数には小数点の「.」も含まれる

=begin
print
改行を入れずに引数（ひきすう、アーギュメント）に指定した値を出力する
例） print 'こんにちは'
print '今日の天気は'
print '晴れですね'
実行結果　　
こんにちは今日の天気は晴れですね
=end

=begin
puts
改行が入る形で出力される
例） print 'こんにちは'
print '今日の天気は'
print '晴れですね'
実行結果　　
こんにちは
今日の天気は
晴れですね
=end

=begin
p
出力する値と共に型情報（かたじょうほう）（文字列や数値型など）を一緒に出力する
p '私の年齢は'
p ２４
p '歳です。'
実行結果
"私の年齢"
40
"歳です。"
文字列はダブルクォーテーションで囲まれて、数字はそのまま出力される
=end

=begin 
printf
書式を指定して出力するためのメソッド
printf('商品情報: カテゴリー %s 型番（かたばん) %d', ' uniform', 20220309)
実行結果
商品情報: カテゴリー uniform 型番(かたばん) 20220309
=end

=begin 
sprintf
表示するのではなくて文字列を返してくれる命令
基本的にprintfと似ているけど、文字列に代入するだけだからputsやpで出力してあげる必要がある
例）　p sprintf("明日、%sの最高気温は%d度です。","甲子園",29)
実行結果
"明日、甲子園の最高気温は29度です。"
=end 
p sprintf("name: %10s\n", "aimyon")
p sprintf("id: %05d, rate: %10.2f\n", 355, 3.284)

#if
#> < >= <= == !=
## &&(AND) ||(OR) !(NOT)
puts "点数を入力してください"
# gets / ユーザーから入力を受け付けるメソッド　
#score = gets.to_i #getsで受け取るのは文字列になるからそれを数値に変換する必要がある
#  if score > 90 then
#      puts "よく頑張ったな!"
#  elsif score > 80 then
#      puts "あと少しだね"
#  else 
#      puts "もっと頑張りなさい!"
#  end

#puts "よく頑張ったな!" if score > 95 #単純な条件分岐の場合使える

#case

#signal = gets.chomp

# case signal
# when "red"
#     puts "stop!"
# when "green", "blue"
#     puts "go!"
# when "yellow"
#     puts "caution!"
# else
#     puts "wrong signal"
# end

#入力した値のところで改行される
# name = gets
# puts "こんにちは" + name + "さん" #こんにちはaimyon
#                                 #さん

# #gets.chomp / 改行を解除できる
# name = gets.chomp
# puts "こんにちは" + name + "さん" #こんにちはaimyonさん


#while
# i = 0

# while i < 10 do
#     puts "#{i} hello"
#     #i = i + 1
#     i += 1
# end

#times / 回数が決まっている場合に便利
# 10.times do |i|
#     puts "#{i} hello"
# end

10.times { |i| puts "#{i} hello" } # 1 行で書く場合

#for
# for i in 15..20 do #doは省略可能
#  p i  # 15 16 17 18 19
# end

#for 配列
# for team in ["hanshin", "kyojin"]
#     p team # "hanshin" "kyojin"
# end

# #for ハッシュ
# for name, age in {masaki: 25, aimyon: 29} do
#     # p age # 25 29
#     puts "#{name}: #{age}" #masaki: 25 aimyon: 29
# end

#each
#内部的には each というメソッドを使う
#集合的なオブジェクトのメソッドとして動作する

# (15..20).each do |i|
#     p i
# end

# ["hanshin", "kyojin"].each do |team|
#     p team
# end

# {masaki: 25, aimyon: 29}.each do |name, age|
#     p "#{name}: #{age}"
# end

# # 1行の場合
# {masaki: 25, aimyon:29}.each { |name,age| p "#{name}: #{age}"}

#loop
#永遠に処理を繰り返す
# i = 0
# loop do
#  p i
#  i += 1
# end

#break / ループを抜けるため
#next / ループを 1 回スキップするため
#  10.times do |i|
#     if i == 7 then
#         #break # 0 1 2 3 4 5 6
#         next # 0 1 2 3 4 5 6 8 9
#     end
#     p i
#  end

#メソッド
#作り方 / def(define((定義する)) というキーワードから始めてメソッド名を書いてあげれば OK
# def printName(name) #引数(ひきすう)
#     puts name
# end

#引数にデフォルト値(デフォルトち)を与えることもできる
#名前を渡さなかったときにデフォルト値のmasakiを名前にしてくれる
#  def printName(name = "masaki") #引数(ひきすう)
#      puts name
#  end

#値を返したい場合
 def printName(name = "masaki")
     return "hi #{name}" #返り値(かえりち)、戻り値(もどりち)、return値（リターンち）
 end
 #p printName # "hi masaki"

#メソットを呼び出す
#printName("aimyon")
#printName "aimyon"
#意味が曖昧にならない場合は 上のように丸括弧（まるかっこう）は省略することができる

=begin
引数（ひきすう）とパラメータの違い
引数（ひきすう） == アーギュメントは、関数に渡した実際の値のこと
arg = "aimyon"
printName(arg)
argは引数

パラメータは、関数に受け渡されるもの
def printName(name)
    puts "kang"
end
nameがパラメータ
=end

#クラス
#クラス名は必ず大文字から始めないといけない

class User

    @@count = 0 #クラス変数 / 0(ゼロ)で初期化（しょきか）。

    VERSION = 1.8 #クラスで定数を定義　 / 1 文字目が大文字で慣習的に全て大文字にすることが推奨（すいしょう）されている

    #変数の値にアクセスしたい場合(インスタンスメソッド内では使うことができるけど、外部からアクセスすることはできない。)
    #例えば書き換えてみたり、もしくは単に表示してみるなどの処理
    attr_accessor :name # setter: name=(value), getter: name
    #インスタンス変数の名前をシンボルで渡してあげると自動的に name をセットするための name= というメソッド(setter)と、
    #name にアクセスするための name というメソッド(getter)を作ってくれる

    #getterだけ定義したい場合,attr_readerを使う
    # attr_reader :name

    #new が呼ばれたときに 特殊な initialize というメソッド呼ばれる
    def initialize(name)
        @@count += 1
        @name = name #インスタンス変数 / インスタンス変数名の前に @(アット（マーク)) をつけるルールになっている
    end
    
    def sayHi
    #self / 受け取っているインスタンス自身を指す（ここでは　aimyonやmasakiを指す）
    

    #メソッド内で定義した変数はその外からアクセスできないけど、このインスタンス変数は特別で、このインスタンスの中であればどこででも使える。
        puts "hi! i am #{@name}"
        puts "hi! i am #{self.name}" ##self.name -> @name / 結果としてgetterを呼ぶからンスタンス変数が取得できて name が返ってくる
        puts "hi! i am #{name}" # self は意味が曖昧にならない限り省略できる
    end

    #クラスメソッド
    def self.info
        puts "#{VERSION}: User Class, #{@@count} instances."
      end
end

#インスタンスを作ってaimyonという変数に割り当てる
#aimyon = User.new
aimyon =  User.new("aimyon") #インスタンスを作るときに名前を渡してあげる
aimyon.sayHi #hi! i am aimyon

masaki = User.new("masaki")
masaki.sayHi #hi! i am masaki / インスタンスごとに値が保持(ほじ)される

masaki.name = "suda masaki" # setterで名前を変更
p masaki.name # "suda masaki" #getterでmasakiというインスタンスの名前を表示
masaki.sayHi # hi! i am suda masaki / メソッドを受け取っているオブジェクトのことを「受け取っているもの」という意味で「レシーバー」と呼ぶ
 

#クラスメソッドはクラスから直接呼び出すことができる
User.info

#クラスでの定数をクラスの外からアクセスする方法
p  User::VERSION

#クラスの継承（けいしょう）
#Userクラスは　親クラス(親クラス）　もしくは　Superクラスと呼ぶ
#AdminUserクラスは　子クラス（こクラス）　もしくは　Subクラスと呼ぶ
class AdminUser < User

    def sayHello
        puts "Hello from #{name}"
    end  

    #子クラスで同名（どうめい）のメソッドを上書き(うわがき)することもできる -> オーバーライドと言う
    def sayHi
        puts "hi from admin!"
    end
end

aimoyn = AdminUser.new("aimyon")
aimoyn.sayHi #オーバーライドをしないと親クラスのsayHiが呼ばれる　、　オーバーライドすると子クラスのsayHiが優先されて呼ばれる
aimoyn.sayHello

#アクセス権(アクセスけん)
#public / #通常のメソッドはpulbicがデフォルトになっている
#例外があって, new したときに呼ばれる initialize メソッドと、クラスの外に書いたメソッドは自動的に private になるから、覚えておこう。
#protected
#private / レシーバーは指定できない
# ***** 
#Ruby の private指定は他の言語のオブジェクト指向プログラミングと動作が異なっていて、Sub Class から呼び出せたり、オーバーライドすることができたりするので、十分注意して使うようにしましょう。

class Person
    def walk
        puts  "walk in the park"
        eat # privateのメソッドをクラスの中からは呼び出せる
        #self.eat #意味的には self.eat だけど、bprivateではレシーバーを指定できないから　必ず selfは省略しよう。
    end

    private
    def 
         eat
         puts "eat ramen"
    end
end


class Student < Person
    def 
        studyKorean
        puts "study Korean"
        eat #walk と eat を両方継承しているので、実は eat を Student でつくるメソッドからも呼び出せる
        #privateの　eatメソッドを上書きしないと親クラスのeat ramenが　表示される、上書きすると　親クラスのeat　sushiが　表示される
   end

   def 
        studyEnglish
        puts "study English"    
    end
    
    #rubyでは　privateの同名のメソッドを実は上書きすることもできる
    def eat
        puts "eat sushi"
    end

end

#Person.new.eat # NG / レシーバーを指定できないから、例えば Userのインスタンスから呼び出すことはできない
 #Person.new.walk # walk in the park,  eat ramen

Student.new.studyKorean #study Korean ,  （(上書きしない時)eat ramen、　(上書きした時)eat sushi）
Student.new.eat #eat sushi

#module(モジュール)
# moduleはクラスのようにメソッドや定数をまとめられるもの　/ インスタンスを作ったり継承することはできない
# メソッド名が他の人が作ったメソッド名や、ライブラリのメソッド名などと衝突する場合があるからそういう時にモジュールを使って自分だけの名前空間を作ればOK
# メソッドや定数などをざっとまとめてグループ化したいだけのときに便利

module Movie

    VERSION = 1.8

    def self.encode
        puts "encoding..."
    end

    def self.export
        puts "exporting..."
    end
end

Movie.encode
Movie.export
p Movie::VERSION #moduleでの変数もクラス定数と同じように使うことができる


#ミックイン
#継承関係にない複数のクラスに共通の機能を提供する場合に便利
 
module Debug

    def info # selfをつけずに単にインスタンスメソッドにしてあげると、それを他のクラスのインスタンスメソッドとしてはめ込むことができる
        puts "#{self.class} debug info..."
    end
end 

class Player
    include Debug
end

class Monster
    include Debug
end

Player.new.info
Monster.new.info

