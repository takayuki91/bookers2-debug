class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    # ゲストユーザーをログイン状態にする
    sign_in user
    redirect_to user_path(user), notice: 'guestuserでログインしました。'
  end
end