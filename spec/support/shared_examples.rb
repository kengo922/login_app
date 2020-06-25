  # spec/support/shared_examples.rb
  # Userモデル

    # 属性・メソッドの検証
    shared_examples_for "User-model respond to attribute or method" do
      it { should respond_to(:name) }
      it { should respond_to(:email) }
      it { should respond_to(:password) }
      it { should respond_to(:password_confirmation) }
      it { should respond_to(:authenticate) }
      it { should respond_to(:password_digest) }
      it { should respond_to(:remember_digest) }
      it { should respond_to(:activation_digest) }
      it { should respond_to(:admin) }
      it { should respond_to(:microposts) }
      it { should respond_to(:feed) }
      it { should respond_to(:active_relationships) }
      it { should respond_to(:passive_relationships) }
      it { should respond_to(:following) }
      it { should respond_to(:followers) }
      it { should respond_to(:follow) }
      it { should respond_to(:unfollow) }
      it { should respond_to(:following?) }
    end

        # 成功メッセージ
    # flash[:success]
    shared_examples_for "success message" do |msg|
      it { subject.call; expect(flash[:success]).to eq msg }
    end

    # 失敗メッセージ
    # flash[:danger]
    shared_examples_for "error message" do |msg|
      it { subject.call; expect(flash[:danger]).to eq msg }
    end

    # リダイレクト
    # redirect to path
    shared_examples_for "redirect to path" do |path|
      it { subject.call; expect(response).to redirect_to path }
    end