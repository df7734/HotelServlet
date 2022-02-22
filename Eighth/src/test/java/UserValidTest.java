import com.example.hotel.classes.User;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import validation.UserValid;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.*;

public class UserValidTest {

    public static Stream<Arguments> testCasesRegular() {
        return Stream.of(
                Arguments.of("Ann", "ann@gmail.com", "1234ann", "0777777777"),
                Arguments.of("Bob", "bob@gmail.com", "qwerty", "099999999999"),
                Arguments.of("Sam", "samsamsam@gmail.com", "123456", "099999555999"),
                Arguments.of("Richard", "richard07@gmail.com", "0707Rr", "055555555555"));
    }

    public static Stream<Arguments> testCasesUnexpected() {
        return Stream.of(
                Arguments.of("A", "ann@gmail.com", "1234ann", "0777777777"),
                Arguments.of("Bob", "bob@", "qwerty", "099999999999"),
                Arguments.of("Sam", "samsamsam@gmail.com", "16", "099999555999"),
                Arguments.of("Richard", "richard07@gmail.com", "0707Rr", "05555555555555555555555555"));
    }

    @ParameterizedTest
    @MethodSource("testCasesRegular")
    void regularInput(String name, String email, String password, String phone) {
        assertTrue(UserValid.userIsValid(new User(name, email, password, phone)));
    }

    @ParameterizedTest
    @MethodSource("testCasesUnexpected")
    void unexpectedInput(String name, String email, String password, String phone) {
        assertFalse(UserValid.userIsValid(new User(name, email, password, phone)));
    }

    @Test
    void nullInput() {
        assertFalse(UserValid.userIsValid(new User(null, null, null, null)));
    }

    @Test
    void emptyInput() {
        assertFalse(UserValid.userIsValid(new User("", "", "", "")));
    }

    @Test
    void secondConstructor() {
        assertFalse(UserValid.userIsValid(new User("email@gmail.com", "qwerty123")));
    }
}
