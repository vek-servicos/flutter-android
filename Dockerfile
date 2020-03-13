FROM cirrusci/flutter:v1.12.13-hotfix.7

ENV ANDROID_COMPILE_SDK=29
ENV ANDROID_BUILD_TOOLS=29.0.2
ENV ANDROID_SDK_TOOLS=4333796
ENV FLUTTER_CHANNEL=beta

RUN sudo apt-get --quiet update --yes && \ 
    sudo apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1 && \ 
    sudo wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip && \ 
    sudo unzip -d android-sdk-linux android-sdk.zip && \ 
    sudo echo y | sudo android-sdk-linux/tools/bin/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null && \ 
    sudo echo y | sudo android-sdk-linux/tools/bin/sdkmanager "platform-tools" >/dev/null && \ 
    sudo echo y | sudo android-sdk-linux/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null && \ 
    export ANDROID_HOME=$PWD/android-sdk-linux && \ 
    export PATH=$PATH:$PWD/android-sdk-linux/platform-tools/ && \ 
    yes | sudo android-sdk-linux/tools/bin/sdkmanager --licenses && \
    flutter channel $FLUTTER_CHANNEL && \
    flutter config --enable-web
