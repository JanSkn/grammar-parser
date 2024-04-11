<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/janskn/grammar-parser">
    <img alt="image" src="https://github.com/JanSkn/grammar-parser/assets/68644413/ffddfdb3-61be-46a8-84c2-5c7648158a6c" width="80" heigth="80">
  </a>

  <h3 align="center">Grammar Parser</h3>

  <p align="center">
    A parser for checking English sentences for correct grammar.
    <br />
    <a href="https://github.com/janskn/grammar-parser"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/janskn/grammar-parser/issues">Report Bug</a>
    ·
    <a href="https://github.com/janskn/grammar-parser/issues">Request Feature</a>
  </p>
</div>



<!-- ABOUT THE PROJECT -->
## About The Project

<p align="center">
  <img width="813" alt="image" src="https://github.com/JanSkn/grammar-parser/assets/68644413/c36c45b4-9d25-4c5a-9215-ed13f195490e">
</p>

<br /><br />
The parser checks the sentences after certain structural constraints.
<br />
This means, a sentence must consist of a noun phrase and a verb phrase. These can vary in their structure, such as active and passive
sentences, prepositions and so on.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Installation

_Follow these steps to run the project._

1. Clone the repo
   ```sh
   git clone https://github.com/janskn/grammar-parser.git
   ```
2. Install SWI-Prolog
   <br />
   Installation depends on your OS.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

This project was built with Prolog.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Open Prolog.
Load the file:
```sh
   consult("YourPath/src/parser.pl").
```

To check a sentence, enter
```sh
   s(Tree, [this, is, an, example], []).
```

A correct sentence gives you the tree, an incorrect one returns _false_.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

