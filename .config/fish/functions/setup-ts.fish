npm init --yes
npm i --save-dev typescript nodemon
npx tsc --init

echo '{
  "version": "0.0.1",
  "main": "dist/entry.js",
  "scripts": {
    "build": "tsc",
    "prestart": "npm run build",
    "start": "node dist/entry.js",
    "watch": "nodemon --watch \"src/**\" --ext \"ts,json\" --exec \"npm start\""
  }
}' > temp_package.json

echo "$(jq -s '.[0] * .[1]' package.json  temp_package.json)" > package.json
rm temp_package.json

mkdir src

echo "function test(a: number, b: number): void {
  console.log(a + b);
}

test(60, 9);" > src/entry.ts


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
