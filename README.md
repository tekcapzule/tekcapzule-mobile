<!-- PROJECT SHIELDS -->
<a name="readme-top"></a>
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Main Branch](https://github.com/tekcapsule/tekcapsule-mobile/actions/workflows/cicd.yml/badge.svg)](https://github.com/tekcapsule/tekcapsule-mobile/actions/workflows/cicd.yml) 
[![SonarCloud Bugs](https://sonarcloud.io/api/project_badges/measure?project=tekcapsule_tekcapsule-mobile&metric=bugs)](https://sonarcloud.io/project/overview?id=tekcapsule_tekcapsule-mobile)
[![SonarCloud Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=tekcapsule_tekcapsule-mobile&metric=vulnerabilities)](https://sonarcloud.io/project/overview?id=tekcapsule_tekcapsule-mobile)
[![SonarCloud Code Smell](https://sonarcloud.io/api/project_badges/measure?project=tekcapsule_tekcapsule-mobile&metric=code_smells)](https://sonarcloud.io/project/overview?id=tekcapsule_tekcapsule-mobile)
[![SonarCloud Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=tekcapsule_tekcapsule-mobile&metric=ncloc)](https://sonarcloud.io/project/overview?id=tekcapsule_tekcapsule-mobile)
[![Github all releases](https://img.shields.io/github/downloads/tekcapsule/tekcapsule-mobile/total.svg)](https://GitHub.com/tekcapsule/tekcapsule-mobile/releases/)


<!-- PROJECT LOGO -->

<div align="center">
  <img src="https://github.com/tekcapzule/tekcapzule-web/assets/9839481/bc965502-9a3a-4eb0-bb56-f1e9c0f4a5b0.svg">
  <h3 align="center">TekCapsule Mobile App</h3>
  <p align="center">
      TekCapsule Cross Platform Mobile App
    <br />
    <a href="https://www.tekcapsule.com/">View Demo</a> |
    <a href="https://github.com/tekcapsule/tekcapsule-mobile/issues">Report Bug</a> |
    <a href="https://github.com/tekcapsule/tekcapsule-mobile/issues">Request Feature</a>
  </p>
</div>
<div align="center">
  
  <a href="https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=389065588&machine=standardLinux32gb&location=SouthEastAsia">![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)</a>

</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

A cross platform (Android & iOS) mobile app made using Flutter. TekCapsule user's can leverage this app for reading tech articles and other contents on the go.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
* ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)


<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- GETTING STARTED -->

## Getting Started

Please follow the below instructions to setup the project locally.

## Flutter

    Flutter, a cross-platform app development toolkit created by Google, has been winning the hearts of developers and businesses across the globe. Flutter SDK can be significantly used for developing the application for native platforms.
    Web support is a code-compatible implementation of Flutter that is rendered using standards-based web technologies: HTML, CSS and JavaScript. With web support, you can compile existing Flutter code written in Dart into a client experience that can be embedded in the browser and deployed to any web server. You can use all the features of Flutter, and you don’t need a browser plug-in. 
    Dart’s optimized JavaScript compiler to compile the Flutter core and framework along with your application into a single, minified source file that can be deployed to any web server.

## Flutter SDK

- RUN   git clone https://github.com/flutter/flutter.git -b stable --depth 1
        ENV PATH "$PATH:/home/developer/flutter/bin10"

## Environment Variables

    ENV ANDROID_HOME /home/developer/Android/sdk
    ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
    ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools11"
    ENV PATH "$PATH:/home/developer/flutter/bin12"

## Flutter Clean & Build

    RUN flutter clean
    RUN flutter pub get
    RUN flutter config --android-sdk /home/developer/Android/sdk
    RUN flutter build apk --release --no-shrink --build-name=1.0.${BUILDNUM} --build-number=${BUILDNUM}

## State Management

    Widgets + Streams => Reactive

    In a general sense, a stream is a continuous flow or a succession of anything. Stream is nothing but a continuous flow of data.
    
    Example: Conveyor belts - A belt has two ends, form one end an item is passed (input), then it is processed and after processing, it gets out from another end of the belt(output).
    
    Link: https://dart.dev/tutorials/language/streams
    
    Key terms:
        – Stream, the conveyor belt is called as a stream
        – StreamController, this is what controls the stream
        – StreamTransformer, this is what processes the input data
        – StreamBuilder, it’s a method that takes stream as an input and provides us with a builder which rebuilds
        every time there is a new value of a stream
        – sink, the property which takes an input
        – stream, the property which gives the output out of the Stream

## Code Analysis

    Enabling default Google rules: pedantic
    We have enabled a list of linter rules that Google uses in its own Dart code, depend on the pedantic package and include its analysis_options.yaml file. The pedantic API dependency is added on pedantic in your pubspec.yaml file.
    The following command used to view the report in console “flutter analyze” and the same report can be written to a logical location by “flutter analyze –write={path}”

## Test Coverage

    The unit tests and a tool measures which lines have been tested. The information is stored in a lcov*.info file.
    Later an IDE or other tool can use it to show you reports or highlight which lines have not been covered.

    Global Report:
    The test run is made by “pub run test_coverage” command and saved to a directory “coverage/
    lcov.info13”. Through the installation of “lcov” package I could generate coverage reports using gen html command.

## Dart Analyzer

    The dartanalyzer command performs the same static analysis that you get when you use an IDE or editor that has Dart support. You can customize the analysis using an analysis options file or special comments in Dart source code.

    Here’s an example of performing static analysis over all the Dart files under the lib, test, and web directories:

        dartanalyzer lib test web

    Dart is downloaded by the Flutter SDK in $FLUTTER_HOME/bin/cache/dart-sdk, however, command
    lines are not on the path by default (dartanalyzer must be on the path).
    It is recommended to install Dart SDK separately for more reliability in a CI/CD environment.

### Prerequisites

This project requires following softwares: 
* Flutter

### Installation

Please follow the step by step instructions to install the required softwares and setup the project.
1. Clone the repo
   ```sh
   git clone https://github.com/tekcapsule/tekcapsule-mobile.git
   ```
2. Run the command
   ```sh
   flutter doctor
   ```
   
<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/tekcapsule/tekcapsule-mobile/issues) for a list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## How to Contribute?

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/Neweature`)
3. Commit your Changes (`git commit -m 'Add some NewFeature'`)
4. Push to the Branch (`git push origin feature/NewFeature`)
5. Open a Pull Request

## Contributors
<img src= "https://contrib.rocks/image?repo=tekcapsule/tekcapsule-mobile">

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the GNU GENERAL PUBLIC LICENSE. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
# tekcapsule-mobile


