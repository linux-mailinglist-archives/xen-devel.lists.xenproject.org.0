Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9629053116B
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335916.560127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P1-0004bR-R6; Mon, 23 May 2022 14:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335916.560127; Mon, 23 May 2022 14:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P1-0004XP-I7; Mon, 23 May 2022 14:51:23 +0000
Received: by outflank-mailman (input) for mailman id 335916;
 Mon, 23 May 2022 14:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt9Oz-0004UL-A6
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:51:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd60a81d-daa7-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 16:51:19 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cd60a81d-daa7-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653317479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JOv8AP/EVeQyHro0H8u2Y2X1FdOCStAhJyvYflWqHuI=;
  b=HoMgGVJIkHfuNanzi89ENyoXhRgt0vgUUxv/FQ6fJzKclgi2qqE8R19k
   z1VgJg/Zdf0J0fbl/DYI/ibTolCwbvdJGVXT70jUNkNRvhJJZRgL/5UUX
   H6bVWYmWL6eMpmxtBnfd1tSBL63XolLCMQDrobmrV5vgRa2+KDkGsBc17
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71961684
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EZo7ZqNM+UmN7qLvrR2Rl8FynXyQoLVcMsEvi/4bfWQNrUpxgTQBx
 jEdDG7SO/ffZ2L0KopyPd618hkAuZTRzdFiSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2NUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 MtUmaWRciETN+7tmbtHaTd2IiN5BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALKMjteocep1lrzC3DDOZgSpfGK0nPzYABjWlp2JASdRrYT
 +FGQxE1MCrDXyxwKGo0A5Qsrem6nUCqJlW0r3rK/PFqsgA/1jdZ0rLgLd7UcdyiXthOkwCTo
 Weu12bkBhAXMvSPxDzD9Wij7sfQmQvrVYRUE6e3ntZUh1mUyn0WGQchf1KxqvmkiWazQ9tab
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRlvaeJU3ub+vGRpCmrJCkOBWYYYGkPSg5t3jX4iNht1FSVFI8lSfPryI2ucd3t/
 9yUhDggnpkqrPUt7az43FGY2QiCiKnLSTdgs207QVmZAhNFiJ+NPtL1sgKAvaYbdu51XXHa4
 iFaxpH2APQmSMjUyXfTGLhl8KSBva7tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JiCN/Yfj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhV3y/1jZ
 c7BKZ/8ZZr/NUiA5GPrL9rxLJdxnnxurY8tbc6TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqNZ7BQlTfRATWMGtw+QKJ7HrH+aTMDx4YxMn6eh5K9INcmU8vrqgw
 0xRrWcBlwOv1CWadFzQAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:p9o3WKo1bE4XVxsHXXyN1cQaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71961684"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/6] xen: implement byteswap
Date: Mon, 23 May 2022 10:50:46 -0400
Message-ID: <4d5b36ffc215d954e40ba8f6f3bf11402c015b87.1653316202.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653316202.git.lin.liu@citrix.com>
References: <cover.1653316202.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

swab() is massively over complicated and can be simplified
by re-implementing using compiler builtins.
The compilers provide builtin function to swap bytes.
* gcc:   https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html
* clang: https://clang.llvm.org/docs/LanguageExtensions.html
This patch introduces a new byteswapping infrastructure in
terms of compiler builtins and bswapXX(), so the swab() infrastructure
can be retired.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Changes in v5:
- Move `PASTE` back to xen/lib.h
- Define `PASTE` for tools in xen-tools/libs.h

Changes in v4:
- Move `PASTE` definition to xen/compiler.h to support tools
- Revert emacs magics

Changes in v3:
- Check __has_builtin instead of GNUC version 

Changes in v2:
- Add fallback for compilers without __builtin_bswap
- Implement with plain C instead of macros
---
 tools/include/xen-tools/libs.h       |  4 ++
 xen/arch/arm/include/asm/byteorder.h |  6 ++-
 xen/arch/x86/include/asm/byteorder.h | 34 ++---------------
 xen/include/xen/byteorder.h          | 56 ++++++++++++++++++++++++++++
 xen/include/xen/byteswap.h           | 44 ++++++++++++++++++++++
 xen/include/xen/compiler.h           | 20 ++++++++++
 6 files changed, 132 insertions(+), 32 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 create mode 100644 xen/include/xen/byteswap.h

diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index a16e0c3807..fc12ac84c6 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -63,4 +63,8 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+/* Indirect macros required for expanded argument pasting. */
+#define PASTE_(a, b) a ## b
+#define PASTE(a, b) PASTE_(a, b)
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/xen/arch/arm/include/asm/byteorder.h b/xen/arch/arm/include/asm/byteorder.h
index 9c712c4788..b6a33b23c0 100644
--- a/xen/arch/arm/include/asm/byteorder.h
+++ b/xen/arch/arm/include/asm/byteorder.h
@@ -1,9 +1,11 @@
 #ifndef __ASM_ARM_BYTEORDER_H__
 #define __ASM_ARM_BYTEORDER_H__
 
-#define __BYTEORDER_HAS_U64__
+#ifndef __BYTE_ORDER__
+   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
+#endif
 
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* __ASM_ARM_BYTEORDER_H__ */
 /*
diff --git a/xen/arch/x86/include/asm/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
index 1f77e502a5..82aadee7bd 100644
--- a/xen/arch/x86/include/asm/byteorder.h
+++ b/xen/arch/x86/include/asm/byteorder.h
@@ -1,36 +1,10 @@
 #ifndef __ASM_X86_BYTEORDER_H__
 #define __ASM_X86_BYTEORDER_H__
 
-#include <asm/types.h>
-#include <xen/compiler.h>
+#ifndef __BYTE_ORDER__
+   #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
+#endif
 
-static inline __attribute_const__ __u32 ___arch__swab32(__u32 x)
-{
-    asm("bswap %0" : "=r" (x) : "0" (x));
-    return x;
-}
-
-static inline __attribute_const__ __u64 ___arch__swab64(__u64 val)
-{ 
-    union { 
-        struct { __u32 a,b; } s;
-        __u64 u;
-    } v;
-    v.u = val;
-    asm("bswapl %0 ; bswapl %1 ; xchgl %0,%1" 
-        : "=r" (v.s.a), "=r" (v.s.b) 
-        : "0" (v.s.a), "1" (v.s.b)); 
-    return v.u;
-} 
-
-/* Do not define swab16.  Gcc is smart enough to recognize "C" version and
-   convert it into rotation or exhange.  */
-
-#define __arch__swab64(x) ___arch__swab64(x)
-#define __arch__swab32(x) ___arch__swab32(x)
-
-#define __BYTEORDER_HAS_U64__
-
-#include <xen/byteorder/little_endian.h>
+#include <xen/byteorder.h>
 
 #endif /* __ASM_X86_BYTEORDER_H__ */
diff --git a/xen/include/xen/byteorder.h b/xen/include/xen/byteorder.h
new file mode 100644
index 0000000000..2ec434e6a6
--- /dev/null
+++ b/xen/include/xen/byteorder.h
@@ -0,0 +1,56 @@
+#ifndef __XEN_BYTEORDER_H__
+#define __XEN_BYTEORDER_H__
+
+#include <xen/byteswap.h>
+
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+
+# ifndef __LITTLE_ENDIAN
+#  define __LITTLE_ENDIAN 1234
+# endif
+
+# ifndef __LITTLE_ENDIAN_BITFIELD
+#  define __LITTLE_ENDIAN_BITFIELD
+# endif
+
+# define cpu_to_le64(x) (x)
+# define le64_to_cpu(x) (x)
+# define cpu_to_le32(x) (x)
+# define le32_to_cpu(x) (x)
+# define cpu_to_le16(x) (x)
+# define le16_to_cpu(x) (x)
+# define cpu_to_be64(x) bswap64(x)
+# define be64_to_cpu(x) bswap64(x)
+# define cpu_to_be32(x) bswap32(x)
+# define be32_to_cpu(x) bswap32(x)
+# define cpu_to_be16(x) bswap16(x)
+# define be16_to_cpu(x) bswap16(x)
+
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+
+# ifndef __BIG_ENDIAN
+#  define __BIG_ENDIAN 4321
+# endif
+
+# ifndef __BIG_ENDIAN_BITFIELD
+#  define __BIG_ENDIAN_BITFIELD
+# endif
+
+# define cpu_to_le64(x) bswap64(x)
+# define le64_to_cpu(x) bswap64(x)
+# define cpu_to_le32(x) bswap32(x)
+# define le32_to_cpu(x) bswap32(x)
+# define cpu_to_le16(x) bswap16(x)
+# define le16_to_cpu(x) bswap16(x)
+# define cpu_to_be64(x) (x)
+# define be64_to_cpu(x) (x)
+# define cpu_to_be32(x) (x)
+# define be32_to_cpu(x) (x)
+# define cpu_to_be16(x) (x)
+# define be16_to_cpu(x) (x)
+
+#else
+# error "Unknown Endianness"
+#endif /* __BYTE_ORDER__ */
+
+#endif /* __XEN_BYTEORDER_H__ */
diff --git a/xen/include/xen/byteswap.h b/xen/include/xen/byteswap.h
new file mode 100644
index 0000000000..d2e371fbe7
--- /dev/null
+++ b/xen/include/xen/byteswap.h
@@ -0,0 +1,44 @@
+#ifndef __XEN_BYTESWAP_H__
+#define __XEN_BYTESWAP_H__
+
+#include <xen/types.h>
+#include <xen/compiler.h>
+
+#if !__has_builtin(__builtin_bswap16)
+static always_inline uint16_t __builtin_bswap16(uint16_t val)
+{
+    return ((val & 0x00FF) << 8) | ((val & 0xFF00) >> 8);
+}
+#endif
+
+#if !__has_builtin(__builtin_bswap32)
+static always_inline uint32_t __builtin_bswap32(uint32_t val)
+{
+    return ((val & 0x000000FF) << 24) |
+           ((val & 0x0000FF00) <<  8) |
+           ((val & 0x00FF0000) >>  8) |
+           ((val & 0xFF000000) >> 24);
+}
+#endif
+
+#if !__has_builtin(__builtin_bswap64)
+static always_inline uint64_t __builtin_bswap64(uint64_t val)
+{
+    return ((val & 0x00000000000000FF) << 56) |
+           ((val & 0x000000000000FF00) << 40) |
+           ((val & 0x0000000000FF0000) << 24) |
+           ((val & 0x00000000FF000000) <<  8) |
+           ((val & 0x000000FF00000000) >>  8) |
+           ((val & 0x0000FF0000000000) >> 24) |
+           ((val & 0x00FF000000000000) >> 40) |
+           ((val & 0xFF00000000000000) >> 56);
+}
+#endif
+
+#define bswap16(x) __builtin_bswap16(x)
+#define bswap32(x) __builtin_bswap32(x)
+#define bswap64(x) __builtin_bswap64(x)
+
+#define bswap_ul(x) PASTE(bswap,BITS_PER_LONG)(x)
+
+#endif /* __XEN_BYTESWAP_H__ */
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 933aec09a9..6d77da8a68 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -185,4 +185,24 @@
 # define CLANG_DISABLE_WARN_GCC_COMPAT_END
 #endif
 
+#ifndef __has_builtin
+/*
+ * Backwards compatibility for GCC < 10.
+ * All supported versions of Clang support __has_builtin
+ * */
+#define __has_builtin(x) GCC_has ## x
+
+#define GCC_has__builtin_bswap16 (CONFIG_GCC_VERSION >= 40800)
+#define GCC_has__builtin_bswap32 (CONFIG_GCC_VERSION >= 40400)
+#define GCC_has__builtin_bswap64 (CONFIG_GCC_VERSION >= 40400)
+#endif
+
+#ifndef __ORDER_LITTLE_ENDIAN__
+# define __ORDER_LITTLE_ENDIAN__ 1234
+#endif
+
+#ifndef __ORDER_BIG_ENDIAN__
+# define __ORDER_BIG_ENDIAN__ 4321
+#endif
+
 #endif /* __LINUX_COMPILER_H */
-- 
2.27.0


