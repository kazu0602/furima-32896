# テーブル設計

## usersテーブル

｜ Column        | Type   | Options     |
｜ --------------|--------|-------------|
｜ nickname      | string | null: false |
｜ mail_address  | string | null: false |
｜ password      | string | null: false |
｜ name          | string | null: false |
｜ katakana      | string | null: false |
｜ birth         | date   | null: false |

### Association

-has many : items
-has many : purchases

## itemsテーブル

｜ Column   | Type       | Options     |
｜ ---------|------------|-------------|
｜ user     | references | null: false |
｜ title    | string     | null: false |
｜ concept  | string     | null: false |
｜ category | string     | null: false |
｜ status   | string     | null: false |
｜ fee      | integer    | null: false |
｜ region   | string     | null: false |
｜ date     | date       | null: false |
｜ price    | integer    | null: false |

### Association

-belongs_to : users
-has_one : purchases

## purchasesテーブル

｜ Column      | Type       | Options     |
｜ ------------|------------|-------------|
｜ user        | references | null: false |
｜ item        | references | null: false |

### Association

-belongs_to : users
-belongs_to : items
has_one : address

## addressesテーブル

｜ Column      | Type      | Options     |
｜ ------------|-----------|-------------|
｜ purchase    | reference | null: false |
｜ postal      | integer   | null: false |
｜ preference  | string    | null: false |
｜ ban_chi      | integer   | null: false |
｜ residence   | string    | null: false |
｜ tel         | integer   | null: false |

### Association

-belongs_to : purchases