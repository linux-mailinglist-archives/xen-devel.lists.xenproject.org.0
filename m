Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FABA9DA813
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844753.1260282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUw-0005I8-UR; Wed, 27 Nov 2024 12:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844753.1260282; Wed, 27 Nov 2024 12:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHUw-0005Fd-RL; Wed, 27 Nov 2024 12:50:26 +0000
Received: by outflank-mailman (input) for mailman id 844753;
 Wed, 27 Nov 2024 12:50:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHUv-0004Yj-DE
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 12:50:25 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa996f1-acbe-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 13:50:23 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ffbf4580cbso37749101fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 04:50:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd8cb7f00sm2023267e87.7.2024.11.27.04.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 04:50:22 -0800 (PST)
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
X-Inumbo-ID: 2aa996f1-acbe-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzAiLCJoZWxvIjoibWFpbC1sajEteDIzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJhYTk5NmYxLWFjYmUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzExODIzLjMxMTE4Mywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711822; x=1733316622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vrv773z0JqGv9oIsUDba+C5p6taAtv0iDKAnsKPcYoI=;
        b=LhytWryzAi2z1mUniaSy5r+NVQN3dgrEseq6ovCbxxAtW+jbEr/MYzBmHN5G6Orcdm
         bxGxB8NHvjx5QKioCTGPolYd346qz9fRON0tAAkAaPjzyQki6w6A0XqlUPAjTRIHNC+n
         dUFXy6PxiIMV3AKIduIx2t1t4E955jJuiRA19F1wqtJtcLBqw+Or+pWpcelDOkuuQA/h
         0EYT6TTLT6+BFPnK6kFpKa0eMt9+FdSJatAb+skQxUenE7s14JJBUzuTUINVaekXO3WH
         ROX/6iz5zY/GZAz8Zj4IaLbblAGd1INo8BphaTvCexypyyfmAya7GztzlCbD6a/9c+hz
         KkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711822; x=1733316622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vrv773z0JqGv9oIsUDba+C5p6taAtv0iDKAnsKPcYoI=;
        b=I0ArdO0VOUbE26nZe0rtwpaycu76TWfzYPL9PRYUS3wPgZMSmeVLsn5xUmYbl0C4m7
         wbRrf1rxPIi8XQXvnrAvsRYFPQ7Aq5ouuyYuJdRjbtQRk62IlFIUY44OiaajrtCi2WMI
         T98U/HrilazIbJKGr17ZtQNjxIvGSS7z88AsVZqMPSZr80O5D0tUJ9HXRO2b6vldD3iz
         yRXgWWOpP3ir5fPHt1n+c9cy04A8b5vThU/1buO5aQ1l+cfwCdcOR/EsAsbVu6IyUbD7
         oZscNepn2ckEa7vJzgY0Y+C/k1oxSfo2GNGNxgX+jEI7yzJxhwaETPndLL7OC6VVbemy
         xKeQ==
X-Gm-Message-State: AOJu0YyfbJi12W1Li88QpKJqVh9aZrhMVRQvN02pard87n1hU7qvi8Yu
	Nt6vG6t7/V+UC5RQpSsn+k7iomxOIF/JBy3fEhNb2FnFb3+p999MCbxJLw==
X-Gm-Gg: ASbGncszydlCWDVprCKThX4BYxXV5xBL74VCBF15oO8FVuD0fMdi7/Ou14j8xv6Dt32
	YIFIh5sDniL2KJTnhqv/+Kl0HMnnwdu9EtYqB+DIJJuXrPixS9jaPrEsjs/zaqsOMoIme1ljmYz
	pr2EkKLsV7mm/f9KolAs0/7C4QPDHhC3IGyc0fBVnswOSgAOW6msS95e2b7zBt8z50/hmPMO8fd
	0eMjvji+lagoY1+92+hJFnrUSDq+wobOzWnyRelJp2zi5/P8IM=
X-Google-Smtp-Source: AGHT+IE9bfCGlBS0Z97uejBtcSyuwPDsOaYmpPjkGjm194/zDDwgrAHW3K9bwnEofHxmK3t4h5eLeg==
X-Received: by 2002:a05:6512:238c:b0:53c:759f:3b71 with SMTP id 2adb3069b0e04-53df00d9d87mr1397415e87.31.1732711822276;
        Wed, 27 Nov 2024 04:50:22 -0800 (PST)
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
Subject: [PATCH v1 6/6] xen/riscv: relocating and unflattening host device tree
Date: Wed, 27 Nov 2024 13:50:15 +0100
Message-ID: <f2b1b8b4d80d6b2ccc846ae7171a316a9b46ac56.1732709650.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732709650.git.oleksii.kurochko@gmail.com>
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relocate FDT to Xen heap instead of using early mapping as it is
expected that discard_initial_modules() ( is supposed to call in
the future ) discards the FDT boot module and remove_early_mappings()
destroys the early mapping.

Unflatten a device tree, creating the tree of struct device_node.
It also fills the "name" and "type" pointers of the nodes so the normal
device-tree walking functions can be used.

Set device_tree_flattened to NULL in the case when acpi_disabled is
equal to false.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index ff667260ec..41826f77fb 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/bootfdt.h>
 #include <xen/compile.h>
@@ -71,6 +72,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
     const char *cmdline;
+    size_t fdt_size;
 
     remove_identity_mapping();
 
@@ -95,7 +97,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
                           _end - _start, false) )
         panic("Failed to add BOOTMOD_XEN\n");
 
-    if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
+    if ( !(fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr)) )
         BUG();
 
     cmdline = boot_fdt_cmdline(device_tree_flattened);
@@ -114,6 +116,18 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
      */
     system_state = SYS_STATE_boot;
 
+    if ( acpi_disabled )
+    {
+        printk("Booting using Device Tree\n");
+        device_tree_flattened = relocate_fdt(dtb_addr, fdt_size);
+        dt_unflatten_host_device_tree();
+    }
+    else
+    {
+        device_tree_flattened = NULL;
+        panic("Booting using ACPI isn't supported\n");
+    }
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


