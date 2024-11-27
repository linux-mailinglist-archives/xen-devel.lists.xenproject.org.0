Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58A09DA814
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 13:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844756.1260313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHV1-0006Bu-U2; Wed, 27 Nov 2024 12:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844756.1260313; Wed, 27 Nov 2024 12:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGHV1-00069G-QE; Wed, 27 Nov 2024 12:50:31 +0000
Received: by outflank-mailman (input) for mailman id 844756;
 Wed, 27 Nov 2024 12:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pugq=SW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tGHUz-0004Yu-Sq
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 12:50:29 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a4e90cb-acbe-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 13:50:22 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53ded167ae3so2115686e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 04:50:22 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd8cb7f00sm2023267e87.7.2024.11.27.04.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 04:50:21 -0800 (PST)
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
X-Inumbo-ID: 2a4e90cb-acbe-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJhNGU5MGNiLWFjYmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzExODIyLjY1NTcxOSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732711822; x=1733316622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXt3gxcLfSewdGxxgtLt+uhH1+qMZe5HJDTdu4QBaWc=;
        b=Y4vys3ZzsxfNINTzYCENgnfx209sUtvXiGhtLGMZOU7ROySiZqqOwrLThmmS2y7rA+
         fTXTxQN2ckdVe9te9SWbQl2X9cvWb8LTSW+dUMEnZgzmm+/BuVhomVzJhzJD6czbCohl
         hkk+1jzJgvAwtTkGdma+kUDW3XotqIbHz6b2oSmCLElQAstM0JQ2lXu5cQEyF0d/z0XO
         5nc5tdlcF/B7N/I4Dw6VPJR2tKnsIJruU2n3BzHgjN1SpD9SrToE+z2ktOKUGkYlTncU
         s8OHcfaINfr+pSK9fB6U960YeJBhVnOaDxM96+4DqG2ZUl0RDrgNovdqHdCxhICwEwxZ
         I+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711822; x=1733316622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXt3gxcLfSewdGxxgtLt+uhH1+qMZe5HJDTdu4QBaWc=;
        b=lnDq8mBIUmbwQwJt2l75zQkdjtxk8y+6YI2KlCtc6Ssu4E9CIjXShtiex6Bwk0DArn
         vLu+/RnoAzHDPJk1Du4WQ/lV5+Akva3T2m7MMsZEHcxX/6dJ6+7NGFWtZ79ksjt2aDr1
         0nW7Z0qOVsW57Ul5IHMrsyotMum0fRkRyI+ZL5rjMrmtznSRoi4XVjRUq7Ah33NmVRtF
         gJlDap8OMwKFiliMTUpInTzgFa3/SGepAS4tB4WiDQog1/laqvLESpnBFbe83XJLe93B
         Eop14aAG5+uDQhV3Ab9PGBrqYR96cQOlwWnmff6UpZYd431jtnDZh7BI9xzmmD0e6rZ/
         FmPA==
X-Gm-Message-State: AOJu0YyxpjnlskMODLKkLAkX8BYJwbuwLhu/G0ahut4kw+O+Wu1eKTyc
	jkPYdfExd5JC9nCJefTobil/wpFbiuJQh95LhVY8ZvlET3OpH37BWjukTA==
X-Gm-Gg: ASbGncv51+jbdBa4N6/jV27R/0N/321b3orGGcKmOvW6zJPKQ9gT1SpMW+9UtIrr656
	WG5R7/eS1ByEmwlDYgFs0tnIsFoupmaCKYLoCcppSjdUFouQU+On/DvQ12dsCYTrmmqXmPUNQVi
	ksn4zPK8K/iLydyuI2VtoNzA9iY6YZPbN/B2gFT/vr4ACworssjs0IhRqzLr1CT5yR9WWV5E62+
	mnERMXTBassW3NC5X+GTpdqFDDcPneJarN4xFeeyts12GkNCIw=
X-Google-Smtp-Source: AGHT+IESECb2bmfgazPXddPxX+IKMj6wv/oqPxGegKktP50aiHa41a3AflK1U38r/m44ekdyq1RshA==
X-Received: by 2002:a05:6512:b14:b0:53d:ecf2:3347 with SMTP id 2adb3069b0e04-53df00d1b4emr1395380e87.21.1732711821608;
        Wed, 27 Nov 2024 04:50:21 -0800 (PST)
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
Subject: [PATCH v1 5/6] xen/riscv: implement relocate_fdt()
Date: Wed, 27 Nov 2024 13:50:14 +0100
Message-ID: <c157b03a8cb6d9c4910136b5d73260b47c55554e.1732709650.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732709650.git.oleksii.kurochko@gmail.com>
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

relocate_fdt() relocates FDT to Xen heap instead of using early mapping
as it is expected that discard_initial_modules() ( is supposed to call
in the future ) discards the FDT boot module and remove_early_mappings()
destroys the early mapping.

To implement that the following things are introduced as they are called
by internals of xmalloc_bytes() which is used in relocate_fdt():
1. As RISC-V may have non-coherent access for RAM ( f.e., in case
   of non-coherent IO devices ) flush_page_to_ram() is implemented
   to ensure that cache and RAM are consistent for such platforms.
2. copy_from_paddr() to copy FDT from a physical address to allocated
   by xmalloc_bytes() in Xen heap.
3. virt_to_page() to convert virtual address to page. Also introduce
   directmap_virt_end to check that VA argument of virt_to_page() is
   inside directmap region.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/mm.h   | 10 ++++++--
 xen/arch/riscv/include/asm/page.h | 10 ++++++--
 xen/arch/riscv/mm.c               |  3 +++
 xen/arch/riscv/setup.c            | 41 +++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 699ed23f0d..25fd38531f 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -8,11 +8,13 @@
 #include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
+#include <xen/pfn.h>
 #include <xen/types.h>
 
 #include <asm/page-bits.h>
 
 extern vaddr_t directmap_virt_start;
+extern vaddr_t directmap_virt_end;
 
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
@@ -148,8 +150,12 @@ static inline void *page_to_virt(const struct page_info *pg)
 /* Convert between Xen-heap virtual addresses and page-info structures. */
 static inline struct page_info *virt_to_page(const void *v)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    unsigned long va = (unsigned long)v;
+
+    ASSERT(va >= DIRECTMAP_VIRT_START);
+    ASSERT(va <= directmap_virt_end);
+
+    return frametable_virt_start + PFN_DOWN(va - directmap_virt_start);
 }
 
 /*
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 0f297141d3..c245a4273f 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,6 +7,7 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
+#include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/types.h>
 
@@ -172,10 +173,15 @@ static inline void invalidate_icache(void)
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
-/* TODO: Flush the dcache for an entire page. */
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
-    BUG_ON("unimplemented");
+    void *v = map_domain_page(_mfn(mfn));
+
+    clean_and_invalidate_dcache_va_range(v, PAGE_SIZE);
+    unmap_domain_page(v);
+
+    if ( sync_icache )
+        invalidate_icache();
 }
 
 /* Write a pagetable entry. */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index f2bf279bac..c614d547a6 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -419,6 +419,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 }
 
 vaddr_t __ro_after_init directmap_virt_start = DIRECTMAP_VIRT_START;
+vaddr_t __ro_after_init directmap_virt_end;
 
 struct page_info *__ro_after_init frametable_virt_start = frame_table;
 
@@ -556,6 +557,8 @@ void __init setup_mm(void)
         setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
     }
 
+    directmap_virt_end = directmap_virt_start + ram_end - 1;
+
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
 }
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9680332fee..ff667260ec 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/fixmap.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
@@ -26,6 +27,46 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+/**
+ * copy_from_paddr - copy data from a physical address
+ * @dst: destination virtual address
+ * @paddr: source physical address
+ * @len: length to copy
+ */
+void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
+{
+    void *src = (void *)FIXMAP_ADDR(FIX_MISC);
+
+    while (len) {
+        unsigned long l, s;
+
+        s = paddr & (PAGE_SIZE - 1);
+        l = min(PAGE_SIZE - s, len);
+
+        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
+        memcpy(dst, src + s, l);
+        clean_dcache_va_range(dst, l);
+        clear_fixmap(FIX_MISC);
+
+        paddr += l;
+        dst += l;
+        len -= l;
+    }
+}
+
+/* Relocate the FDT in Xen heap */
+static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
+{
+    void *fdt = xmalloc_bytes(dtb_size);
+
+    if ( !fdt )
+        panic("Unable to allocate memory for relocating the Device-Tree.\n");
+
+    copy_from_paddr(fdt, dtb_paddr, dtb_size);
+
+    return fdt;
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
-- 
2.47.0


