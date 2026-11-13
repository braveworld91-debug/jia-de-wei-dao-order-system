-- 家的味道訂餐系統：外送地址欄位
-- 安全新增可空白欄位，不會刪除或覆蓋既有資料。
alter table public.orders
add column if not exists delivery_address text;
