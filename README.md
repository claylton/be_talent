# be_talent_test_dev

<p align="center">
  <img alt="Mobile_1" src="https://github.com/claylton/be_talent/blob/main/docs/readme_images/mobile_1.jpeg">
</p>

<p align="center">
  <img alt="Mobile_2" src="https://github.com/claylton/be_talent/blob/main/docs/readme_images/mobile_2.jpeg">
</p>

---

## 📁 Architecture

- 📦assets
  - 📂fonts
  - 📂icons
  - 📂images
- 📦lib
  - 📂controller
  - 📂errors
  - 📂extensions
  - 📂models
  - 📂view
    - 📂pages
    - 📂resources
    - 📂widges

## 🛠 Version

- [Flutter](https://flutter.dev/) - v3.24.3 - Channel stable
- [Dart](https://dart.dev/) - v3.5.3

## Access to the simulated API data

To access the data that will feed the project, do the following:

1. if you don't have it, install the json-server package [json-server](https://github.com/typicode/json-server);
2. clone this GitHub fork repository on your machine: [https://github.com/claylton/desafio-mobile/tree/main](https://github.com/claylton/desafio-mobile/tree/main);
3. enter the project folder on your machine and run the command `json-server --watch database.json`, from the command line to consume the simulated API;

You must leave json-server running in the terminal for the data to be displayed in the project.

If you have problems with json-server, try running it with `npx json-server database.json` or
with `yarn json-server <path>/database.json`, where `<path>` is the full path to the directory where the database.json file is located. f it still doesn't work, look for help on the web.

## Running the Project
To run the project on an emulator or physical device, follow these steps:

- Clone the repository:


[https://github.com/claylton/be_talent](https://github.com/claylton/be_talent)

- Go to repository
  ```cd yandeh_teste_dev```

- Install the dependencies:

```flutter pub get```

- Ensure the emulator is running or the device is connected. You can check the available devices with the following command:

```flutter devices```

- Run the project:

```flutter run -d (device)```

---

## 🦸 Author

<a href="https://github.com/claylton">
 <img style="border-radius: 50%;" src="https://avatars0.githubusercontent.com/u/48772089?s=400&u=0a38d33b4b0078a8c02e481fdc4dc5535498000f&v=4" width="100px;" alt=""/>
 <br />
