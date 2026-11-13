# 家的味道訂餐系統｜新版測試區

本資料夾是新版訂餐系統的獨立測試區，位於 `rebuild-v1` 分支，不會覆蓋目前正式網站。

## 第一階段
- 顧客端菜單與分類
- 購物車與數量調整
- 內用、外帶、外送選擇
- 建立訂單至 Supabase

## Supabase 連線
請在 `config.js` 設定：
- Supabase Project URL
- Supabase anon/public key

**不可放入 service_role key 或資料庫密碼。**

## 現有資料表欄位（依目前已知資料）
- `menu_categories`
- `menu_items`: id, name, category, description, price, image_url, is_available, sort_order, created_at, category_id, options
- `orders`: order_number, customer_name, table_number, dining_method, items, total_amount, notes, phone, delivery_address, pickup_time, status

正式連線前，仍需核對實際欄位型態、RLS 政策與訂單 JSON 格式。
