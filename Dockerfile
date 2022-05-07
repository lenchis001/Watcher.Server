#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS publish

WORKDIR /
RUN apt-get update && apt-get install git unzip -y
RUN git clone https://github.com/flutter/flutter --depth 1
WORKDIR /src
COPY . .
WORKDIR "/src/Watcher"
RUN dotnet publish "Watcher.csproj" -c Release -o /app/publish
WORKDIR "/src/Watcher/client_app"
RUN /flutter/bin/flutter build web
RUN rm -rf /app/publish/client_app/*
RUN mv /src/Watcher/client_app/build/web/* /app/publish/client_app

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Watcher.dll"]