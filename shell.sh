#!/bin/bash

echo "+++++++++++++ react setup +++++++++++++"

npx  create-react-app $1
npm install tailwindcss postcss-cli autoprefixer
npm install postcss
npm tailwind init 
touch postcss.config.js

echo "+++++++++++++ setup completed +++++++++"
