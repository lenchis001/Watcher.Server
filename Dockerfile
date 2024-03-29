#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS publish

WORKDIR /
RUN apt-get update && apt-get install git unzip -y
RUN curl -OL https://github.com/fluttertools/fvm/releases/download/2.3.1/fvm-2.3.1-linux-x64.tar.gz && tar -xf fvm-2.3.1-linux-x64.tar.gz && rm fvm-2.3.1-linux-x64.tar.gz && cd fvm && mv * /bin
RUN fvm install 3.0.0
WORKDIR /src
COPY . .
WORKDIR "/src/Watcher"
RUN dotnet publish "Watcher.csproj" -c Release -o /app/publish

WORKDIR /src
RUN scripts/get_all.sh
WORKDIR /src/client_app
RUN fvm flutter build web
RUN mkdir /app/publish/client_app/
RUN mv /src/client_app/build/web/* /app/publish/client_app

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Watcher.dll"]