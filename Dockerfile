# Menggunakan image Node versi 18 Alpine sebagai base image
FROM node:18-alpine

# Menetapkan direktori kerja ke /app
WORKDIR /app

# Menyalin package.json dan package-lock.json (jika ada) ke dalam image
COPY package*.json ./

# Menambahkan bash ke dalam image (diperlukan untuk wait-for-it.sh)
RUN apk add --no-cache bash

# Mengunduh wait-for-it.sh dari repositori GitHub
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Memberikan izin eksekusi kepada wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Menginstall dependensi npm
RUN npm install

# Menyalin seluruh konten proyek ke dalam image
COPY . .

# Mengekspos port 3000
EXPOSE 3000

# Menjalankan perintah untuk memulai aplikasi ketika container dijalankan
CMD [ "npm", "run", "start" ]