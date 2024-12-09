# Timed password generator in Classic ASP

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/b002370296f74fce8bf189ab7ca27fda)](https://app.codacy.com/gh/R0mb0/Timed_password_generator_classic_asp/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/R0mb0/Timed_password_generator_classic_asp)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/R0mb0/Timed_password_generator_classic_asp)
[![MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/license/mit)

[![Donate](https://img.shields.io/badge/PayPal-Donate%20to%20Author-blue.svg)](http://paypal.me/R0mb0)

## Class Logic
```mermaid
flowchart LR
    A[Timed_passowrd_generator] --> B{If}
    B --> |Password_and_timestamp_file_is_present| C[Check date]
    C -->|One| D[Result 1]
    C -->|Two| E[Result 2]
