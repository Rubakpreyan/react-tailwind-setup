# React + TailwindCSS Setup

## Use the biolerplate

Clone this repo and navigate to the directory.

- Change the project name in package.json according to Folder name
- Run npm install
- Run npm start

This will start the react app on port `localhost:3000` , and you can start working on the project, without the tedious work of setting up React and Tailwind completely on your own.

#### Below is the procedure for React + Tailwind setup.

This is a basic template for **React** and **TailwindCSS** setup. This Template can be cloned and directly used in your local system along with _few changes_

# Total Setup Process

Before starting with the procedure we need to check few prerequisites

Initally locate to the folder where you want to save your whole project.

### Node package manager

Before starting the procedure make sure you have _node.js_ and _npm_ installed in your local system. Run the below commands in Command line interface to check whether they are installed

```bash
# node
node -v
# npm
npm -v
```

If any of these commands don't show the version of node which you are using then you need to download the _Node.js_ in your system

### Procedure after the installation of Node and npm

[Setup link for Node.js and npm](https://phoenixnap.com/kb/install-node-js-npm-on-windows)

**Step 1**

Run this command to create a new react application in your folder

```bash
npx create-react-app <filename>
```

This will create the React-app with all the front end build required pipelines. This will help us to start a new project

**Step 2**

Once the React app is created we need to move to the folder directory to use the underlying commands

Command:

```bash
cd <filename>
```

**Step 3**

Install _TailwindCSS_ and it's dependencies

```bash
npm install tailwindcss postcss-cli autoprefixer
```

**Step 4**

Install _Postcss_

```bash
npm install postcss
```

**Step 5**

Download `tailwind.config.js` file

```bash
npx tailwind init
```

**Step 6**

Now in the same root directory, create a new file `postcss.config.js`

The below Command will work only for _Bash_ terminal interface

```bash
touch postcss.config.js
```

After creating the file paste the below code in the `postcss.config.js`

```js
module.exports = {
  plugins: [require("tailwindcss"), require("autoprefixer")],
};
```

**Step 7**

Now create a _CSS_ Folder inside the _src_ Folder and Inside the _CSS_ Folder Create a new CSS file named as _tailwind.css_

The file structure should like inside the _src_ folder

```bash
- src
    - css
        - tailwind.css
    - App.js
    - Index.js
    - App.test.js
    - index.css
    - logo.svg
    - reportWebVitals.js
    - setupTests.js
```

Inside the `tailwind.css` paste the below code

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

**Step 8**

Go to `package.json` and add this script -

```json
"scripts": {
  "build:css:dev": "postcss src/css/tailwind.css -o src/css/build/styles.css",
  "build:css:prod": "postcss src/css/tailwind.css -o src/css/main.css"
}
```

**step 9**

In your _CLI_ run the following command -

```bash
npm run build:css:dev
```

This will download all required classes and dependenices which are required for styling inside `src/css/build/styles.css`

**Final mode**

Once these procedure are done put the below line of code in _Index.js_ which is present inside the _src_ file

```bash
import "./css/build/styles.css";
```

## Automation

Inorder to run each and every command step by step there is also another way to do that. Run the below shell script program to install the build files and dependencies at a stretch

```sh
#!/bin/bash

echo "+++++++++++++ react setup +++++++++++++"

npx  create-react-app $1
npm install tailwindcss postcss-cli autoprefixer
npm install postcss
npm tailwind init
touch postcss.config.js

echo "+++++++++++++ setup completed +++++++++"
```

This above code will help to create till `postcss.config.js`

Write the below command to run the code in bash terminal

```bash
chmod 755 ShellFileName.sh

After compiling

./ShellFileName.sh  <React file name>
```

[File link for above code](https://github.com/Rubakpreyan/react-tailwind-setup/blob/main/shell.sh)

## Purge TailwindCSS Files

After completing the whole project , it's time for production mode. The above commands are done during the development mode but once it is completed it has to turned to production mode. In production, we must have a minimal version of CSS. There may be lots of classes that we didn't use. Instead we can _Purge it_

### The below commands are used for purging CSS Files

**step 1**

Install `cssnano` and `@fullhuman/postcss-purgecss` -

```bash
npm install cssnano
npm install @fullhuman/postcss-purgecss
```

**Step 2**

Edit your `postcss.config.js` file as -

```js
const purgecss = require("@fullhuman/postcss-purgecss");
const cssnano = require("cssnano");

module.exports = {
  plugins: [
    require("tailwindcss"),
    require("autoprefixer"),
    cssnano({
      preset: "default",
    }),
    purgecss({
      content: ["./src/**/*.jsx", ".src/**.js"],
      defaultExtractor: (content) => content.match(/[\w-/:]+(?<!:)/g) || [],
    }),
  ],
};
```

The below code is the important part where all the _jsx_ ,_js_ , _tsx_ , _ts_ will be included during the purge process

```bash
content: ["./src/**/*.jsx",".src/**.js"],
```

```
/*
Represents folders selection
./root folder/subFolder1

/** .js or .jsx or .tsx or .ts
Represents selecting all type of files
./root folder/type of files

Eg :
Now the File structure is like

- src
    - components
        - file 1.jsx
        - file 2.jsx
        - file 3.jsx
        - file 4.js
     - file 5.jsx
     - app.js
     - index.js
```

### The purging command for the above file structure

```js
content: [  "./src/*/**.jsx", /* Representing file 1,2,3 */
            ".src/*/**.jsx",  /* Representing file 4 */
            "./src/**.jsx",   /* Representing file 5*/
            "./src/**.js"],   /* Representing app.js , index.js */
```

**Step 3**

Now run the following command in your command line interface for building Final required css files

```bash
npm run build:css:pro
```

**Final Step**

Remove the initial CSS import from _index.js_ and the add the below import tag

```bash
import "./css/main.css";
```

## Clone this project

```bash
git clone https://github.com/Rubakpreyan/react-tailwind-setup
```

After cloning this project run

```bash
npm install
```

To get all the node modules and start editing the _src_ files

### .gitignore structure

```bash


# dependencies
node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
build

## css files

*.config.js
# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*
```

### File structure

| Before development                                                                                | After development and purged                                                                     |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| ![image](https://github.com/Rubakpreyan/react-tailwind-setup/blob/main/images/Before%20setup.jpg) | ![image](https://github.com/Rubakpreyan/react-tailwind-setup/blob/main/images/After%20setup.jpg) |
