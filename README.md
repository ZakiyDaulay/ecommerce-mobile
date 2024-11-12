

## ASSIGNMENT 7 README

 Explain what are stateless widgets and stateful widgets, and explain the difference between them.

 stateless widgets are widgets that can't change after its creation. exampleps of this would be simple icons in the UI that won't affect the user's experience greatly. stateful widgets are widgets that can be updated and are mutable. an example of this would be a button that can change color when pressed. The main difference is stateless widgets are immutable and stateful widgets are mutable. 



 Mention the widgets that you have used for this project and its uses.


 - scaffold: the basic structure of the ui
 - appbar: this is used for the topbar that will display the title of the application
 - infocard:a stateless widget that displays the user info in a card
 - inkwell: adds the tap effect when a user presses on a widget
 - material:adds visual and interactive features to an item card
 - icon: displays an icon from the built in library


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



## ASSIGNMENT 8 README

What is the purpose of const in Flutter? Explain the advantages of using const in Flutter code. When should we use const, and when should it not be used?

const is used to make variable and widgets that are fixed and will not change during runtime. There are several advantages. one of those include it being more efficient, where the widgets are only built once which can save a lot of time and improve performance. the code will also look generally cleaner. when a widget is defined as a constant, it can provide the developer with more information regarding the overall code. The main use of const is for static widgets, which are widgets that don't change in value. You could also use const to be more efficent when defining a specific object like a color, where only one color is used during a section of the code. it shouldn't be used on widgets that depend on dynamic values. examples of dynamic value widgets are ones where the widgets gets input from the user. 

Example of Column:



Explain and compare the usage of Column and Row in Flutter. Provide example implementations of each layout widget!
column and row are used to arrange child widgets in either horizontal or vertical direction. the column is aligned on the vertical axis, while the row is aligned in the horizontal axis. 


```markdown

child: const Column(
  children: [
    Text(
      'The Swag Store',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    Padding(padding: EdgeInsets.all(8)),
    Text(
      "Buy all the stuff you want",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
  ],
),
```

In this code, the colum widget organizes the texts widgets vertically, meaning that it's on top of each other.

```markdown

        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),//info cards on the top of the app
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
        )
```

In this code, the row widget is arranged horizontally. this is done by aligning the infocard widgets along the main axis which is horizontal. 

List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!


The three main input elements I used on the form page in this assignment is for the product name, the description of the product, and the price of the product. There are several other input elements I didn't use in this assigment. 

These include, checkbox which allows the user to pick an option from a set, switch allows the user to toggle between two options, a slider, which lets the user pick an option from a sliding a knob along a line, datepicker which allows the user to select a date and many more. 


How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?

Yes, you can set a general theme in a flutter application. This is done by defining the ThemeData object in the materialapp widget. I implemented a theme in my application in the main.dart 
  ```markdown
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
      ).copyWith(secondary: Colors.green[400]),
      ),
      home:MyHomePage()
    );
  }
}
```

In this snippet of my main.dart code I set a general color to my application which is green. I also highlighted a secondary color which is also green. This is done to ensure that there is a neat and consistent presentation to my application. 

How do you manage navigation in a multi-page Flutter application?

to navigate a multi-page flutter application, it uses the navigator widget. to manage the transition between screens. and in each of these screens, they're considered as a route and we are able to use the nivagtion methods to push and pop these routes. 

`navigator.push()` will add a new page to the navigation stack

`navigator.pop()` goes back ot the previous screen

`navigator.pushReplacement()` replaces the current route

`navigator.pushandRemoveUntil()` will push a new route and remove a route from the navigation stack until a certain conidtion is met 