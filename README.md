# Cloudflare-DDNS-Script

`cloudflare-ddns.sh` is a shell script designed to update DNS records dynamically on Cloudflare. It is useful for users with dynamic IP addresses who want to update their DNS records automatically.

## Features

- Updates A or AAAA records on Cloudflare.
- Supports dynamic IP detection.
- Lightweight and easy to configure.

## Prerequisites

- A Cloudflare account.
- Your domain managed on Cloudflare.
- API Token with DNS edit permissions.

## Contributing

This script is inspired by and builds upon the work of others in the community. Special thanks to the original repository [`ddns/cf-ip-renew.sh`](https://github.com/samejack/blog-content/blob/f276f628880e498402b2213c8362ef3c9dd12882/ddns/cf-ip-renew.sh) for providing a foundation. 

For more details, you can also refer to the original blog post: [5 分鐘整合 Cloudflare API 實做 Cloudflare DDNS 動態 IP 對應網址](https://blog.toright.com/posts/7333/cloudflare-ddns).

### Additional Features Added
- **Crontab Guideline**: Instructions on how to set up a crontab entry for automated execution of the script.
- **Logging Feature**: Added functionality to log updates and errors for easier debugging and monitoring.

Feel free to submit issues or pull requests to improve this script further.

## License

This project is licensed under the [MIT License](LICENSE).

## Disclaimer

Use this script at your own risk. Ensure you understand the changes it makes to your DNS records.