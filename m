Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8329B9D9B6B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 17:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843849.1259450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOj-0000yy-Hr; Tue, 26 Nov 2024 16:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843849.1259450; Tue, 26 Nov 2024 16:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOj-0000vR-Ae; Tue, 26 Nov 2024 16:26:45 +0000
Received: by outflank-mailman (input) for mailman id 843849;
 Tue, 26 Nov 2024 16:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J1p=SV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tFyOh-0000RU-F5
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 16:26:43 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 365d96fe-ac13-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 17:26:38 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ffa8092e34so53866071fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 08:26:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffaf7c0c9dsm15210421fa.87.2024.11.26.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 08:26:36 -0800 (PST)
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
X-Inumbo-ID: 365d96fe-ac13-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmUiLCJoZWxvIjoibWFpbC1sajEteDIyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM2NWQ5NmZlLWFjMTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjM4Mzk5LjAwMDM1Nywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638398; x=1733243198; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSAm2Q09kzTKY3MUbTZpmKeYeDJYD8uiVzRhU5eFlp0=;
        b=euG0KTQ4IlaZu9BC9Dk/xSoC76+qXyDvnELOHM0aVlWjtjNlSkfG//qArGalR248dV
         rOB3EdtrvJf5hikl4W6lzeZKXmlUL0pEjpWSpoUR0WXISbSCwM4G02sk/V7Zqs9+bl76
         CZnY9JHQygsox6Ha2QQy04FgGnGce0PY6UMQNg68PtM3+KyDZLm0YORRAi1ayn1Ey2hy
         lPy9kpJ7dCogNWdA+h6KRFruQ1vHvoL9LWV2HrwdUzolLQX04dYDEmupTi2mmbjpwh4t
         tkWCO7a9iP4pkziD7r7JpdDr4zyV+zAtVwD6BTjCtNDnzyvRbKmJQ8h/UUn5y0t4GwB8
         gEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638398; x=1733243198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSAm2Q09kzTKY3MUbTZpmKeYeDJYD8uiVzRhU5eFlp0=;
        b=GfpEc6gLBKmGvVbfylwmlV61zEqjYjcdRIi3rL0sG6uFZXfTqAhzsZvMMyn7aMTjqH
         ps14DvAhXpq7t9V5rm/SmdAuGiUQlkWO5hYGZ1hHPHXTdEmT5LLf4dmz+ptJV7zSTM4T
         vNgnJfc87L5tNNNSsIsPK1o5MJqEG4KXMbAQybvNF4Dusu1lFuA3/qW6aqdP5GD2KX4v
         rVCttRLML6hsVp1EIqCbu2xE0mvpvQ+5tIYpSORaWV6Vep/k2YFf0jUsP1sCNyiW7LF/
         /EtM7q7jB5vVobgE/7bVFjRABRKqFo/BnYG2NTb4weaNI+4GKyUEzdG36I2Z0sqxyb2N
         IEqg==
X-Gm-Message-State: AOJu0YwYHeqI73yjCYMGtmwUZ4J9I6++DstmoXwbPL7JMIh49XoJF7j9
	y5FE4cx7ywQArjJdjdxahEdFvAeWWk2aNKkVzlyKbhZ5jV+/mM3smiDHlA==
X-Gm-Gg: ASbGncszAjR/gPGa5lOBl2apmES8yZ3C+AQrA4QHjDibZz3WxjOhddbbIMlcPPCE4J4
	GMsvnCHqbmMXA2gRHmmC+52nAO5DczYjDANBwYJ9QgBVXyXHsXdyzs09Q7Fmz4AoxDiPlRKHRdj
	zm+nH0QHB3UIXYHRq9oODBMzR/pXTAUz7+bqfXOIZu2+5dUM8k8wv5wS5jQCHlI5NX9iIQyXQz6
	nsmoA1pqFtVH9K062L3aHgMAiMp50IuRf9rmEXZBW6rIrWkhCw=
X-Google-Smtp-Source: AGHT+IHPY7TCkLvC2URkmKA/ppO3WAaDmUtxJGu3Arf6JHd4j5Pp6wxauZob/VHBuXiP30YosWqsDw==
X-Received: by 2002:a2e:be83:0:b0:2ff:d2a9:23e6 with SMTP id 38308e7fff4ca-2ffd2a92585mr13804841fa.31.1732638396576;
        Tue, 26 Nov 2024 08:26:36 -0800 (PST)
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
Subject: [PATCH v7 2/3] xen/riscv: initialize the VMAP_DEFAULT virtual range
Date: Tue, 26 Nov 2024 17:26:31 +0100
Message-ID: <0a7ee643402e4ddcd26dfa6e37b101e08ef3c24f.1732637041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732637041.git.oleksii.kurochko@gmail.com>
References: <cover.1732637041.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call vm_init() to initialize the VMAP_DEFAULT virtual range.

To support this, introduce the populate_pt_range() and
arch_vmap_virt_end() functions, which are used by
vm_init()->vm_init_type().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V7:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/mm.c    | 11 +++++------
 xen/arch/riscv/pt.c    |  6 ++++++
 xen/arch/riscv/setup.c |  3 +++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 2db1193bac..9359dc7f33 100644
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
@@ -571,3 +565,8 @@ void __init setup_mm(void)
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


