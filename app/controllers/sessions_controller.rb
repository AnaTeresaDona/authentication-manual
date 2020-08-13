class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase) #voy a buscar un usuario de acuerdo al email que me pasan. Si el usuario existe, sigue a la siguiente línea: autenticación. 
    if user && user.authenticate(params[:session][:password]) # El método authenticate viene con el bcrypt. Toma al usuario e intentar la autenticación. Hashea la inforamción y la coteja (con cuál)
      session[:user_id] = user.id #si el usuario existe y la contraseña está correcta se crea una variable de sesión que guarda el id de sesión. 
      redirect_to root_url, :notice => "Autenticación exitosa"
    else
      redirect_to root_url, :alert => "Las credenciales son incorrectas"
    end
  end

  def destroy
    session.delete(:user_id)
    #@current_user = nil
    redirect_to root_url, :notice => "Hasta luego"
  end
end
