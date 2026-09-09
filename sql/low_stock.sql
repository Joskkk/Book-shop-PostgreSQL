SELECT b.title, s.store_name, i.quantity
FROM books b
JOIN inventory i ON b.book_id = i.book_id
JOIN stores s ON i.store_id = s.store_id
WHERE i.quantity < (SELECT MAX(quantity) * 0.5 FROM inventory);
