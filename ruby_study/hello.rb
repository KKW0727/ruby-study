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
#足し算は +、引き算は -、掛け算は *（アスタリスク）、割り算は /(スラシー)
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