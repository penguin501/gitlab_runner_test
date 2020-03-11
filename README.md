## setting

`docker-compose up -d`


### windows setting

gitlabのマウントポイントはLinux通りにマウントすると  
アクセス出来ないエラーで死ぬ
```yaml
        volumes:
            - ./srv/gitlab/config:/etc/gitlab:z
            - ./srv/gitlab/logs:/var/log/gitlab:z
            - ./srv/gitlab/data:/var/opt/gitlab:z
```

volumeを作成するまたはマウントポイントをズラす事で回避できる
```dos
docker volume create gitlab_log
docker volume create gitlab_opt
docker volume create gitlab-runner_config
```
```yaml
        volumes:
            - ./srv/gitlab/config:/etc/gitlab:z
            - gitlab_log:/var/log/gitlab:z
            - gitlab_opt:/var/opt/gitlab:z
~~略~~
volumes:
    gitlab_log:
    gitlab_opt:
```

https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2280

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

