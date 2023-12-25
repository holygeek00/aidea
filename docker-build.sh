VERSION=1.1.9
rm -fr build/web
flutter build web --web-renderer canvaskit --release --dart-define=API_SERVER_URL=http://34.80.104.111/
cd scripts && go run main.go ../build/web/main.dart.js && cd ..
rm -fr build/web/fonts/ && mkdir build/web/fonts
cp -r scripts/s build/web/fonts/s
# 构建 Docker 镜像，但不推送到 Docker Hub
docker buildx build --platform=linux/amd64 -t mylxsw/aidea-web:$VERSION . --load