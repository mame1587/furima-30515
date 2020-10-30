# DB設計

### users テーブル

|  Column                |  Type    |   Options   |
|------------------------|----------|-------------|
|   email                |  string  | null: false |
|   excerpted_password   |  string  | null: false |
|   nickname             |  string  | null: false |
|   last_name            |  string  | null: false |
|  first_name            |  string  | null: false |
| last_name_kana         |  string  | null: false |
| first_name_kana        |  string  | null: false |
|   birth_date           |   date   | null: false |

### Association

* has_many :items
* has_many :orders


## items テーブル

|   Column         |   Type     |   Options         |
|------------------|------------|-------------------|
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
- belongs_to :user

## orders テーブル

|  Column |    Type     |   Options                    |
|---------|-------------|------------------------------|
|  item   | references  | foreign_key: true            |
|  user   | references  | foreign_key: true            |

### Association
* has_one :addresses
- belongs_to :user
- belongs_to :item


### addresses テーブル
|  Column         |    Type   | Options          |
|-----------------|-----------|------------------|
|  post_code      |  string   | null: false      |
|  building_name  |  string   | null: false      |
|  phone_number   |  string   | null: false      |
|  house_number   |  string   |                  |
|  prefectures_id |  integer  | null: false      |
|  city           |  string   | null: false      |
|  order          | references| foreign_ker: true|


### Association
-belongs_to :order