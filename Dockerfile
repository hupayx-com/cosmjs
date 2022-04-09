FROM node:16.13.2-stretch

ENV PORT 3000

# Install git for ui and internal packages
# RUN apk add --no-cache git

# Set app directory
WORKDIR /app

# # Add PM2
# RUN npm install pm2 -g

# # Add yarn
# RUN npm install yarn -g

# Installing dependencies
COPY package*.json ./
# RUN npm ci

# Copying source files
COPY . .

# # Get env from secrets
# ARG NEXT_PUBLIC_GRAPHQL_URL
# ARG NEXT_PUBLIC_GRAPHQL_WS
# ARG NEXT_PUBLIC_URL
# ARG NEXT_PUBLIC_WS_CHAIN_URL
# ARG NEXT_PUBLIC_CHAIN_STATUS
# ARG NODE_ENV
# ARG PORT

# # Generate env file
# ENV NEXT_PUBLIC_GRAPHQL_URL ${NEXT_PUBLIC_GRAPHQL_URL}
# ENV NEXT_PUBLIC_GRAPHQL_WS ${NEXT_PUBLIC_GRAPHQL_WS}
# ENV NEXT_PUBLIC_URL ${NEXT_PUBLIC_URL}
# ENV NEXT_PUBLIC_WS_CHAIN_URL ${NEXT_PUBLIC_WS_CHAIN_URL}
# ENV NEXT_PUBLIC_CHAIN_STATUS ${NEXT_PUBLIC_CHAIN_STATUS}
# ENV NODE_ENV ${NODE_ENV}
# ENV PORT ${PORT}

# Building app
RUN yarn build
# EXPOSE 3000

# Running the app
CMD ["pm2-runtime", "dist/index.js"]