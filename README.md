# DB設計

### users テーブル

|  Column         |  Type    |   Options   |
|-----------------|----------|-------------|
|   email         |  string  | null: false |
|   password      |  string  | null: false |
|   nickname      |  string  | null: false |
|   lust_name     |  string  | null: false |
|  first_name     |  string  | null: false |
| lust_name_kana  |  string  | null: false |
| first_name_kana |  string  | null: false |
|   birth_date    |   date   | null: false |



### Association

* has_many :items
* has_many :address


## items テーブル

|   Column      |   Type     |   Options         |
|---------------|------------|-------------------|
|    user       | references | foreign_key: true |
|    name       | string     |    null: false    |
| images_id     |  integer   |    null: false    |
|  category_id  |  integer   |    null: false    |
|   price       | references | foreign_key: true |

### Association

## orders テーブル

|  Column |    Type     |   Options                    |
|---------|-------------|------------------------------|
|  item   | references  | foreign_key: true            |
|  user   | references  | foreign_key: true            |

### Association

- belongs_to :items
- belongs_to :users

### address テーブル
|  Column         | Type   | Options     |
|-----------------|--------|-------------|
|  post_code      | string | null: false |
|  building_name  | string | null: false |
|  city           | text   | null: false |


### Association

 - belongs_to :orders