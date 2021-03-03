# テーブル設計

## usersテーブル

｜ Column               | Type   | Options                        |
｜ ---------------------|--------|--------------------------------|
｜ nickname             | string | null: false                    |
｜ email                | string | null: false, uniqueness: true  |
｜ encrypted_password   | string | null: false                    |
｜ family_name          | string | null: false                    |
｜ given_name           | string | null: false                    |
｜ family_name_kana     | string | null: false                    |
｜ given_name_kana      | string | null: false                    |
｜ birth                | date   | null: false                    |

### Association

- has many : items
- has many : purchases

## itemsテーブル

｜ Column        | Type       | Options                        |
｜ --------------|------------|--------------------------------|
｜ user          | references | null: false, foreign_key: true |
｜ title         | string     | null: false                    |
｜ concept       | text       | null: false                    |
｜ category_id   | integer    | null: false                    |
｜ status_id     | integer    | null: false                    |
｜ fee_id        | integer    | null: false                    |
｜ prefecture_id | integer    | null: false                    |
｜ date_id       | integer    | null: false                    |
｜ price         | integer    | null: false                    |

### Association

- belongs_to : user
- has_one : purchase

## purchasesテーブル

｜ Column      | Type       | Options                        |
｜ ------------|------------|--------------------------------|
｜ user        | references | null: false, foreign_key: true |
｜ item        | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address

## addressesテーブル

｜ Column        | Type      | Options                        |
｜ --------------|-----------|--------------------------------|
｜ purchase      | reference | null: false, foreign_key: true |
｜ postcode      | string    | null: false                    |
｜ prefecture_id | integer   | null: false                    |
｜ city          | string    | null: false                    |
｜ block         | string    | null: false                    |
｜ building      | string    |                                |
｜ phone_number  | string    | null: false                    |

### Association

- belongs_to : purchase

