class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  # セーブする時、上のコードが走る。
  # downcase 大文字
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end

# :case_sensitive	→ 大文字と小文字を区別するか	デフォルト値はtrue
# uniqueness: true 一意性

# has_secure_password
# セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できるようになる。
# 2つのペアの仮想的な属性（passwordとpassword_confirmation）が使えるようになる。また、存在性と値が一致するかどうかのバリデーションも追加される
# authenticateメソッドが使えるようになる（引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド）。