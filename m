Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC379C44BF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834092.1249603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYyA-0008IB-F5; Mon, 11 Nov 2024 18:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834092.1249603; Mon, 11 Nov 2024 18:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYyA-0008G5-CD; Mon, 11 Nov 2024 18:16:58 +0000
Received: by outflank-mailman (input) for mailman id 834092;
 Mon, 11 Nov 2024 18:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dX8x=SG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tAYy8-0007n0-R1
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:16:56 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20f0707b-a059-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 19:16:53 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-539e59dadebso5719633e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 10:16:53 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d82689a79sm1633691e87.109.2024.11.11.10.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 10:16:48 -0800 (PST)
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
X-Inumbo-ID: 20f0707b-a059-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzMiLCJoZWxvIjoibWFpbC1sZjEteDEzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIwZjA3MDdiLWEwNTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzQ5MDEzLjgwODQ0LCJzZW5kZXIiOiJvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731349012; x=1731953812; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgqORlcpg64ySYXh6FxRpfRVBS9KMCCLF2MUu2biZLA=;
        b=g9B9BTDwtIW+oDi2iVirFl0VFf6FEKogZ9vnA6flUFzrgilMvG4j4w123BHODdajsp
         VOGTWV+O2amo0gDUFEyEiPrn6mTb7OxRE2Bp7/eLbjVFxEJwLA+7lpv2AJnsiRp+Nq27
         U7taX9BvZjxRBhQeCmQvoqKbUjAC+G72of4o845dw8VPHmDgQDh1G3oXILndmT6ThQtG
         9C7HBWmnbnll6nPjwjNR5M7izWEnJEvm8FUhjoosmwLaqmAAoT9joiQeRSt1VF/1XzE6
         ObDBNH+jz8E0g6bvo8tnqjd9QakE7aFE2TLGGvLmyaTU4qFmgXRuvjGh0DXCK4kWbVss
         laqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731349012; x=1731953812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgqORlcpg64ySYXh6FxRpfRVBS9KMCCLF2MUu2biZLA=;
        b=VXIDK6dqnyIcx4rTOP4LvE8yIZkmV6UAmb8dqj4uD5PuYrAKZRVcykvLcfMwSIphG5
         YTP/9XG9fe95VXiW3jN+etIUASXwW++V40H+vf7bSl8/0h61f1UHca+BkD34WBNGF8Is
         7y32NX9N12Uiio0uMV6ZXONVYj5ix3i5mDoH7sn+s/MOpu9XCUMKafGI/WV2sbUW0yyw
         B88WxKA2vVrt9lgQfS82Ax/l0OQPQUn2YgmZ4MNTZm8hEnCVUYuU0sTC+KRuU25e11aa
         X3ndb367vnNb4z9xTQlcIeVGzWkhc3OTcAKNiXneNxqjBUtA8hUbzxsXzGPtBj+MNZ2D
         LDzQ==
X-Gm-Message-State: AOJu0YxGi4YSWkUepTWjJX/5QnvlLxa+POfnYWSnXtjEQYtXpJHXqOzK
	9spkt/12omJHfPE4XomKHRSHwF7TVE0fK+uGguGSMEZWO1ZvOYK8aUxRLg==
X-Google-Smtp-Source: AGHT+IG5zqhURoni7z1+5HRgpM1aVCVgRw5ZCUFcOdV/hT1nbctoAPkaSZoTdEIyYL5wI/wWZA+KkQ==
X-Received: by 2002:a05:6512:3084:b0:539:e110:4d72 with SMTP id 2adb3069b0e04-53d862f381dmr5959400e87.56.1731349011743;
        Mon, 11 Nov 2024 10:16:51 -0800 (PST)
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
Subject: [PATCH v5 2/3] xen/riscv: initialize the VMAP_DEFAULT virtual range
Date: Mon, 11 Nov 2024 19:16:43 +0100
Message-ID: <efc4aaf6345678543cddfb1dcbd6e001c062a868.1731344883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731344883.git.oleksii.kurochko@gmail.com>
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call vm_init() to initialize the VMAP_DEFAULT virtual range.

To support this, introduce the populate_pt_range() and
arch_vmap_virt_end() functions, which are used by
vm_init()->vm_init_type().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V5:
 - Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/mm.c    | 11 +++++------
 xen/arch/riscv/pt.c    |  6 ++++++
 xen/arch/riscv/setup.c |  3 +++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 0d2c352696..a282b363a4 100644
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
@@ -573,3 +567,8 @@ void __init setup_mm(void)
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


