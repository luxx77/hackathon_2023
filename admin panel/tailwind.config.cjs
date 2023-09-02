/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
    "./node_modules/tw-elements/dist/js/**/*.js",
  ],
  theme: {
    extend: {
      colors: {
        "dark-50": "#585858",
        "dark-100": "#505050",
        "dark-200": "#484848",
        "dark-300": "#404040",
        "dark-400": "#383838",
        "dark-500": "#303030",
        "dark-600": "#282828",
        "dark-700": "#202020",
        "dark-800": "#181818",
        "dark-900": "#101010",
      },
    },
    fontFamily: {
      urbanist: ['Urbanist', 'sans-serif'],
    },
  },
  plugins: [require("tw-elements/dist/plugin")],
}
