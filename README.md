
# 🔐 S/MIME Self-Signed Certificate Generator

This project provides simple, automated scripts for generating self-signed S/MIME certificates using **OpenSSL**. These certificates can be imported into email clients (like Outlook or Thunderbird) for testing or demonstration purposes of **email encryption** and **digital signing**.

Perfect for:
- 📚 Cybersecurity & cryptography demonstrations
- 🎓 Academic presentations
- 💼 Personal testing or internal use

---

## 📁 Project Structure

```

smime-auto-sign/
├── generate\_smime\_cert.sh    # Bash script for Linux/macOS
├── generate\_smime\_cert.bat   # Batch script for Windows
└── README.md                 # This documentation

````

---

## ⚙️ Features

✅ Generates a secure 2048-bit RSA private key  
✅ Creates a self-signed X.509 certificate for S/MIME  
✅ Packages everything into a `.p12` (PKCS#12) file for email clients  
✅ Fully customizable: email, organization, validity period  
✅ Easy to use on both Windows and Linux/macOS  

---

## 🧪 Quick Demo (Linux/macOS)

```bash
chmod +x generate_smime_cert.sh
./generate_smime_cert.sh
````

You will be prompted for:

* Your email address
* Organization name
* Password to protect the exported `.p12` file

The script will generate:

* `smime_private.key` – your private RSA key
* `smime_cert.pem` – your public X.509 certificate
* `smime_cert.p12` – combined key+certificate for email clients

---

## 🪟 Quick Demo (Windows)

1. Double-click `generate_smime_cert.bat` or run it via command prompt.
2. Follow the prompts (email, organization).
3. A `.p12` file will be generated, ready to import into your email client.

---

## 📧 How to Use the `.p12` File

Import the generated `.p12` file into your email client:

### 📬 Thunderbird

* Preferences → Privacy & Security → View Certificates → Import
* Select your `.p12` file
* Enable signing/encryption for your account

### 💼 Outlook

* File → Options → Trust Center → Trust Center Settings → Email Security
* Import your digital ID
* Enable "Encrypt contents and attachments" & "Add digital signature"

---

## 🛡️ Disclaimer

> **These certificates are self-signed and for educational or internal purposes only.**
> They will not be trusted by external parties or systems unless explicitly installed as trusted.

---

## ✍️ Author

**MONEZE PARFAIT-JUNIOR**
📘 *Cybersecurity & Cryptography Enthusiast*
🔗 [GitHub Profile](https://github.com/Lordpanda2003)
📧 [monezejunior@gmail.com](mailto:monezejunior@gmail.com)

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
Feel free to use, modify, and share it!

---

## 🙌 Contributions

Pull requests are welcome!
If you'd like to improve the script (e.g., GUI version, CSR generation, etc.), open an issue or fork the project.
