// changed file name
def appname = "Runner" //DON'T CHANGE THIS. This refers to the flutter 'Runner' target.
def xcarchive = "${appname}.xcarchive"

pipeline {
    agent { label 'Built-In_Node' } //Change this to whatever your flutter jenkins nodes are labeled.
    environment {
        DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/" 
        PATH = "/opt/homebrew/Caskroom/flutter/2.8.1/flutter/bin:/Users/jenkins/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Applications/Xcode.app/Contents/Developer"
    }
    stages {
        stage ('Checkout') {
            steps {
                step([$class: 'WsCleanup'])
                checkout scm
                sh "rm -rf build"
                sh "git clone --depth 1 https://github.com/sajaddmon/wholesaler-partner.git"
                sh "mv goalslite_build_ios ios/fastlane"
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
                sh "cd iOS && fastlane beta"
            }
        }
        stage('Cleanup') {
            steps {
                sh "flutter clean"
            }
        }
    }
}