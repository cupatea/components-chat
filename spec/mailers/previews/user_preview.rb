# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: user).welcome_email
  end

  def reset_password_email
    UserMailer.with(user: user).reset_password_email
  end

  private

  def user
    User.new(
      name: 'Preview User',
      email: 'preview@email.com',
      password: 'new password'
    )
  end
end
