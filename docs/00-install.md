echo "===== SYSTEM ====="
sw_vers
uname -m

echo "===== RUBY ====="
ruby -v
which ruby

echo "===== RAILS ====="
rails -v
which rails

echo "===== BUNDLER ====="
bundle -v

echo "===== GIT ====="
git --version

echo "===== POSTGRESQL ====="
psql --version

echo "===== NODE ====="
node -v

echo "===== YARN ====="
yarn -v

echo "===== XCODE ====="
xcodebuild -version

echo "===== ANDROID ====="
echo $ANDROID_HOME
echo $ANDROID_SDK_ROOT

echo "===== JAVA ====="
java -version

xcode-select -p
xcodebuild -runFirstLaunch
xcrun simctl list devices available

## ANDROID
ls -d ~/Library/Android/sdk
ls /Applications | grep -i "Android Studio"





♦️check echo $SHELL
/bin/zsh
👉 Dann
cat <<'EOF' >> ~/.zshrc

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"

EOF

export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"