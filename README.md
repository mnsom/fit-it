# FIT IT

Project description goes here

_DROP SCREENSHOT HERE_
<br>![Capture](https://github.com/mnsom/fit-it/assets/136877239/3ae3f403-f8f0-4d9e-9977-f7b4b778c778)
![Capture2](https://github.com/mnsom/fit-it/assets/136877239/b54bf6f5-e6ac-444b-a70b-2caa36979cf3)
![Capture3](https://github.com/mnsom/fit-it/assets/136877239/c11ab8bf-5294-42ab-9bec-17018855e267)
![Capture4](https://github.com/mnsom/fit-it/assets/136877239/b5ef00ec-d455-4004-b0a7-0b18db336ed9)

App home: https://www.fit-it.homes/
   

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
The Le Wagon Tokyo Teaching Staff

## Team Members
- [Oscar Alan Sanchez](https://github.com/Alan-Tecua)
- [Misako Moriyama](https://github.com/MisaMisaM)
- [Lisa Takenouchi](https://github.com/Lisatknc)
- [Mana Misawa](https://github.com/mnsom)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
