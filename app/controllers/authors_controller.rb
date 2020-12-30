class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def profile
    @author = current_author
  end

  def save_profile
    @author = current_author
    @author.update(author_params)
    redirect_to profile_authors_path
  end

  private

  ## Strong Parameters
  def author_params
    params.require(:author).permit(:avatar, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
