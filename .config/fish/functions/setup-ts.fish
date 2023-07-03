npm init --yes
npm i typescript --save-dev
npx tsc --init

echo '{
  "version": "0.0.1",
  "main": "dist/entry.js",
  "scripts": {
    "build": "tsc",
    "prestart": "npm run build",
    "start": "node dist/entry.js"
  }
}' > temp_package.json

echo "$(jq -s '.[0] * .[1]' package.json  temp_package.json)" > package.json
rm temp_package.json

mkdir src

echo "function test(a: number, b: number): void {
  console.log(a + b)
}" > src/entry.ts


echo '{
  "compilerOptions": {
    "strict": true,
    "rootDir": "./src",
    "baseUrl": "./src",
    "outDir": "./dist",
    "target": "ESNext",
    "module": "commonjs",
    "skipLibCheck": true,
    "noUnusedLocals": true,
    "esModuleInterop": true,
    "strictFunctionTypes": true,
    "forceConsistentCasingInFileNames": true
  }
}' > tsconfig.json

echo 'node_modules
dist' > .gitignore

git init
