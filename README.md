# expense_splitting_app


## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/Mo-Kash/expense-splitting-app.git
   cd expense-splitting-app
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## Potential Errors while running app:
   ```
   execution failed for task ':path_provider_android:compiledebugjavawithjavac'.
   ```
### Fix:
1. /android/setting.gradle -> change `id "com.android.application" version "8.1.0" apply false` to `id "com.android.application" version "8.3.2" apply false`
2. /android/gradle/gradle-wrapper.properties -> change `distributionUrl=https\://services.gradle.org/distributions/gradle-8.3-all.zip` to `distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-all.zip`
3. Run App

# App Screenshots:

## Home Page:

![homepage](https://github.com/user-attachments/assets/a8250b57-6956-43a9-962d-c9b7e1f15baf)
![homepage1](https://github.com/user-attachments/assets/046b4f01-48cb-4575-a00e-e0c51d032cac)


## Add Groups:

![groupform](https://github.com/user-attachments/assets/44a41c40-5b10-4a30-9755-c978c7c547c8)


## View Your Groups:

![groupspage](https://github.com/user-attachments/assets/a9ab578a-f355-448a-a545-a6fab6f8713a)
![extendedgroup](https://github.com/user-attachments/assets/d5ede835-4b04-41d2-8632-758b06636771)


## Delete Groups:

![deletegroup](https://github.com/user-attachments/assets/d82611d8-edad-4117-b7b3-9d914f6106bd)


## View Expenses [Static Page]:

![expenses](https://github.com/user-attachments/assets/d73dd395-2869-443b-a35a-6a9141e9d38c)


## View Activity [Static Page]:

![activity](https://github.com/user-attachments/assets/14c45bb8-2e1d-45db-98b5-3b5453ea13cb)
