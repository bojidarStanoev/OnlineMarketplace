# OnlineMarketplace
## Описание на проекта:
 Проектът ще представлява онлайн супермаркет. Ще имаме потребители и администратор. За да си направи покупка, потребителят трябва да си влезе в акаунт или ако няма, да си създаде такъв. Продуктите ще бъдат разделени на множество категории и подкатегории. Потребителят ще може да преглежда предишни покупки, които е направил вече. Ще може да се преглеждат предишни адреси на доставки. Сайтът ще поддържа промоции на продуктите. Технологии: Ruby on Rails и javascript.
## Списък с таблици:
 * Таблица с потребители:
   * ID
   * Name
   * Nickname
   * Password
   * Mail
   * Address
 * Таблица с продукти:
   * ID
   * Name
   * Description
   * Image
   * CategoryID
   * SubCategoryID
   * Price
   * BrandID
 * Таблица с категории:
   * ID
   * Name
 * Таблица с подкатегории:
   * ID
   * Name
   * CategoryID
 * Таблица с промоции:
   * ID
   * Name
   * ProductID
   * NewPrice
 * Таблица с поръчки:
   * ID
   * UserID
   * ListOfProducts
   * DeliverAddress
 * Таблица с производители:
   * ID
   * Name
