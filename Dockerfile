# Base image: nginx versi alpine dipilih karena ukurannya kecil (~40MB)
FROM nginx:alpine

# Hapus halaman default bawaan nginx supaya tidak tercampur
RUN rm -rf /usr/share/nginx/html/*

# Salin file website ke folder yang akan disajikan nginx
COPY index.html style.css script.js /usr/share/nginx/html/

# Salin konfigurasi nginx custom (gzip, cache, error page)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Beri tahu Docker bahwa container ini "mendengarkan" di port 80
EXPOSE 80

# Jalankan nginx di foreground (wajib, supaya container tidak langsung mati)
CMD ["nginx", "-g", "daemon off;"]