# Gunakan image Nginx sebagai base
FROM nginx:stable

# Salin build Flutter ke direktori default Nginx
COPY build/web /usr/share/nginx/html

# Expose port default Nginx
EXPOSE 80