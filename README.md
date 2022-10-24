# nextjs-quick-starter
This repo allows to initialize a simple Next.js project and download the helper package.

### Packages to be downloaded.
1. tailwindcss 
2. autoprefixer 
3. postcss 
4. react-icons

### Changing some content in the file.
* tailwind.config.js
```bash
printf '/** @type {import("tailwindcss").Config} */
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}' > tailwind.config.js
```

* postcss.config.js
```bash
printf 'module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  }
}' > postcss.config.js
```

* styles/globals.css
```bash
sed -i '' '1s/^/@tailwind base;@tailwind components;@tailwind utilities;\n/' styles/globals.css
```