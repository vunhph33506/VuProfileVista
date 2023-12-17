CREATE DATABASE VuProfileVista
USE VuProfileVista;

-- Tạo bảng users
CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100)
);
INSERT INTO users (username, password, email, full_name)
VALUES
('admin', '123', 'vunhph33506@fpt.edu.vn', 'Nong Hoang Vu'),
('nguyethanhtung', '123', 'tungbinh@gmail.com.com', 'Nguyen Thanh Tung'),
('lananh01', '123', 'lananh2004@gmail.com', 'Hoang Thi Lan Anh'),
('viethoang2000', '123', 'viethoang02@gmail.com', 'Nguyen Viet Hoang'),
('lynp', '123', 'lynp@gmail.com', 'Nguyen Phuong Ly');