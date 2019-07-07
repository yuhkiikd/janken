#ruby sample.rb
puts "じゃんけん・・・"
class Player#まずプレイヤーの手を文字列で取得する
  def hand
    puts "数字を入力してください。\n0:グー\n1:チョキ\n2:パー"
    STDOUT.flush#putsのあとのgetsが上手く作動しなかったので入れました。
    player_hand = gets
    return player_hand
  end
end

class Enemy#次にマシン側の手をランダムな数値で取得する
  def hand
    random = Random.new()
    enemy_hand = random.rand(3)
    return enemy_hand
  end
end

class Janken#じゃんけん用のクラス作成
  def pon(player_hand, enemy_hand)
    pattern = ["グー","チョキ","パー"]#じゃんけんのパターンを配列化
    if player_hand !="0\n" && player_hand !="1\n" && player_hand !="2\n"#0～2までの文字列でなければここで弾かれる
      player = Player.new#Playerクラスから新たにオブジェクト（インスタンス）作成し、変数playerへ代入
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
    else
      while true#決着がつくまでループする
        player_hand = player_hand.to_i#プレイヤーの手を数値に変換
        result = (player_hand - enemy_hand + 3) % 3#じゃんけんの結果を求める式
        if result == 0
          puts "自分の手は#{pattern[player_hand]}、相手の手も#{pattern[enemy_hand]}です。"#
          puts "あいこで・・・"
          player = Player.new#Playerクラスから新たにオブジェクト（インスタンス）作成し、変数playerへ代入
          enemy = Enemy.new
          janken = Janken.new
          janken.pon(player.hand, enemy.hand)
          return true
        elsif result == 2
          puts "自分の手は#{pattern[player_hand]}、相手の手は#{pattern[enemy_hand]}です。あなたの勝ちです。(^ ^)"
          return false
        elsif result == 1
          puts "自分の手は#{pattern[player_hand]}、相手の手は#{pattern[enemy_hand]}です。相手の勝ちです。(T T)"
          return false
        end
      end
    end
  end
end

#以下、上記処理を出力するための処理
player = Player.new#Playerクラスから新たにオブジェクト（インスタンス）作成し、変数playerへ代入
enemy = Enemy.new
janken = Janken.new
janken.pon(player.hand, enemy.hand)
