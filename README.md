# hw-package – Conda Package Example with C++ and zlib

This repository demonstrates how to build a **Conda package** from a minimal C++ application.  
The application depends on the external [zlib](https://zlib.net/) library.

During the **build stage**, the application is **statically linked** with zlib.  
At **runtime**, it requires the **dynamic version** of the zlib library (`zlib.dll` / `libz.so`).

The project includes support for both **Windows** and **Linux** x64 builds using Conda.

---

## 🐧 Linux Specifics

On Linux systems, the `zlib` library is typically already installed and available globally.  
However, in some scenarios you may want your application to use a **specific version** of `zlib`, bundled within your own environment or package.

This demo shows how to:

- Ensure the **build process** links against the version of zlib provided by Conda (not the system one).
- Ensure the resulting application **runs using the dynamic version** of zlib as defined in the Conda environment dependencies.

This allows consistent behavior and compatibility, regardless of the system-wide version of zlib.

---

## 🛠 Build Instructions

To build the package locally:
   ```bash
   git clone https://github.com/your-username/hw.git
   cd hw/recipe
   conda build .
   ```
---

## 📦 Installation via Anaconda.org
The built package is available on Anaconda.org.
To install it, simply run:
   ```bash
   conda install -c rsushysnkyi hw-package
   ```
---
## 🚀 Running the Application
   ```bash
   cd ~/anaconda3/pkgs/hw-package-1.1-0/output_bin/bin
   ./hw
   ```
It will print something like:
   ```bash
   zlib version: 1.2.13
   ```