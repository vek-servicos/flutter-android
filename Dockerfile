# export vek_app=$(basename $PWD)
# export vek_docker_image=${vek_app}:dev
# docker build --tag $(basename $PWD):dev --file Dockerfile .
# docker run --rm -it -v ${PWD}:/vek -v ~/.aws:/root/.aws -v ~/.m2:/root/.m2 -v ~/.ssh:/root/.ssh -v ~/.gitconfig:/root/.gitconfig -v /var/run/docker.sock:/var/run/docker.sock -v ~/.kube:/root/.kube $(basename $PWD):dev [ commands ]
# docker run --rm -it -v ${PWD}:/vek $(basename $PWD):dev [ commands ]

# FROM cirrusci/flutter:v1.12.13-hotfix.7
FROM cirrusci/flutter:1.17.5

# ENV ANDROID_BUILD_TOOLS_VERSION="29.0.2"
# ENV ANDROID_HOME="/opt/android-sdk-linux"
# ENV ANDROID_PLATFORM_VERSION="29"
# ENV ANDROID_SDK_ROOT="/opt/android-sdk-linux"
# ENV ANDROID_SDK_TOOLS_VERSION="4333796"
# ENV ANDROID_SDK_TOOLS_VERSION="6514223"
# ENV ANDROID_SDK_TOOLS_VERSION="6609375"
# ENV FLUTTER_CHANNEL=beta

# RUN sudo apt-get update -yqq
# RUN sudo apt-get install -fyqq wget tar unzip lib32stdc++6 lib32z1

# RUN wget --quiet https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip         --output-document=android-sdk-tools.zip && unzip -q android-sdk-tools.zip -d ${ANDROID_HOME}/
# RUN wget --quiet https://dl.google.com/android/repository/commandlinetools-${ANDROID_SDK_TOOLS_VERSION}_latest.zip --output-document=android-cmd-tools.zip && unzip -q android-cmd-tools.zip -d ${ANDROID_HOME}/cmdline-tools/

# RUN yes | sdkmanager --licenses
# RUN echo y | sdkmanager "tools"
# RUN echo y | sdkmanager "platform-tools"
# RUN echo y | sdkmanager "emulator"
# RUN echo y | sdkmanager "platforms;android-${ANDROID_PLATFORM_VERSION}"
# RUN echo y | sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"

# RUN flutter channel $FLUTTER_CHANNEL
# RUN flutter config --no-enable-web
# RUN flutter config --enable-web

# RUN rm -rf android-sdk-tools.zip
# RUN rm -rf android-cmd-tools.zip

# https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
# https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip
# https://dl.google.com/android/repository/platform-tools-latest-linux.zip
# https://dl.google.com/android/repository/platform-tools_r30.0.3-linux.zip
# https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.0.1.0/android-studio-ide-193.6626763-linux.tar.gz
