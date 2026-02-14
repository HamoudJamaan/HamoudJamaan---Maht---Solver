plugins {
    id 'com.android.application'
    id 'org.jetbrains.kotlin.android'
    id 'kotlin-kapt'
}

android {
    namespace 'com.hamoudjamaan.mathsolver'
    compileSdk 34

    defaultConfig {
        applicationId "com.hamoudjamaan.mathsolver"
        minSdk 27
        targetSdk 34
        versionCode 1
        versionName "1.0"

        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = '1.8'
    }
}

dependencies {
    // Core Android
    implementation 'androidx.core:core-ktx:1.12.0'
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'com.google.android.material:material:1.10.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.4'
    implementation 'androidx.recyclerview:recyclerview:1.3.2'
    implementation 'androidx.cardview:cardview:1.0.0'
    
    // Camera
    implementation 'androidx.camera:camera-core:1.3.0'
    implementation 'androidx.camera:camera-camera2:1.3.0'
    implementation 'androidx.camera:camera-lifecycle:1.3.0'
    implementation 'androidx.camera:camera-view:1.3.0'
    
    // ML Kit OCR
    implementation 'com.google.mlkit:text-recognition:16.0.0'
    implementation 'com.google.mlkit:vision-common:17.0.0'
    
    // Charts
    implementation 'com.github.PhilJay:MPAndroidChart:v3.1.0'
    
    // PDF Viewer
    implementation 'com.github.barteksc:android-pdf-viewer:2.8.2'
    
    // Permissions
    implementation 'pub.devrel:easypermissions:3.0.0'
    
    // Image loading
    implementation 'com.github.bumptech.glide:glide:4.15.1'
    
    // JSON
    implementation 'org.json:json:20230227'
    
    // Testing
    testImplementation 'junit:junit:4.13.2'
    androidTestImplementation 'androidx.test.ext:junit:1.1.5'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.5.1'
}

