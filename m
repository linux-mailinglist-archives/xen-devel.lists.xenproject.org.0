Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91BC9DA815
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844755.1260297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHV0-0005ko-GC; Wed, 27 Nov 2024 12:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844755.1260297; Wed, 27 Nov 2024 12:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHV0-0005fm-Bn; Wed, 27 Nov 2024 12:50:30 +0000
Received: by outflank-mailman (input) for mailman id 844755;
 Wed, 27 Nov 2024 12:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHUy-0004Yu-Sa
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 12:50:28 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e19c1b-acbe-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 13:50:21 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53da6801c6dso6454463e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 04:50:21 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd8cb7f00sm2023267e87.7.2024.11.27.04.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 04:50:20 -0800 (PST)
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
X-Inumbo-ID: 29e19c1b-acbe-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1sZjEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI5ZTE5YzFiLWFjYmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzExODIxLjkzNjI1OSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711821; x=1733316621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc9hH6WhqhqHo54EhAfa8e1CnnKH2P2ca7DkyeZFSPw=;
        b=PeR/TwUFh7EJ8vDpjg2fDy/I54/68TIH0amcTTta81sIkWtl1dSzbxVD70Sm2cmWCv
         WqTw6oy9bI7Mf7sk5N/7baeWV1viHOTssb4KM7kH4wDbCNSTDdsvPt36dE6lScAWJZbN
         tf7moN9xqIuLw/wDJmTcjwUDW5TGm8Onay//2/OhEvsuuYpaJjCrGngAGvEbItihz6Sm
         wkoNBMR96/7Y28oWMDpUNsP8YdcMQHUVl1weiRRKLbcodgylxI/l6iX+3uYaX8GMsMMW
         BCS4EJss9nyDtOHj6apNy1wbCoOw6G9KAdSM+uwlqriHxLyWkiPVwxhcLtbt0CJmcCDK
         hiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711821; x=1733316621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc9hH6WhqhqHo54EhAfa8e1CnnKH2P2ca7DkyeZFSPw=;
        b=hKz6yx0sxBBmCX1psqqYh3o1X1clbFIVIH9LYTpNd1ii/vnv67JYQ77JRia7K4hxDc
         syXBRrA//ht8gczBow6YPm0z29nMLVvqKHneYWLhERbuL5REiEAjiN45JDDCPs+YrRt3
         4nYTRZ/qBLL3zFvkhwgkoHr3JHKc8fYXO7UTCsHnulOXT1M1/ngecTs+R0rpIixHIVXm
         MzMGabCRKAkmR2icZLOdEXyHXpA5NYvgqlEu5f/5dBQGPO39NnLB0+CUGUjImsDdv+hq
         Fw3O4ZQgPvGjE0giiZyfakQ7d0hSIr9a9TZowh8pTql8thXS7oM7VAjky+i1gdb1FCn/
         QjaQ==
X-Gm-Message-State: AOJu0YyUhOx/PE9ZAaJKo8Fo8hkq/UfxlxbJYR3z88VbSyX4puM+s32k
	SpzQbi1j3K0o0l9QabTNeDobwkqajraHGqwo+P1iS4/SpBO0YuByeeM6aw==
X-Gm-Gg: ASbGnctGreru/Kb/2Eftw4L/pQXzOA4a8hkLFHoZCf+uiI7IIzW5tuEE10aM5kpEiXx
	kSAY6X4cVuDurAPCcymjfdAK9i49ZOZMLZf2sRQrN9IycnfdKOo9mm4bUdUSuYZMuh/erppO1hb
	I0RcjNAaIvg2YggjegkV4I1G9dpf9BGvuSeJrOFrEs3dMWDG7PAnCJOhEf/3WAQ17P5/4H8PPMc
	UQojI+s5iskUU/ZDIO+qoJjyR/OkSBwY2IE7Nl6xbrn2NgBKj8=
X-Google-Smtp-Source: AGHT+IFAwkiwdzMyqIaGjcrY2cTAISxO2+97YFmGMwN/UNjalYU5bAzGY8tqg/B6yYfsgukoOAM0dQ==
X-Received: by 2002:a05:6512:b8f:b0:53d:e52d:3373 with SMTP id 2adb3069b0e04-53df00ff242mr1685501e87.41.1732711820930;
        Wed, 27 Nov 2024 04:50:20 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 4/6] xen/riscv: introduce cache management operations (CMO)
Date: Wed, 27 Nov 2024 13:50:13 +0100
Message-ID: <1310a2fb3b9824ae66f850600925127fdfdb44fa.1732709650.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732709650.git.oleksii.kurochko@gmail.com>
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KConfig HAS_CMO is introduced to handle if the platform has CMO related
extenstions ( such as Zicbom, Zicboz, Zicbop etc ) or not.

if HAS_CMO isn't set stubs for clean_and_invalidate_dcache_va_range()
and clean_dcache_va_range() are implemented as just returning
-EOPNOTSUPP.

Our current platform is QEMU which doesn't model caches so it should be
fine to follow implementations when HAS_CMO isn't set.

invalidate_icache() is implemented using fence.i instruction as
mentioned in the unpriv spec:
  The FENCE.I instruction was designed to support a wide variety of
  implementations. A simple implementation can flush the local instruction
  cache and the instruction pipeline when the FENCE.I is executed.
  A more complex implementation might snoop the instruction (data) cache
  on every data (instruction) cache miss, or use an inclusive unified
  private L2 cache to invalidate lines from the primary instruction cache
  when they are being written by a local store instruction.
  If instruction and data caches are kept coherent in this way, or if the
  memory system consists of only uncached RAMs, then just the fetch pipeline
  needs to be flushed at a FENCE.I.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig            |  3 +++
 xen/arch/riscv/include/asm/page.h | 18 +++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 1858004676..4f1fcfd21a 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -14,6 +14,9 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config HAS_CMO # Cache Management Operations
+	bool
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index bf3f75e85d..0f297141d3 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,6 +7,7 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
+#include <xen/errno.h>
 #include <xen/types.h>
 
 #include <asm/atomic.h>
@@ -148,9 +149,24 @@ static inline bool pte_is_mapping(pte_t p)
     return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
 }
 
+#ifndef HAS_CMO
+static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+    return -EOPNOTSUPP;
+}
+#else
+int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size);
+int clean_dcache_va_range(const void *p, unsigned long size);
+#endif
+
 static inline void invalidate_icache(void)
 {
-    BUG_ON("unimplemented");
+    asm volatile ( "fence.i" ::: "memory" );
 }
 
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
-- 
2.47.0


