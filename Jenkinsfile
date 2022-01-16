// changed file name
def appname = "Runner" //DON'T CHANGE THIS. This refers to the flutter 'Runner' target.
def xcarchive = "${appname}.xcarchive"

pipeline {
    agent { label 'Built-In_Node' } //Change this to whatever your flutter jenkins nodes are labeled.
    environment {
        DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/"  //This is necessary for Fastlane to access iOS Build things.
        PATH = "/Users/jenkins/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/opt/homebrew/Caskroom/flutter/2.5.3/flutter/bin:/usr/local/Caskroom/android-sdk/4333796//tools:/usr/local/Caskroom/android-sdk/4333796//platform-tools:/Applications/Xcode.app/Contents/Developer"
    }
    stages {
        stage ('Checkout') {
            steps {
                step([$class: 'WsCleanup'])
                checkout scm
                sh "rm -rf build_ios"
                sh "rm -rf build_ios"
                sh "GIT_SSH_COMMAND='ssh -i ~/.ssh/github-sm' git clone --depth 1 git@github.com-sm:sajadmaster/goals-lite.git"
                // sh "mv goalslite_build_ios ios/fastlane" //This moves the just checked out goalslite_build_ios to the fastlane directory for easier importing
            }
        }
        stage ('Flutter Doctor') {
            steps {
                sh "flutter doctor -v"
            }
        }
        // stage('Flutter Build iOS') {
        //     steps {
        //         sh "flutter build ios --release --no-codesign"
        //     }
        // }
        // stage('Make iOS IPA And Distribute') {
        //         steps {
        //             dir('ios'){
        //                     sh "bundle install"
        //                     sh "bundle exec fastlane buildAdHoc --verbose" 
        //             }
        //         }
        // }
        // stage('Cleanup') {
        //     steps {
        //         sh "flutter clean"
        //     }
        // }
    }
}