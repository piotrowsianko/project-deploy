1. Make sure to install python 3.9.4 version
2. Download repository from GIT
3. Create virtual enviroment in directory with repository:
    open CMD, navigate to directory with downloaded repository
    type in: python -m c:\...\GlobalLogics\venv     where "..." is the path to downloaded repository
    after few seconds, virtual environment shall be created
    run it by navigating in cmd to venv/scripts
    and by typing "activate".
4. When venv is up and running, go back to GlobalLogics directory in cmd, type in "pip install -r requirements.txt"

To run the project download GIT Repository to your local machine
1. Navigate to the directory with downloaded repository
2. Go to GlobalLogics directory

3. Run the CMD and navigate to directory "...(directory where you downloaded the repository)/GlobalLogics"
4. Now navigate to ".../GlobalLogics/venv/Scripts/"
Type in CMD "activate" to start the virtual enviroment with all the packages required to run the project
5. Go back to ".../GlobalLogics/"
6. Type in CMD "uvicorn main:shop" to start the web server of the project!

7. Now if earlier steps were done properly, we have our server up and running on localhost. You can check it by typing
in your web-browser address "127.0.0.1:8000/"

8. Now to access the shop, go to file browser, navigate to directory with downloaded repository, then to folder GlobalLogics 
9. Run the interface.py file

It shall show console with application's main menu that asks the user to provide number defying which option to choose.

10. Type in console 1 to view products in shop and their current number

11. Type in console 2 to buy a product. It will ask you to provide the product name (Case sensitive!) so it's better to check with option 1 what do we have in the shop before deciding what to buy! 
Then it'll ask you to provide the ammount of the product that you'd like to buy.

12. Type in console 3 to close the application.


TESTS:
1. To run the test, make sure to have virtualenviroment activated and web server is running(points 1 to 6)

2. run test_main.py file 
