

## ASSIGNMENT 7 README

 Explain what are stateless widgets and stateful widgets, and explain the difference between them.

 stateless widgets are widgets that can't change after its creation. exampleps of this would be simple icons in the UI that won't affect the user's experience greatly. stateful widgets are widgets that can be updated and are mutable. an example of this would be a button that can change color when pressed. The main difference is stateless widgets are immutable and stateful widgets are mutable. 



 Mention the widgets that you have used for this project and its uses.


 scaffold: the basic structure of the ui
 appbar: this is used for the topbar that will display the title of the application
 padding
 infocard:a stateless widget that displays the user info in a card
 inkwell: adds the tap effect when a user presses on a widget
 material:adds visual and interactive features to an item card
 icon: displays an icon from the built in library


 What is the use-case for setState()? Explain the variable that can be affected by setState().

 setState() function is used in stateful widgets. it is a useful function as it sends the widget data which would then update the widget. an example of how a setstate could update a variable would be a counter, that increment each time a button is pressed. that button would use a setState(function) to display the count. 

 Explain the difference between const and final keyword.

 const: values that are known during compile time, and will not be able to change. 
 final: values that are known during runtime and can only be set once. it can't change afterwards. 
 const is generally more restrictive than final. 


Step-by-Step explanation:
1. created a flutter application by running flutter create "appname" in terminal
2. created a new dart file called `menu`
3. moved MyHomePage to `menu` from `main`
4. created a variable in MyHomePage to display the application name in the ap bar
5. created a list for the buttons of the application, View Product List, Add Product, Logout
6. added unique icons and color to each of the three buttons. 
7. changed the theme color of the application to green in MyApp class to match the theme of my past assignements. 
8. created the itemcard class to display each of the buttons. the snackbar message will appear if the buttons are tapped.
