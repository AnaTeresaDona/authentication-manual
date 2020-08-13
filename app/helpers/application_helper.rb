module ApplicationHelper
    

    def current_user
        User.find_by(id: session[:user_id]) #devuelve el objeto del usuario.
    end

    def logged?
        !current_user.nil? #Dice si existe o no el objeto usuario. Si es nulo, no está loggeado el usuario. 
        #current_user ? true : false  Esta es otra manera de hacer lo mismo de la línea 7. 
    end
end
#Ojo, que ambas cosas deberían estar en el modelo usuario. 