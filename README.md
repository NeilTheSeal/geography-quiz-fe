# Geography Quiz Front-End
> A fun online quiz to test your knowledge of world geography

![Ruby][ruby-image]
![Rails][rails-image]

This is the front end to the **Geography Quiz** web application made by students at [Turing School of Programming and Design](https://turing.edu) over the course of two weeks. It is [deployed on Heroku](https://secret-citadel-94988-86e2ffef1cda.herokuapp.com) and uses PostgreSQL to store user data, along with OAuth2 to create accounts. The quiz questions are randomly generated using data from the [REST Countries API](https://restcountries.com). Each quiz is 20 questions and there is a high scores list displaying the most knowledgable folks. The back end of this project is open source and [available on GitHub.](https://github.com/NeilTheSeal/geography-quiz-be)

<img src="https://secret-citadel-94988-86e2ffef1cda.herokuapp.com/quiz_screenshot.png" alt="drawing" width="400" style="transform:translateX(calc(50vw - 75%));"/>

## Example quiz questions

- Is Yemen landlocked?
  - true
  - false <--

- What country has the population of 7,275,556?
  - Zimbabwe
  - Dominica
  - North Macedonia
  - Laos <--

- What is the flag of the Dominican Republic?
  - <img src="https://flagcdn.com/pt.svg" style="width: 60px; margin-bottom: 8px; transform:translateY(50%);">
  - <img src="https://flagcdn.com/do.svg" style="width: 60px; margin-bottom: 8px; transform:translateY(50%);"> <--
  - <img src="https://flagcdn.com/cu.svg" style="width: 60px; margin-bottom: 8px; transform:translateY(50%);">
  - <img src="https://flagcdn.com/ht.svg" style="width: 60px; margin-bottom: 8px; transform:translateY(50%);">

## Q&A

- Is there a database of possible questions?
  - No, these questions are generated randomly from a large dataset of geographical information.

- What personal information do you store if I create an account?
  - We only store your name as it appears on your Google account. No emails or other personal information is saved.

- Can I retake the quiz?
  - You can take the quiz as many times as you want, and your dashboard will show your previous quiz scores and the dates you attempted those quizzes.

## Development setup

The front-end of this project uses Ruby on Rails 7.1.3 and was built using macOS Sonoma 14.4.1. It uses the [hotwire-livereload gem](https://github.com/kirillplatonov/hotwire-livereload) to dynamically refresh the browser whenever changes are made to files within `/app/`.

First, clone the repository to your computer

```sh
git clone git@github.com:NeilTheSeal/geography-quiz-fe.git
```

This guide assumes you have installed [homebrew](https://brew.sh), [Rails 7.1.3](https://guides.rubyonrails.org/v7.1/getting_started.html), [node.js 21.6.2](https://github.com/nvm-sh/nvm), and [PostgreSQL >= 14](https://www.postgresql.org/download/). In the repository root directory, run

```sh
npm install --save
```
If you do not have [redis](https://github.com/redis/redis) installed, run

```sh
brew install redis
```

Next, install all of the Gems

```sh
bundle install
```

Install the **bun** JavaScript bundler globally -

```sh
npm install -g bun
```

Install the livereload feature -

```sh
rails livereload:install
```

Start the **redis** background task -

```sh
brew services restart redis
```

Create the necessary databases -

```sh
rails db:{create,migrate,seed}
```

Finally, start the development server

```sh
./bin/dev
```

and open a web browser with URL `localhost:3000`. Keep in mind that the [back end of this application](https://github.com/NeilTheSeal/geography-quiz-be) must be running on `localhost:5000` for the front end to function correctly. For instructions on how to run the back-end server, see the [back end GitHub page](https://github.com/NeilTheSeal/geography-quiz-be).

## Release History

* 0.0.1
    * Initial deployment 06/07/2024

## Meta

Neil Hendren | [NeiltheSeal](https://github.com/NeiltheSeal) | neil.hendren@gmail.com | [LinkedIn](https://www.linkedin.com/in/neilhendren/)

Luis Aparicio | [LuisAparicio14](https://github.com/luisaparicio14) | lfelipeaparicio2004@gmail.com | [LinkedIn](https://www.linkedin.com/in/luis-aparicio14/)

Rodrigo Chavez - [RodrigoACG](https://github.com/RodrigoACG) | Rodrigo103004@gmail.com | [LinkedIn](http://www.linkedin.com/in/rodrigo-chavez1)

Distributed under the MIT license. See ``LICENSE.txt`` for more information.

## Contributing

Email any author to inquire about contributing.

<!-- Markdown link & img dfn's -->
[ruby-image]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[rails-image]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white

