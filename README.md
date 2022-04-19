# Pixabay
An app for searching images via the Pixabay API built with Clean Swift.

The Clean Architecture (VIP) is an architecture pattern that separates objects into three distinct types mainly made up of View, Interactor and Presenter

![image](https://user-images.githubusercontent.com/8598858/163920980-0aa20b36-a368-43fa-9aff-e1d3acc915f2.png)

With VIP, the responsibilities are divided equally where 

View delegate user interaction to Interactor.
Interactor contains the business logic and sends the response to Presenter.
Presenter parse the data and return to View.
As the app grows larger, you will have additional components such as Router and Worker. Router takes care of all the navigation logics navigation logic while Worker helps lessen the burden of Interactor by performing task such as network call, implementing 3rd party SDK and etc.

Do note that Worker should be easily used by multiple interactors. 
