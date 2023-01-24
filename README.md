# tekcapsule-mobile

[Flutter]

    Flutter, a cross-platform app development toolkit created by Google, has been winning the hearts of developers and businesses across the globe. Flutter SDK can be significantly used for developing the application for native platforms.
    Web support is a code-compatible implementation of Flutter that is rendered using standards-based web technologies: HTML, CSS and JavaScript. With web support, you can compile existing Flutter code written in Dart into a client experience that can be embedded in the browser and deployed to any web server. You can use all the features of Flutter, and you don’t need a browser plug-in. 
    Dart’s optimized JavaScript compiler to compile the Flutter core and framework along with your application into a single, minified source file that can be deployed to any web server.

[Flutter SDK]

- RUN   git clone https://github.com/flutter/flutter.git -b stable --depth 1
        ENV PATH "$PATH:/home/developer/flutter/bin10"

[Environment Variables]

    ENV ANDROID_HOME /home/developer/Android/sdk
    ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
    ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools11"
    ENV PATH "$PATH:/home/developer/flutter/bin12"

[Flutter Clean & Build]

    RUN flutter clean
    RUN flutter pub get
    RUN flutter config --android-sdk /home/developer/Android/sdk
    RUN flutter build apk --release --no-shrink --build-name=1.0.${BUILDNUM} --build-number=${BUILDNUM}

[State Management]

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

[Code Analysis]

    Enabling default Google rules: pedantic
    We have enabled a list of linter rules that Google uses in its own Dart code, depend on the pedantic package and include its analysis_options.yaml file. The pedantic API dependency is added on pedantic in your pubspec.yaml file.
    The following command used to view the report in console “flutter analyze” and the same report can be written to a logical location by “flutter analyze –write={path}”

[Test Coverage]

    The unit tests and a tool measures which lines have been tested. The information is stored in a lcov*.info file.
    Later an IDE or other tool can use it to show you reports or highlight which lines have not been covered.

    Global Report:
    The test run is made by “pub run test_coverage” command and saved to a directory “coverage/
    lcov.info13”. Through the installation of “lcov” package I could generate coverage reports using gen html command.

[Dart Analyzer]

    The dartanalyzer command performs the same static analysis that you get when you use an IDE or editor that has Dart support. You can customize the analysis using an analysis options file or special comments in Dart source code.

    Here’s an example of performing static analysis over all the Dart files under the lib, test, and web directories:

        dartanalyzer lib test web

    Dart is downloaded by the Flutter SDK in $FLUTTER_HOME/bin/cache/dart-sdk, however, command
    lines are not on the path by default (dartanalyzer must be on the path).
    It is recommended to install Dart SDK separately for more reliability in a CI/CD environment.