#!/bin/bash
# Script thiết lập quyền và không gian làm việc cho Rikkei LMS (course-service)

# 1. Tạo user mới có tên là rikkeilms (nếu chưa tồn tại)
if ! id -u rikkeilms > /dev/null 2>&1; then
    sudo useradd -m -s /bin/bash rikkeilms
fi

# 2. Tạo thư mục gốc chứa mã nguồn và cấu hình tại /opt/rikkei/course-service
sudo mkdir -p /opt/rikkei/course-service

# 3. Chuyển quyền sở hữu (owner & group) của thư mục cho user rikkeilms
sudo chown -R rikkeilms:rikkeilms /opt/rikkei/course-service

# 4. Cấp quyền 755 (drwxr-xr-x) - chỉ chủ sở hữu có quyền ghi (write)
sudo chmod 755 /opt/rikkei/course-service

# 5. Kiểm tra kết quả phân quyền
ls -ld /opt/rikkei/course-service
