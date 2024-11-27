# Step 1: Base image
FROM nginx:stable-alpine

# Step 2: Copy Flutter Web build output to Nginx directory
COPY build/web /usr/share/nginx/html

# Step 3: Expose port 80
EXPOSE 80

# Step 4: Start Nginx
CMD ["nginx", "-g", "daemon off;"]