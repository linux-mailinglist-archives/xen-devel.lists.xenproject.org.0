Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD14375AF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214953.373879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5z-0007as-Ht; Fri, 22 Oct 2021 10:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214953.373879; Fri, 22 Oct 2021 10:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5z-0007WM-C8; Fri, 22 Oct 2021 10:48:19 +0000
Received: by outflank-mailman (input) for mailman id 214953;
 Fri, 22 Oct 2021 10:48:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds5x-00063s-JL
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:17 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 893393e9-3325-11ec-83b2-12813bfff9fa;
 Fri, 22 Oct 2021 10:48:07 +0000 (UTC)
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
X-Inumbo-ID: 893393e9-3325-11ec-83b2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1OHvsWzP7gE68vduDcWmR3YdlGbvcStDaG0K0LsI1tc=;
  b=GYz/yfZWbhjSvCAnUx9E97WF0o+SmPpCEHxK8NkA1mAEag1aNGSwEQT+
   ri9lkLmfYEmqLVCZjh/i0046DGexy34UQJBcZdLyE7RHMa8txMb9OMqtW
   rddAzo3u+oDwAKxCIKmsMNnY34xoaRaTLzrVsu5AcGwBpcM+UTLJNV1Bi
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: R21dHoDic8am31wi4NNutW4/f5v3voGJG2274lGVy8ycKKjz2xsmBV2dRbZ31drFKBDzkZOBef
 wCXCjGnVOVR3t9FQVsel/0Ef5cGwaBu/jNpJfs5czAYtzBJjEbBFKkC52xqQLXkYjzlM0IlR42
 OA+zU9T3O97ZY1Gn1K/R04MikW+aEyH1W2N51b0R8PgNpH8aH+YLVVXCzyovSo5yJ+ENvcaxL0
 Jm0S3l4LUT3KoghrX/nLs9E7r262w12h+1L7lBT+cKbLwcJMb/60L2EnUYLm0sOA/I3mT06F+d
 LNwyKb9pJIETzQMyRzLwGsfS
X-SBRS: 5.1
X-MesageID: 55376145
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:m+n9pamtyPKDorFQ/6E8V3Po5gwZIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDGmAaKvbamGkKtAjb9/iox9Qv8ODzYAxSgU9rC09FCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tQy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 JZvrLq/WxszB4vvg/kdCRkHIQAhOoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBM3qOsUbu2xIxjDFF/c2B5vERs0m4PcFgWxv2JkSQJ4yY
 eIXcSBKRw3lPSRfFWhOJqsZsOG2q0jgJmgwRFW9+vNsvjm7IBZK+LrnPcfRe9eKbd5IhUver
 WXDl0z7HxUbOdq32TeDtHW2iYfngifTSI8UUrqi+ZZCgUKR7nweDgUMUlm2quX/jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 mGOm9TlFDl+qoq/QHiW9qqXhT6qMC1TJmgHDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxmz4
 SmsozoinYw1rtUW1/+7omLm3DWF882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 yBaw5n2APQmSMjXznTUEbpl8KSBvq7daFXhbUhT847NHthH00WoepxM+3lALUNtP9dsldTBM
 RKL5105CHO+OhKXgU5Lj2CZV5tCIUvIT42NuhXogjxmOMQZmOivp3kGWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35lmTOPHM+rl0/6gNJygUJ5r59fbDNiichitMu5TPj9q
 Y4DZ6NmNT0POAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQwkc5wvq6ep5IeRNxv0N/s+Rp
 y3VchIImTLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNuLOB5rrQ6kKYoJ
 xTHEu3Zaslypv3802x1RfHAQEZKLnxHXCqCYHioZiYRZZllS1Cb89PoZFK3piIPEjC2pY01p
 Lj5jlHXRp8KRgJDCsfKaa3wkwPt7CZFwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuYnRhhaEmDX4KyYLy7f+mb/k4ZMXPzRJWLWVX/u+bXkb
 uJQlqmuPPoClVdMkox9D7c0kv5uu4qx/+dXl102Em/KYlKnDqJbDkOHhcQf5LdQwrJ5uBetX
 h7d8NdtJrjUatjuF0QcJVR5Y73bh+0UgDTb8d88PF7+uH1s5LOCXEhfY0uMhShaIOcnOY8p2
 7586ssf6gj5gRs2KNeWyCtT8j3UfHAHVqwmsLAcAZPq1VV3mg0TP8SEB3+k+oyLZvVNLlIuc
 22di6f1jrhBwlbPLigoHn/X0OsB3ZkDtXimFrPZy4hlTjYdusIK4Q==
IronPort-HdrOrdr: A9a23:gQTE5qxa3hXD79FMeZPpKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55376145"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 7/7] byteorder: Remove byteorder
Date: Fri, 22 Oct 2021 10:47:28 +0000
Message-ID: <e0ffd4c6db4dc1f1e0a7ef7dd6d02c49f944353c.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

include/xen/byteswap.h has simplify the interface, just clean
the old interface

No functional change

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/include/asm-arm/byteorder.h           |  16 --
 xen/include/asm-x86/byteorder.h           |  36 -----
 xen/include/xen/byteorder/big_endian.h    | 102 ------------
 xen/include/xen/byteorder/generic.h       |  68 --------
 xen/include/xen/byteorder/little_endian.h | 102 ------------
 xen/include/xen/byteorder/swab.h          | 183 ----------------------
 6 files changed, 507 deletions(-)
 delete mode 100644 xen/include/asm-arm/byteorder.h
 delete mode 100644 xen/include/asm-x86/byteorder.h
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h

diff --git a/xen/include/asm-arm/byteorder.h b/xen/include/asm-arm/byteorder.h
deleted file mode 100644
index 9c712c4788..0000000000
--- a/xen/include/asm-arm/byteorder.h
+++ /dev/null
@@ -1,16 +0,0 @@
-#ifndef __ASM_ARM_BYTEORDER_H__
-#define __ASM_ARM_BYTEORDER_H__
-
-#define __BYTEORDER_HAS_U64__
-
-#include <xen/byteorder/little_endian.h>
-
-#endif /* __ASM_ARM_BYTEORDER_H__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/asm-x86/byteorder.h b/xen/include/asm-x86/byteorder.h
deleted file mode 100644
index 1f77e502a5..0000000000
--- a/xen/include/asm-x86/byteorder.h
+++ /dev/null
@@ -1,36 +0,0 @@
-#ifndef __ASM_X86_BYTEORDER_H__
-#define __ASM_X86_BYTEORDER_H__
-
-#include <asm/types.h>
-#include <xen/compiler.h>
-
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
-
-#endif /* __ASM_X86_BYTEORDER_H__ */
diff --git a/xen/include/xen/byteorder/big_endian.h b/xen/include/xen/byteorder/big_endian.h
deleted file mode 100644
index 40eb80a390..0000000000
--- a/xen/include/xen/byteorder/big_endian.h
+++ /dev/null
@@ -1,102 +0,0 @@
-#ifndef __XEN_BYTEORDER_BIG_ENDIAN_H__
-#define __XEN_BYTEORDER_BIG_ENDIAN_H__
-
-#ifndef __BIG_ENDIAN
-#define __BIG_ENDIAN 4321
-#endif
-#ifndef __BIG_ENDIAN_BITFIELD
-#define __BIG_ENDIAN_BITFIELD
-#endif
-
-#include <xen/types.h>
-#include <xen/byteorder/swab.h>
-
-#define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
-#define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
-#define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
-#define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
-#define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
-#define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
-#define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
-#define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
-#define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
-#define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
-#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
-#define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
-#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
-#define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
-#define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
-#define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
-#define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
-#define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
-#define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
-
-static inline __le64 __cpu_to_le64p(const __u64 *p)
-{
-    return (__force __le64)__swab64p(p);
-}
-static inline __u64 __le64_to_cpup(const __le64 *p)
-{
-    return __swab64p((__u64 *)p);
-}
-static inline __le32 __cpu_to_le32p(const __u32 *p)
-{
-    return (__force __le32)__swab32p(p);
-}
-static inline __u32 __le32_to_cpup(const __le32 *p)
-{
-    return __swab32p((__u32 *)p);
-}
-static inline __le16 __cpu_to_le16p(const __u16 *p)
-{
-    return (__force __le16)__swab16p(p);
-}
-static inline __u16 __le16_to_cpup(const __le16 *p)
-{
-    return __swab16p((__u16 *)p);
-}
-static inline __be64 __cpu_to_be64p(const __u64 *p)
-{
-    return (__force __be64)*p;
-}
-static inline __u64 __be64_to_cpup(const __be64 *p)
-{
-    return (__force __u64)*p;
-}
-static inline __be32 __cpu_to_be32p(const __u32 *p)
-{
-    return (__force __be32)*p;
-}
-static inline __u32 __be32_to_cpup(const __be32 *p)
-{
-    return (__force __u32)*p;
-}
-static inline __be16 __cpu_to_be16p(const __u16 *p)
-{
-    return (__force __be16)*p;
-}
-static inline __u16 __be16_to_cpup(const __be16 *p)
-{
-    return (__force __u16)*p;
-}
-#define __cpu_to_le64s(x) __swab64s((x))
-#define __le64_to_cpus(x) __swab64s((x))
-#define __cpu_to_le32s(x) __swab32s((x))
-#define __le32_to_cpus(x) __swab32s((x))
-#define __cpu_to_le16s(x) __swab16s((x))
-#define __le16_to_cpus(x) __swab16s((x))
-#define __cpu_to_be64s(x) do {} while (0)
-#define __be64_to_cpus(x) do {} while (0)
-#define __cpu_to_be32s(x) do {} while (0)
-#define __be32_to_cpus(x) do {} while (0)
-#define __cpu_to_be16s(x) do {} while (0)
-#define __be16_to_cpus(x) do {} while (0)
-
-#include <xen/byteorder/generic.h>
-
-#endif /* __XEN_BYTEORDER_BIG_ENDIAN_H__ */
diff --git a/xen/include/xen/byteorder/generic.h b/xen/include/xen/byteorder/generic.h
deleted file mode 100644
index 8a0006b755..0000000000
--- a/xen/include/xen/byteorder/generic.h
+++ /dev/null
@@ -1,68 +0,0 @@
-#ifndef __XEN_BYTEORDER_GENERIC_H__
-#define __XEN_BYTEORDER_GENERIC_H__
-
-/*
- * Generic Byte-reordering support
- *
- * The "... p" macros, like le64_to_cpup, can be used with pointers
- * to unaligned data, but there will be a performance penalty on 
- * some architectures.  Use get_unaligned for unaligned data.
- *
- * The following macros are to be defined by <asm/byteorder.h>:
- *
- * Conversion of XX-bit integers (16- 32- or 64-)
- * between native CPU format and little/big endian format
- * 64-bit stuff only defined for proper architectures
- *     cpu_to_[bl]eXX(__uXX x)
- *     [bl]eXX_to_cpu(__uXX x)
- *
- * The same, but takes a pointer to the value to convert
- *     cpu_to_[bl]eXXp(__uXX x)
- *     [bl]eXX_to_cpup(__uXX x)
- *
- * The same, but change in situ
- *     cpu_to_[bl]eXXs(__uXX x)
- *     [bl]eXX_to_cpus(__uXX x)
- *
- * See asm-foo/byteorder.h for examples of how to provide
- * architecture-optimized versions
- */
-
-#define cpu_to_le64 __cpu_to_le64
-#define le64_to_cpu __le64_to_cpu
-#define cpu_to_le32 __cpu_to_le32
-#define le32_to_cpu __le32_to_cpu
-#define cpu_to_le16 __cpu_to_le16
-#define le16_to_cpu __le16_to_cpu
-#define cpu_to_be64 __cpu_to_be64
-#define be64_to_cpu __be64_to_cpu
-#define cpu_to_be32 __cpu_to_be32
-#define be32_to_cpu __be32_to_cpu
-#define cpu_to_be16 __cpu_to_be16
-#define be16_to_cpu __be16_to_cpu
-#define cpu_to_le64p __cpu_to_le64p
-#define le64_to_cpup __le64_to_cpup
-#define cpu_to_le32p __cpu_to_le32p
-#define le32_to_cpup __le32_to_cpup
-#define cpu_to_le16p __cpu_to_le16p
-#define le16_to_cpup __le16_to_cpup
-#define cpu_to_be64p __cpu_to_be64p
-#define be64_to_cpup __be64_to_cpup
-#define cpu_to_be32p __cpu_to_be32p
-#define be32_to_cpup __be32_to_cpup
-#define cpu_to_be16p __cpu_to_be16p
-#define be16_to_cpup __be16_to_cpup
-#define cpu_to_le64s __cpu_to_le64s
-#define le64_to_cpus __le64_to_cpus
-#define cpu_to_le32s __cpu_to_le32s
-#define le32_to_cpus __le32_to_cpus
-#define cpu_to_le16s __cpu_to_le16s
-#define le16_to_cpus __le16_to_cpus
-#define cpu_to_be64s __cpu_to_be64s
-#define be64_to_cpus __be64_to_cpus
-#define cpu_to_be32s __cpu_to_be32s
-#define be32_to_cpus __be32_to_cpus
-#define cpu_to_be16s __cpu_to_be16s
-#define be16_to_cpus __be16_to_cpus
-
-#endif /* __XEN_BYTEORDER_GENERIC_H__ */
diff --git a/xen/include/xen/byteorder/little_endian.h b/xen/include/xen/byteorder/little_endian.h
deleted file mode 100644
index 4955632793..0000000000
--- a/xen/include/xen/byteorder/little_endian.h
+++ /dev/null
@@ -1,102 +0,0 @@
-#ifndef __XEN_BYTEORDER_LITTLE_ENDIAN_H__
-#define __XEN_BYTEORDER_LITTLE_ENDIAN_H__
-
-#ifndef __LITTLE_ENDIAN
-#define __LITTLE_ENDIAN 1234
-#endif
-#ifndef __LITTLE_ENDIAN_BITFIELD
-#define __LITTLE_ENDIAN_BITFIELD
-#endif
-
-#include <xen/types.h>
-#include <xen/byteorder/swab.h>
-
-#define __constant_cpu_to_le64(x) ((__force __le64)(__u64)(x))
-#define __constant_le64_to_cpu(x) ((__force __u64)(__le64)(x))
-#define __constant_cpu_to_le32(x) ((__force __le32)(__u32)(x))
-#define __constant_le32_to_cpu(x) ((__force __u32)(__le32)(x))
-#define __constant_cpu_to_le16(x) ((__force __le16)(__u16)(x))
-#define __constant_le16_to_cpu(x) ((__force __u16)(__le16)(x))
-#define __constant_cpu_to_be64(x) ((__force __be64)___constant_swab64((x)))
-#define __constant_be64_to_cpu(x) ___constant_swab64((__force __u64)(__be64)(x))
-#define __constant_cpu_to_be32(x) ((__force __be32)___constant_swab32((x)))
-#define __constant_be32_to_cpu(x) ___constant_swab32((__force __u32)(__be32)(x))
-#define __constant_cpu_to_be16(x) ((__force __be16)___constant_swab16((x)))
-#define __constant_be16_to_cpu(x) ___constant_swab16((__force __u16)(__be16)(x))
-#define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
-#define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
-#define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
-#define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
-#define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
-#define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
-#define __cpu_to_be64(x) ((__force __be64)__swab64((x)))
-#define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
-#define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
-#define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
-#define __cpu_to_be16(x) ((__force __be16)__swab16((x)))
-#define __be16_to_cpu(x) __swab16((__force __u16)(__be16)(x))
-
-static inline __le64 __cpu_to_le64p(const __u64 *p)
-{
-    return (__force __le64)*p;
-}
-static inline __u64 __le64_to_cpup(const __le64 *p)
-{
-    return (__force __u64)*p;
-}
-static inline __le32 __cpu_to_le32p(const __u32 *p)
-{
-    return (__force __le32)*p;
-}
-static inline __u32 __le32_to_cpup(const __le32 *p)
-{
-    return (__force __u32)*p;
-}
-static inline __le16 __cpu_to_le16p(const __u16 *p)
-{
-    return (__force __le16)*p;
-}
-static inline __u16 __le16_to_cpup(const __le16 *p)
-{
-    return (__force __u16)*p;
-}
-static inline __be64 __cpu_to_be64p(const __u64 *p)
-{
-    return (__force __be64)__swab64p(p);
-}
-static inline __u64 __be64_to_cpup(const __be64 *p)
-{
-    return __swab64p((__u64 *)p);
-}
-static inline __be32 __cpu_to_be32p(const __u32 *p)
-{
-    return (__force __be32)__swab32p(p);
-}
-static inline __u32 __be32_to_cpup(const __be32 *p)
-{
-    return __swab32p((__u32 *)p);
-}
-static inline __be16 __cpu_to_be16p(const __u16 *p)
-{
-    return (__force __be16)__swab16p(p);
-}
-static inline __u16 __be16_to_cpup(const __be16 *p)
-{
-    return __swab16p((__u16 *)p);
-}
-#define __cpu_to_le64s(x) do {} while (0)
-#define __le64_to_cpus(x) do {} while (0)
-#define __cpu_to_le32s(x) do {} while (0)
-#define __le32_to_cpus(x) do {} while (0)
-#define __cpu_to_le16s(x) do {} while (0)
-#define __le16_to_cpus(x) do {} while (0)
-#define __cpu_to_be64s(x) __swab64s((x))
-#define __be64_to_cpus(x) __swab64s((x))
-#define __cpu_to_be32s(x) __swab32s((x))
-#define __be32_to_cpus(x) __swab32s((x))
-#define __cpu_to_be16s(x) __swab16s((x))
-#define __be16_to_cpus(x) __swab16s((x))
-
-#include <xen/byteorder/generic.h>
-
-#endif /* __XEN_BYTEORDER_LITTLE_ENDIAN_H__ */
diff --git a/xen/include/xen/byteorder/swab.h b/xen/include/xen/byteorder/swab.h
deleted file mode 100644
index b7e30f0503..0000000000
--- a/xen/include/xen/byteorder/swab.h
+++ /dev/null
@@ -1,183 +0,0 @@
-#ifndef __XEN_BYTEORDER_SWAB_H__
-#define __XEN_BYTEORDER_SWAB_H__
-
-/*
- * Byte-swapping, independently from CPU endianness
- *     swabXX[ps]?(foo)
- *
- * Francois-Rene Rideau <fare@tunes.org> 19971205
- *    separated swab functions from cpu_to_XX,
- *    to clean up support for bizarre-endian architectures.
- */
-
-/* casts are necessary for constants, because we never know how for sure
- * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
- */
-#define ___swab16(x)                                    \
-({                                                      \
-    __u16 __x = (x);                                    \
-    ((__u16)(                                           \
-        (((__u16)(__x) & (__u16)0x00ffU) << 8) |        \
-        (((__u16)(__x) & (__u16)0xff00U) >> 8) ));      \
-})
-
-#define ___swab32(x)                                            \
-({                                                              \
-    __u32 __x = (x);                                            \
-    ((__u32)(                                                   \
-        (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |          \
-        (((__u32)(__x) & (__u32)0x0000ff00UL) <<  8) |          \
-        (((__u32)(__x) & (__u32)0x00ff0000UL) >>  8) |          \
-        (((__u32)(__x) & (__u32)0xff000000UL) >> 24) ));        \
-})
-
-#define ___swab64(x)                                                       \
-({                                                                         \
-    __u64 __x = (x);                                                       \
-    ((__u64)(                                                              \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(__x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(__x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(__x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(__x) & (__u64)0xff00000000000000ULL) >> 56) ));   \
-})
-
-#define ___constant_swab16(x)                   \
-    ((__u16)(                                   \
-        (((__u16)(x) & (__u16)0x00ffU) << 8) |  \
-        (((__u16)(x) & (__u16)0xff00U) >> 8) ))
-#define ___constant_swab32(x)                           \
-    ((__u32)(                                           \
-        (((__u32)(x) & (__u32)0x000000ffUL) << 24) |    \
-        (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |    \
-        (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |    \
-        (((__u32)(x) & (__u32)0xff000000UL) >> 24) ))
-#define ___constant_swab64(x)                                            \
-    ((__u64)(                                                            \
-        (__u64)(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |     \
-        (__u64)(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |     \
-            (__u64)(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) | \
-        (__u64)(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |     \
-        (__u64)(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |     \
-        (__u64)(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56) ))
-
-/*
- * provide defaults when no architecture-specific optimization is detected
- */
-#ifndef __arch__swab16
-#  define __arch__swab16(x) ({ __u16 __tmp = (x) ; ___swab16(__tmp); })
-#endif
-#ifndef __arch__swab32
-#  define __arch__swab32(x) ({ __u32 __tmp = (x) ; ___swab32(__tmp); })
-#endif
-#ifndef __arch__swab64
-#  define __arch__swab64(x) ({ __u64 __tmp = (x) ; ___swab64(__tmp); })
-#endif
-
-#ifndef __arch__swab16p
-#  define __arch__swab16p(x) __arch__swab16(*(x))
-#endif
-#ifndef __arch__swab32p
-#  define __arch__swab32p(x) __arch__swab32(*(x))
-#endif
-#ifndef __arch__swab64p
-#  define __arch__swab64p(x) __arch__swab64(*(x))
-#endif
-
-#ifndef __arch__swab16s
-#  define __arch__swab16s(x) do { *(x) = __arch__swab16p((x)); } while (0)
-#endif
-#ifndef __arch__swab32s
-#  define __arch__swab32s(x) do { *(x) = __arch__swab32p((x)); } while (0)
-#endif
-#ifndef __arch__swab64s
-#  define __arch__swab64s(x) do { *(x) = __arch__swab64p((x)); } while (0)
-#endif
-
-
-/*
- * Allow constant folding
- */
-#if defined(__GNUC__) && defined(__OPTIMIZE__)
-#  define __swab16(x) \
-(__builtin_constant_p((__u16)(x)) ? \
- ___swab16((x)) : \
- __fswab16((x)))
-#  define __swab32(x) \
-(__builtin_constant_p((__u32)(x)) ? \
- ___swab32((x)) : \
- __fswab32((x)))
-#  define __swab64(x) \
-(__builtin_constant_p((__u64)(x)) ? \
- ___swab64((x)) : \
- __fswab64((x)))
-#else
-#  define __swab16(x) __fswab16(x)
-#  define __swab32(x) __fswab32(x)
-#  define __swab64(x) __fswab64(x)
-#endif /* OPTIMIZE */
-
-
-static inline __attribute_const__ __u16 __fswab16(__u16 x)
-{
-    return __arch__swab16(x);
-}
-static inline __u16 __swab16p(const __u16 *x)
-{
-    return __arch__swab16p(x);
-}
-static inline void __swab16s(__u16 *addr)
-{
-    __arch__swab16s(addr);
-}
-
-static inline __attribute_const__ __u32 __fswab32(__u32 x)
-{
-    return __arch__swab32(x);
-}
-static inline __u32 __swab32p(const __u32 *x)
-{
-    return __arch__swab32p(x);
-}
-static inline void __swab32s(__u32 *addr)
-{
-    __arch__swab32s(addr);
-}
-
-#ifdef __BYTEORDER_HAS_U64__
-static inline __attribute_const__ __u64 __fswab64(__u64 x)
-{
-#  ifdef __SWAB_64_THRU_32__
-    __u32 h = x >> 32;
-        __u32 l = x & ((1ULL<<32)-1);
-        return (((__u64)__swab32(l)) << 32) | ((__u64)(__swab32(h)));
-#  else
-    return __arch__swab64(x);
-#  endif
-}
-static inline __u64 __swab64p(const __u64 *x)
-{
-    return __arch__swab64p(x);
-}
-static inline void __swab64s(__u64 *addr)
-{
-    __arch__swab64s(addr);
-}
-#endif /* __BYTEORDER_HAS_U64__ */
-
-#define swab16 __swab16
-#define swab32 __swab32
-#define swab64 __swab64
-#define swab16p __swab16p
-#define swab32p __swab32p
-#define swab64p __swab64p
-#define swab16s __swab16s
-#define swab32s __swab32s
-#define swab64s __swab64s
-
-#endif /* __XEN_BYTEORDER_SWAB_H__ */
-- 
2.27.0


