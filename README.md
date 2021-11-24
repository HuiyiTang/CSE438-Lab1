creative points

1. What I implemented
I create Message Box in order to deal with different invalid input situations, including non-numeric input, extreme large input, invalid discount input (when discount > 100), extreme large output and so on.

2. How I implemented it
2.1 The way I implemented it is using Message Boxes. The Message Box can be divided into 3 parts: title, message and action through UIAlertController. The title of Message Box I set is "Alert". The messages inside are some warning sentences based on diverse invalid inputs. The title of UIAlertAction is OK, which means you can close the Message Box by clicking OK. 
2.2 Meanwhile, I set maximum value for both original price input and final price output (they are both supposed to be less than 100000).

3. Why I implemented it
If I were to put myself in the shoes of the user of this calculator, it's very normal to input some "invalid things" when they are using it. In that case, calculator designer need to take action when unreasonable inputs appear to avoid program's crash. These Message Boxes can alert users that there exists an input problem and also provide suggestions.
