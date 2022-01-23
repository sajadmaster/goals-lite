// changed file name test webhook
def appname = "Runner"
def xcarchive = "${appname}.xcarchive"
// test relay
pipeline {
    agent { label 'Built-In_Node' } //Change this to whatever your flutter jenkins nodes are labeled.
    environment {
        DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/" 
        PATH = "/opt/homebrew/Cellar/fastlane/2.201.0/libexec/gems/fastlane-2.201.0/bin/:/opt/homebrew/Caskroom/flutter/2.8.1/flutter/bin:/Users/jenkins/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Applications/Xcode.app/Contents/Developer"
   
//    /opt/homebrew/Cellar/fastlane/2.201.0/libexec/gems/fastlane-2.201.0/fastlane/lib/fastlane/ }
    stages {
        stage ('Checkout') {
            steps {
                step([$class: 'WsCleanup'])
                checkout scm
                sh "rm -rf build"
                sh "git clone --depth 1 https://github.com/sajaddmon/wholesaler-partner.git"
            }
        }
        stage ('Flutter Doctor') {
            steps {
                sh "flutter doctor -v"
            }
        }
        stage('Flutter Build iOS') {
            steps {
                sh "flutter pub get"
                sh "cd ios"
                sh "flutter build ios --release --no-codesign"
            }
        }
        stage('Fastlane iOS') {
            steps {
                sh "cd iOS"
                sh "fastlane env"
                sh "fastlane beta"
            }
        }
        stage('Cleanup') {
            steps {
                sh "flutter clean"
            }
        }
    }
}