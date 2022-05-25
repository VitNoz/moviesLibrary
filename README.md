# Movies Librari based on MovieDB Api
___
## Tasks
Создать UITabBarController c 2-мя табами. UITabBarItem (названия 1. MoviesList 2. Favorites). 
Первый childViewController это первый таб “List VC”. Должен содержать список фильмов. 
Верстку ячейки сделать кодом. Ячейку отобразить нативными методами autolayout/constraints.
Данные спарсить используя нативные методы URLSession. Для структурирования моделей использовать протокол Codable. 

Функции:

1 - При нажатии на ячейку (UITableViewCell или UICollectionViewCell) открывать экран Details фильма. Отобразить изображение фильма, его описание и год выпуска.

2 - При long press по ячейке, контент добавляется в Favorites. А во втором childViewController (второй таб “Favorites”) отобразить те фильмы, которые юзер добавил в избранное. Избавиться от дубликатов при добавлении. (Для верстки для второго таба “Favorites” использовать TableView или CollectionView сделать полностью кодом (не через Storyboard) использовать нативную верстку, а ячейку сверстать xib файлом.

3 - При нажатии на ячейку во втором табе “Favorites” открывается новый экран - отобразить жанр и название фильма, год выпуска… 

4 - Во втором табе “Favorites” сделать возможность редактирования, для удаления ячейки, если быть точнее юзер удаляет избранный элемент. Визуально дать понять юзеру, что элемент удален.

___

List of movies from MovieDB Api:
___


<img width="370" alt="Снимок экрана 2022-05-12 в 14 38 52" src="https://user-images.githubusercontent.com/32483175/168753840-13f81067-ed02-4d03-b752-e4f6f4a7c90c.png">



Selected movie with it description:
___


<img width="361" alt="Снимок экрана 2022-05-12 в 14 39 21" src="https://user-images.githubusercontent.com/32483175/168753871-c7d606f4-0745-44cc-a21a-4c56ecf14981.png">



List of favorites movies which added by long press(with removed duplicate):
___


<img width="364" alt="Снимок экрана 2022-05-12 в 14 40 21" src="https://user-images.githubusercontent.com/32483175/168753896-98f0c00c-7770-4b41-becf-7091dd73bde0.png">



Selected favorite movie with it description:
___


<img width="370" alt="Снимок экрана 2022-05-12 в 14 40 59" src="https://user-images.githubusercontent.com/32483175/168753910-028f5fca-1dcb-4b28-a058-720d281aa5a0.png">
