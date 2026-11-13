# 家的味道訂餐系統｜新版測試區

本資料夾是新版訂餐系統的獨立測試區，位於 `rebuild-v1` 分支，不會覆蓋目前正式網站。

## 第一階段功能
- 顧客端菜單與分類
- 購物車與數量調整
- 內用、外帶、外送選擇
- 將訂單寫入 Supabase（尚未完成實際送單驗證）

## Supabase 連線
`config.js` 使用 Supabase Project URL 與 publishable/anon key。
**不可放入 service_role key 或資料庫密碼。**

## 已知資料表
- `menu_categories`
- `menu_items`: id, name, category, description, price, image_url, is_available, sort_order, created_at, category_id, options
- `orders`: id, order_number (integer), customer_name, table_number, dining_method, items, total_amount, notes, status, created_at, phone, order_date, pickup_time, updated_at

## 待補資料庫欄位
目前已知的 `orders` 欄位清單沒有 `delivery_address`，但外送訂單必須保存地址。正式測試前，需在 Supabase SQL Editor 執行：

```sql
alter table public.orders
add column if not exists delivery_address text;
```

這個 SQL 只新增一個可空白的文字欄位，不會刪除或改動既有訂單資料。

## 尚未完成的驗證
- 核對 `orders.status` 是否允許「待確認」
- 核對 `order_number` 是否有唯一限制
- 實際確認菜單讀取與訂單寫入
- 確認 `menu_items.options` 的實際 JSON 結構，讓餐點選項完全依資料庫設定顯示

**目前是測試版，不要合併到 main，也不要當成正式上線版本。**
