#!/bin/bash

# Usage script: bash nextjs-quick-starter.sh < project-name / . >
# If you want to give a project name and create new folder: bash nextjs-quick-starter.sh project-name
# If you want to use it in the folder you are in: bash nextjs-quick-starter.sh .

# Sleeping function, usage: sleeping <second> ex: sleeping 30
sleeping () {
    sleep $1
}

echo "Creating Next.js project name: $1"
npx create-next-app@latest $1
sleeping 20 # sleep 20 seconds

# change directory to just new created one
PWD=$PWD/$1
cd $PWD

echo "Downloading packages..."
npm install -D tailwindcss autoprefixer postcss react-icons
sleeping 10

echo "Tailwindcss initialization!"
npx tailwindcss init
sleeping 5

echo "Writing postcss.config.js file!"
# postcss.config.js
printf 'module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  }
}' > postcss.config.js
sleeping 3

echo "Writing tailwind.config.js file!"
# tailwind.config.js
printf '/** @type {import("tailwindcss").Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}' > tailwind.config.js
sleeping 3

echo "Writing styles/global.css file!"
# styles/globals.css
sed -i '' '1s/^/@tailwind base;@tailwind components;@tailwind utilities;\n/' styles/globals.css

echo "Process finished!"