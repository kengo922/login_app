class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in(user) 
      redirect_to "/users/#{user.id}"
    else
      flash.now[:danger] = 'メールアドレス/パスワードの組み合わせが無効です'
      # flash.nowは、更新されたらメッセージが消滅する
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to "/"
  end

end
