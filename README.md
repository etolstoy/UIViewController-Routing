# UIViewController+Routing

**UIViewController+Routing** is a handy category, which helps with implementing a better navigation in iOS applications using *Routers*.

It does the following things at the moment:
- Holds an abstract router,
- Swizzles *-prepareForSegue:* method, forwarding it to the router.
- Provides the *-performSegueWithBlock:* method, which helps to get rid of fat *-prepareForSegue:* method.

###Additional Info
[Here] you can read about using this category for a simple test case (in Russian). And check this [demo project] for an example of usage this concept in a more realistic app.

### Author
[Egor Tolstoy] - [@igrekde].

### License
UIViewController+Routing is available under the MIT license. See the LICENSE file for more info.

[Here]:http://etolstoy.ru/slim-routers/
[demo project]:https://github.com/igrekde/MultipleStoryboardsSample
[Egor Tolstoy]:http://etolstoy.ru
[@igrekde]:http://twitter.com/igrekde
