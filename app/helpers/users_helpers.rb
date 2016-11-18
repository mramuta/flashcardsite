helpers do
  def current_user
    User.find(session['user']) if session['user']
  end
end
