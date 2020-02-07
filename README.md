## setting

`docker-compose up -d`

### gitlab setting

http://localhost:10080 にアクセスしてプロジェクト作成
トークンをコピー


### runner setting

１ライン（例）
```
docker-compose exec runner gitlab-runner register -n \
   --url "http://172.17.0.1:10080/" \
   --clone-url "http://172.17.0.1:10080/" \
   --registration-token "JkxKzm4sWNzE4KKG_Wgx" \
   --name bopytest-ch1-runner \
   --executor "docker" \
   --docker-image "bopytest_ch1" \
   --tag-list docker \
   --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
   --docker-pull-policy "if-not-present"
   --docker-network-mode "gitlab_gitlab_net"
```

入ってコマンド投入する方法

コンテナ内で
`gitlab-runner register`

config.tomlに追加
`network_mode = "gitlab_gitlab_net"`

