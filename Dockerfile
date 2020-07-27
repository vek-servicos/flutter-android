# docker build --tag $(basename ${PWD}):local --tag vekservicos/$(basename ${PWD}):latest --file Dockerfile .
# docker run --rm -it --cpus 4 --memory 2g -v ${PWD}:/$(basename ${PWD}) -v ~/.aws:/root/.aws -v ~/.m2:/root/.m2 -v ~/.ssh:/root/.ssh -v ~/.gitconfig:/root/.gitconfig -v /var/run/docker.sock:/var/run/docker.sock -v ~/.kube:/root/.kube $(basename ${PWD}):local [ commands ]
# docker run --rm -it --cpus 4 --memory 2g -v ${PWD}:/$(basename ${PWD}) -v ${PWD}/../vek-ftr-framework-lib:/vek-ftr-framework-lib -v ${PWD}/../cvd-android-sec:/cvd-android-sec --workdir /$(basename ${PWD}) $(basename ${PWD}):local [ commands ]

# FROM cirrusci/flutter:v1.12.13-hotfix.7
FROM cirrusci/flutter:1.17.5

# ENV ANDROID_BUILD_TOOLS_VERSION="29.0.3"
# ENV ANDROID_HOME="/opt/android-sdk-linux"
# ENV ANDROID_PLATFORM_VERSION="29"
# ENV ANDROID_SDK_ROOT="/opt/android-sdk-linux"
# ENV ANDROID_SDK_TOOLS_VERSION="4333796"
# ENV ANDROID_SDK_TOOLS_VERSION="6514223"
# ENV ANDROID_SDK_TOOLS_VERSION="6609375"
ENV FLUTTER_CHANNEL=stable
ENV GRADLE_OPTS="-Dorg.gradle.daemon=false -Dorg.gradle.debug=false -Dorg.gradle.daemon.idletimeout=6000"

RUN echo "Set disable_coredump false" | sudo tee /etc/sudo.conf
RUN sudo apt-get update -yqq
RUN sudo apt-get install -fyqq curl git xz-utils tar unzip wget zip

# RUN wget --quiet https://dl.google.com/android/repository/commandlinetools-${ANDROID_SDK_TOOLS_VERSION}_latest.zip --output-document=android-cmd-tools.zip && unzip -q android-cmd-tools.zip -d ${ANDROID_HOME}/cmdline-tools/
# RUN rm -rf android-cmd-tools.zip

RUN yes | sdkmanager --licenses
RUN echo y | sdkmanager "tools"
RUN echo y | sdkmanager "platform-tools"
RUN echo y | sdkmanager "emulator"
RUN echo y | sdkmanager "platforms;android-${ANDROID_PLATFORM_VERSION}"
RUN echo y | sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

RUN flutter --version
RUN flutter channel $FLUTTER_CHANNEL
RUN flutter upgrade
RUN if false; then flutter config --enable-web; else flutter config --no-enable-web; fi
RUN flutter --version
