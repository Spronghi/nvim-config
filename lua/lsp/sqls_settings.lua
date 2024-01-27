local settings = {
  sqls = {
    connections = {
      {
        driver = 'mysql',
        dataSourceName = 'root:root@tcp(127.0.0.1:13306)/luckytopdeck',
      },
    },
  },
}

return settings
