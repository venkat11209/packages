#nginx file configuration for multi-domains:
MAIN_DOMAIN="leadswatch.com"
MAIN_IP="ip_address"
DOMAIN_a="domain"
IP_a="ip_address"
DOMAIN_b="domain"
IP_b="ip_address"
DOMAIN_c="domain"
IP_c="ip_address"
DOMAIN_d="domain"
IP_d="ip_address"
DOMAIN_e="domain"
IP_e="ip_address"
DOMAIN_f="domain"
IP_f="ip_address"
DOMAIN_g="domain"
IP_g="ip_address"
DOMAIN_h="domain"
IP_h="ip_address"
DOMAIN_i="domain"
IP_i="ip_address"
DOMAIN_j="domain"
IP_j="ip_address"
DOMAIN_k="domain"
IP_k="ip_address"
DOMAIN_l="domain"
IP_l="ip_address"
DOMAIN_m="domain"
IP_m="ip_address"
DOMAIN_n="domain"
IP_n="ip_address"
DOMAIN_o="domain"
IP_o="ip_address"
DOMAIN_p="domain"
IP_p="ip_address"
DOMAIN_q="domain"
IP_q="ip_address"
DOMAIN_r="domain"
IP_r="ip_address"
DOMAIN_s="domain"
IP_s="ip_address"
DOMAIN_t="domain"
IP_t="ip_address"
DOMAIN_u="domain"
IP_u="ip_address"
DOMAIN_v="domain"
IP_v="ip_address"
DOMAIN_w="domain"
IP_w="ip_address"
DOMAIN_x="domain"
IP_x="ip_address"
DOMAIN_y="domain"
IP_y="ip_address"
DOMAIN_z="domain"
IP_z="ip_address"

# Write the data to the file
FILE_PATH="/etc/nginx/sites-available"
FILE_NAME="link.${MAIN_DOMAIN}"
# Define the data to write
DATA="
server {
    server_name  link.${MAIN_DOMAIN};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${MAIN_IP}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_a};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_a}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_b};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_b}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_c};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_c}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_d};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_d}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_e};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_e}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_f};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_f}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_g};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_g}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_h};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_h}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_i};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_i}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_j};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_j}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_k};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_k}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_l};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_l}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_m};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_m}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}


server {
    server_name  link.${DOMAIN_n};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_n}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_o};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_o}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_p};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_p}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_q};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_q}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_r};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_r}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_s};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_s}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_t};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_t}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_u};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_u}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_v};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_v}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_x};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_x}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_y};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_y}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_z};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_z}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}"

# Write the data to the file
echo "${DATA}" > "${FILE_PATH}/${FILE_NAME}"
echo "created nginx reverse proxy for ip and domain"
#short link the config file for nginx
echo "creating shortlink for nginx files"
ln -s /etc/nginx/sites-available/link.${MAIN_DOMAIN} /etc/nginx/sites-enabled/

DOMAIN_A="domain"
IP_A="ip_address"
DOMAIN_B="domain"
IP_B="ip_address"
DOMAIN_C="domain"
IP_C="ip_address"
DOMAIN_D="domain"
IP_D="ip_address"
DOMAIN_E="domain"
IP_E="ip_address"
DOMAIN_F="domain"
IP_F="ip_address"
DOMAIN_G="domain"
IP_G="ip_address"
DOMAIN_H="domain"
IP_H="ip_address"
DOMAIN_I="domain"
IP_I="ip_address"
DOMAIN_J="domain"
IP_J="ip_address"
DOMAIN_K="domain"
IP_K="ip_address"
DOMAIN_L="domain"
IP_L="ip_address"
DOMAIN_M="domain"
IP_M="ip_address"
DOMAIN_N="domain"
IP_N="ip_address"
DOMAIN_O="domain"
IP_O="ip_address"
DOMAIN_P="domainz"
IP_P="ip_address"
DOMAIN_Q="domain"
IP_Q="ip_address"
DOMAIN_R="domain"
IP_R="ip_address"
DOMAIN_S="domain"
IP_S="ip_address"
DOMAIN_T="domain"
IP_T="ip_address"
DOMAIN_U="domain"
IP_U="ip_address"
DOMAIN_V="domain"
IP_V="ip_address"
DOMAIN_W="domain"
IP_W="ip_address"
DOMAIN_X="domain"
IP_X="ip_address"
DOMAIN_Y="domain"
IP_Y="ip_address"
DOMAIN_Z="domain"
IP_Z="ip_address"

# Write the data to the file
FILE_PATH="/etc/nginx/sites-available"
FILE_NAME="link.${DOMAIN_A}"
# Define the data to write
DATA="
server {
    server_name  link.${DOMAIN_A};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_A}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_B};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_B}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_C};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_C}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_D};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_D}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_E};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_E}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_F};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_F}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_G};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_G}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_H};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_H}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_I};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_I}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_J};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_J}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_K};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_K}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_L};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_L}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_M};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_M}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}


server {
    server_name  link.${DOMAIN_N};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_N}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_O};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_O}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_P};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_P}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_Q};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_Q}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_R};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_R}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_S};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_S}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_T};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_T}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_U};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_U}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_V};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_V}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_X};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_X}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_Y};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_Y}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}

server {
    server_name  link.${DOMAIN_Z};

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass https://${IP_Z}:9091;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection \"upgrade\";
    }
}"

# Write the data to the file
echo "${DATA}" > "${FILE_PATH}/${FILE_NAME}"
echo "created nginx reverse proxy for ip and domain"
#short link the config file for nginx
echo "creating shortlink for nginx files"
ln -s /etc/nginx/sites-available/link.${DOMAIN_A} /etc/nginx/sites-enabled/

# cd /var/mail-server/config
# add all domains here to add in auth_flat_file
FILE_PATH="/var/mail-server/config"
FILE_NAME="auth_flat_file.ini"
#first-set smtp users and passwords
# Define the data to write
DATA="me@${MAIN_DOMAIN}=${MAIN_DOMAIN}@123
me@${DOMAIN_a}=${DOMAIN_a}@123
me@${DOMAIN_b}=${DOMAIN_b}@123
me@${DOMAIN_c}=${DOMAIN_c}@123
me@${DOMAIN_d}=${DOMAIN_d}@123
me@${DOMAIN_e}=${DOMAIN_e}@123
me@${DOMAIN_f}=${DOMAIN_f}@123
me@${DOMAIN_g}=${DOMAIN_g}@123
me@${DOMAIN_h}=${DOMAIN_h}@123
me@${DOMAIN_i}=${DOMAIN_i}@123
me@${DOMAIN_j}=${DOMAIN_j}@123
me@${DOMAIN_k}=${DOMAIN_k}@123
me@${DOMAIN_l}=${DOMAIN_l}@123
me@${DOMAIN_m}=${DOMAIN_m}@123
me@${DOMAIN_n}=${DOMAIN_n}@123
me@${DOMAIN_o}=${DOMAIN_o}@123
me@${DOMAIN_p}=${DOMAIN_p}@123
me@${DOMAIN_q}=${DOMAIN_q}@123
me@${DOMAIN_r}=${DOMAIN_r}@123
me@${DOMAIN_s}=${DOMAIN_s}@123
me@${DOMAIN_t}=${DOMAIN_t}@123
me@${DOMAIN_u}=${DOMAIN_u}@123
me@${DOMAIN_v}=${DOMAIN_v}@123
me@${DOMAIN_w}=${DOMAIN_w}@123
me@${DOMAIN_x}=${DOMAIN_x}@123
me@${DOMAIN_y}=${DOMAIN_y}@123
me@${DOMAIN_z}=${DOMAIN_z}@123
#second-set smtp users and password
me@${DOMAIN_A}=${DOMAIN_A}@123
me@${DOMAIN_B}=${DOMAIN_B}@123
me@${DOMAIN_C}=${DOMAIN_C}@123
me@${DOMAIN_D}=${DOMAIN_D}@123
me@${DOMAIN_E}=${DOMAIN_E}@123
me@${DOMAIN_F}=${DOMAIN_F}@123
me@${DOMAIN_G}=${DOMAIN_G}@123
me@${DOMAIN_H}=${DOMAIN_H}@123
me@${DOMAIN_I}=${DOMAIN_I}@123
me@${DOMAIN_J}=${DOMAIN_J}@123
me@${DOMAIN_K}=${DOMAIN_K}@123
me@${DOMAIN_L}=${DOMAIN_L}@123
me@${DOMAIN_M}=${DOMAIN_M}@123
me@${DOMAIN_N}=${DOMAIN_N}@123
me@${DOMAIN_O}=${DOMAIN_O}@123
me@${DOMAIN_P}=${DOMAIN_P}@123
me@${DOMAIN_Q}=${DOMAIN_Q}@123
me@${DOMAIN_R}=${DOMAIN_R}@123
me@${DOMAIN_S}=${DOMAIN_S}@123
me@${DOMAIN_T}=${DOMAIN_T}@123
me@${DOMAIN_U}=${DOMAIN_U}@123
me@${DOMAIN_V}=${DOMAIN_V}@123
me@${DOMAIN_W}=${DOMAIN_W}@123
me@${DOMAIN_X}=${DOMAIN_X}@123
me@${DOMAIN_Y}=${DOMAIN_Y}@123
me@${DOMAIN_Z}=${DOMAIN_Z}@123
"
# Write the data to the file
sudo sh -c "echo '${DATA}' >> '${FILE_PATH}/${FILE_NAME}'"
echo "adding domains data to authorization file completed"

#ssl certificate to domain
echo "creating ssl for main-domain"
sudo certbot --nginx -d link.${MAIN_DOMAIN} --redirect
#ssl certificate for first-set domains
echo "creating ssl for first-set domains"
sudo certbot --nginx -d link.${DOMAIN_a} --redirect
sudo certbot --nginx -d link.${DOMAIN_b} --redirect
sudo certbot --nginx -d link.${DOMAIN_c} --redirect
sudo certbot --nginx -d link.${DOMAIN_d} --redirect
sudo certbot --nginx -d link.${DOMAIN_e} --redirect
sudo certbot --nginx -d link.${DOMAIN_f} --redirect
sudo certbot --nginx -d link.${DOMAIN_g} --redirect
sudo certbot --nginx -d link.${DOMAIN_h} --redirect
sudo certbot --nginx -d link.${DOMAIN_i} --redirect
sudo certbot --nginx -d link.${DOMAIN_j} --redirect
sudo certbot --nginx -d link.${DOMAIN_k} --redirect
sudo certbot --nginx -d link.${DOMAIN_l} --redirect
sudo certbot --nginx -d link.${DOMAIN_m} --redirect
sudo certbot --nginx -d link.${DOMAIN_n} --redirect
sudo certbot --nginx -d link.${DOMAIN_o} --redirect
sudo certbot --nginx -d link.${DOMAIN_p} --redirect
sudo certbot --nginx -d link.${DOMAIN_q} --redirect
sudo certbot --nginx -d link.${DOMAIN_r} --redirect
sudo certbot --nginx -d link.${DOMAIN_s} --redirect
sudo certbot --nginx -d link.${DOMAIN_t} --redirect
sudo certbot --nginx -d link.${DOMAIN_u} --redirect
sudo certbot --nginx -d link.${DOMAIN_v} --redirect
sudo certbot --nginx -d link.${DOMAIN_w} --redirect
sudo certbot --nginx -d link.${DOMAIN_x} --redirect
sudo certbot --nginx -d link.${DOMAIN_y} --redirect
sudo certbot --nginx -d link.${DOMAIN_z} --redirect
echo "Done creating ssl for first-set domains"

#ssl certificate for second-set domains
echo "creating ssl for second-set domains"
sudo certbot --nginx -d link.${DOMAIN_A} --redirect
sudo certbot --nginx -d link.${DOMAIN_B} --redirect
sudo certbot --nginx -d link.${DOMAIN_C} --redirect
sudo certbot --nginx -d link.${DOMAIN_D} --redirect
sudo certbot --nginx -d link.${DOMAIN_E} --redirect
sudo certbot --nginx -d link.${DOMAIN_F} --redirect
sudo certbot --nginx -d link.${DOMAIN_G} --redirect
sudo certbot --nginx -d link.${DOMAIN_H} --redirect
sudo certbot --nginx -d link.${DOMAIN_I} --redirect
sudo certbot --nginx -d link.${DOMAIN_J} --redirect
sudo certbot --nginx -d link.${DOMAIN_K} --redirect
sudo certbot --nginx -d link.${DOMAIN_L} --redirect
sudo certbot --nginx -d link.${DOMAIN_M} --redirect
sudo certbot --nginx -d link.${DOMAIN_N} --redirect
sudo certbot --nginx -d link.${DOMAIN_O} --redirect
sudo certbot --nginx -d link.${DOMAIN_P} --redirect
sudo certbot --nginx -d link.${DOMAIN_Q} --redirect
sudo certbot --nginx -d link.${DOMAIN_R} --redirect
sudo certbot --nginx -d link.${DOMAIN_S} --redirect
sudo certbot --nginx -d link.${DOMAIN_T} --redirect
sudo certbot --nginx -d link.${DOMAIN_U} --redirect
sudo certbot --nginx -d link.${DOMAIN_V} --redirect
sudo certbot --nginx -d link.${DOMAIN_W} --redirect
sudo certbot --nginx -d link.${DOMAIN_X} --redirect
sudo certbot --nginx -d link.${DOMAIN_Y} --redirect
sudo certbot --nginx -d link.${DOMAIN_Z} --redirect

#do this for main domain only
echo "copy the keyfiles for MAIN_DOMAIN only"
cp -r /etc/letsencrypt/archive/link.${MAIN_DOMAIN}/cert1.pem /var/mail-server/config/cert1.pem
cp -r /etc/letsencrypt/archive/link.${MAIN_DOMAIN}/privkey1.pem /var/mail-server/config/privkey1.pem


