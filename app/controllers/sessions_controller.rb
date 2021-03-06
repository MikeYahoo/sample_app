class SessionsController < ApplicationController

	# Used for a sign-in page
	def new

  end

  # Used to complete the sign-in
  def create

		user = User.find_by(email: params[:session][:email].downcase)
	  
	  if user && user.authenticate(params[:session][:password])
	    
	    # Sign the user in and redirect to the user's show page.
			sign_in user
      redirect_back_or user
	  
	  else
	  
	    # Create an error message and re-render the signin form.
	    flash.now[:error] = 'Invalid email/password combination'
      render 'new'
	  
	  end

  end

  # Used to delete the session
  def destroy
  	# Sign the user out
  	sign_out

  	# Redirect them back to the root page of our website
    redirect_to root_url
  end

end
