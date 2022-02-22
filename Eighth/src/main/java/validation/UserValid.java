package validation;

import com.example.hotel.classes.User;

public class UserValid {
    public static boolean userIsValid(User user){
        if(user.getName() == null || user.getEmail() == null || user.getPassword() == null || user.getPhone() == null){
            return false;
        }
        else if (user.getName().length() < 2 || user.getEmail().length() < 5 || user.getPassword().length() < 4 || user.getPhone().length() < 6){
            return false;
        }
        else if(user.getName().length() > 50 || user.getEmail().length() > 50 || user.getPassword().length() > 20 || user.getPhone().length() > 12){
            return false;
        }
        else if(!user.getPhone().matches("[0-9]+")){
            return false;
        }
        else return true;
    }

}
