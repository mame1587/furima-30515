# DB設計

### users テーブル

|  Column                |  Type    |   Options   |
|------------------------|----------|-------------|
|   email                |  string  | null: false |
|   excerpted_password   |  string  | null: false |
|   nickname             |  string  | null: false |
|   lust_name            |  string  | null: false |
|  first_name            |  string  | null: false |
| lust_name_kana         |  string  | null: false |
| first_name_kana        |  string  | null: false |
|   birth_date           |   date   | null: false |

### Association
* has_many :items
* has_many :orders


## items テーブル

|   Column         |   Type     |   Options         |
|---------------|------------|-------------------|
|    user          | references | foreign_key: true |
|    name          | string     |    null: false    |
|  description     |    text    |    null: false    |
|  category_id     |  integer   |    null: false    |
| condition_id     |  integer   |    null: false    |
| postage_payer_id |  integer   |    null: false    |
| prefecture_id    |  integer   |    null: false    |
|  handling_id     |  integer   |    null: false    |
|   price          |  integer   |    null: false    |


### Association

## orders テーブル

|  Column |    Type     |   Options                    |
|---------|-------------|------------------------------|
|  item   | references  | foreign_key: true            |
|  user   | references  | foreign_key: true            |

### Association

* has_many :addresses
* has_many :users
* has_many :items


### addresses テーブル
|  Column         |    Type   | Options          |
|-----------------|-----------|------------------|
|  post_code      |  string   | null: false      |
|  building_name  |  string   | null: false      |
|  phone_number   |  string   | null: false      |
|  prefectures_id |  integer  | null: false      |
|  city           |   text    | null: false      |
|  purchase       | references| foreign_ker: true|


### Association
- belongs_to :orders