Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA29C1D5A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 13:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832551.1247850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OT6-0004Ez-FL; Fri, 08 Nov 2024 12:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832551.1247850; Fri, 08 Nov 2024 12:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9OT6-00046Z-9c; Fri, 08 Nov 2024 12:52:04 +0000
Received: by outflank-mailman (input) for mailman id 832551;
 Fri, 08 Nov 2024 12:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwxj=SD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t9OT5-0003yG-7X
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 12:52:03 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ea36d03-9dd0-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 13:52:00 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539f0f9ee49so2345017e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 04:52:00 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff179d1cd3sm6441261fa.94.2024.11.08.04.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 04:51:58 -0800 (PST)
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
X-Inumbo-ID: 3ea36d03-9dd0-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1sZjEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNlYTM2ZDAzLTlkZDAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDcwMzIwLjg5MTc4NSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731070319; x=1731675119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ami57zT7BuXkngz26sixB7SwBQKxu3U75GI5FEiqX0=;
        b=MF20899FSvfF+yU27D/kaTZVYw1O0EpbWlyULKiHaPvtuKGqleW2D9FYt9ZA7t3dJ5
         4xRyNvYbztwFqSoThtvvPjPX6GDCF5ZedkCITtUlpTn05VAU9BRZAxMhDrcBwD1iW/Kh
         j+JRSrd3gbLUFTKytQamDGPSVLw9bvgmabgtflpg4myIvKHAyqsYGn/C1gZn4TCbpR4/
         5+JRDymg6N2XDtPRlfkz3KovN41ESsE9XdCMfYXmVVBHH329/gQQ/kCtl09T8rw6r1f7
         yeaw9tQhebDDW/sDVVVO56mSxiKAregMHIpJjXCuSVzRl0wwSqKqe+OhgDXO0plN2yvN
         4A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731070319; x=1731675119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ami57zT7BuXkngz26sixB7SwBQKxu3U75GI5FEiqX0=;
        b=Uyekj05zU+b8wTgEawY/RD+DUNSSksELhixT2GS95T6BkRJHm+OScCmzqEiTprQFgn
         5JG4QZsLGmWw6LSOeseLI+nZF6UOgaaO3FMzHUu+Kd/zsYaOqabFr5EEKUAY/OhNx3jU
         1aEBocyumQ1FIRuhRJjbN4pvXiBslt/mnInwIMHPxevxZmeM0fqMZotovq3oLRDo/3t+
         UO88pn7LQOPW9IGONNmS2IZSjYS26IGPmY6UA2DJjvuFZet//pZPldC7vLiQcgpNzBLo
         pb9PY/GpLQ9HfsngXO+S2rXSZRVXskYar4w016WCoStS+9EzXDW1LkhC6swZSaHVFh3O
         9XSw==
X-Gm-Message-State: AOJu0Yw7dF+cn3FH/E+3y+eDF9i4zmAbjhQC3+RUr8tWmhX4uKtduBSo
	KYxqTJrnlTbp2GT9qXDsDmT7gBox/279+OwvYrpam+nyoFUejab2RYU2TctR
X-Google-Smtp-Source: AGHT+IFMtYnrrkD2Afi+XtQiYMUbxSn96kIZ/NxIl5AtWnu8otOooMN5wQCMmSO5p4CvU9ye14YzGQ==
X-Received: by 2002:a05:651c:1589:b0:2fb:5bb8:7c24 with SMTP id 38308e7fff4ca-2ff20152825mr13961661fa.8.1731070319189;
        Fri, 08 Nov 2024 04:51:59 -0800 (PST)
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
Subject: [PATCH v4 2/3] xen/riscv: initialize the VMAP_DEFAULT virtual range
Date: Fri,  8 Nov 2024 13:51:53 +0100
Message-ID: <5b4a5eb30bd98c1f204def1c6ea131488a79b6cc.1731069334.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731069334.git.oleksii.kurochko@gmail.com>
References: <cover.1731069334.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call vm_init() to initialize the VMAP_DEFAULT virtual range.

To support this, introduce the populate_pt_range() and
arch_vmap_virt_end() functions, which are used by
vm_init()->vm_init_type().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V4:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/mm.c    | 11 +++++------
 xen/arch/riscv/pt.c    |  6 ++++++
 xen/arch/riscv/setup.c |  3 +++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 988673c313..14e6845c0d 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -351,12 +351,6 @@ void arch_dump_shared_mem_info(void)
     BUG_ON("unimplemented");
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
-
 int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
                               union add_to_physmap_extra extra,
                               unsigned long idx, gfn_t gfn)
@@ -566,3 +560,8 @@ void __init setup_mm(void)
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
 }
+
+void *__init arch_vmap_virt_end(void)
+{
+    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
+}
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index cc5e2d3266..d62aceb36c 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -1,6 +1,7 @@
 #include <xen/bug.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
@@ -419,3 +420,8 @@ int map_pages_to_xen(unsigned long virt,
 
     return pt_update(virt, mfn, nr_mfns, flags);
 }
+
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    return pt_update(virt, INVALID_MFN, nr_mfns, PTE_POPULATE);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 2887a18c0c..3652cb056d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
+#include <xen/vmap.h>
 
 #include <public/version.h>
 
@@ -62,6 +63,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     setup_mm();
 
+    vm_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


