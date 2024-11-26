Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE59D9B69
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 17:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843848.1259445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOj-0000vP-92; Tue, 26 Nov 2024 16:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843848.1259445; Tue, 26 Nov 2024 16:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOj-0000u3-3U; Tue, 26 Nov 2024 16:26:45 +0000
Received: by outflank-mailman (input) for mailman id 843848;
 Tue, 26 Nov 2024 16:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J1p=SV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tFyOh-0000RJ-5n
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 16:26:43 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35344196-ac13-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 17:26:37 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ffbfee94d7so25289671fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 08:26:36 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffaf7c0c9dsm15210421fa.87.2024.11.26.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 08:26:35 -0800 (PST)
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
X-Inumbo-ID: 35344196-ac13-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzMiLCJoZWxvIjoibWFpbC1sajEteDIzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM1MzQ0MTk2LWFjMTMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjM4Mzk3Ljc4MzM0Miwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638396; x=1733243196; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZITMbzFrGo2x+LsolU+1AN80rXxP+fWaE9tn0HZn6c=;
        b=R5yqqWtaRudSSyxgsGn21vu4cJLEBLm78uCtF3c543YG+lJ6brQqyL+GEZVqMeIrG0
         4qB5w4GAmJuahd2gMUm7qHmFkEsMxWYL+YY40Cmuizsc39omlyrB2kRcxgModlN5/KeL
         SGBpVglI27iuiUkEaDfePO+fQY3ETU352T0iRGoL1hRYhyZajEcurkGBWIGHZl/n+Z2Q
         XryXlj+RdNXUfDOtq2D7XK9QStPEI+3RimhZkgZE9j4TBzulY61EnHHtdj87PldAB3I/
         +oK99htSqPvyVMRXDCTdSIZ8YmcbW5hLGSRS2YwNm925+YeEo3PrO4y/M2fdfWwSGlek
         JhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638396; x=1733243196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZITMbzFrGo2x+LsolU+1AN80rXxP+fWaE9tn0HZn6c=;
        b=k+25mizSHEOiqaOYcmZdhcR624w2NzLqmBobZDfR1lSqg5pgnQ3QAx3mPJSqiSaw8y
         FgTSrmeZ9DRnFsPLDI87jXE+O6MBF4eVw7jx4BfJ71wBQ+O+WJKcIDp4qIfTmv2+vR/b
         Dg7kroKD+wJsz21yNvq6qRf8HRgIaqieZHAZMnBIxG6cYqyJ5UIWqP/YaGuPeKZrb+ZW
         mR4C8ffBuV82jF5fL8WkhtXDJMNnaZuokzAiowsc1whAIrXLdo7JhYwC4Lp6aCYQG+2N
         rgRhwcMx9urt+nZ/wzMw61Z4UHtndmSW3SGi4PEYVL8CqLb7ueqBI74EVjjHTv53EbZ0
         3jsg==
X-Gm-Message-State: AOJu0YyyepDUtCVTlqeFqtpGfFSszNSdoyFg6oxFNpKIbBht9YDlT6Xi
	0tOCub1toYomHk9v/5MLNIQfiLTLu5t+abwnYozfTOkUCLuBMMYBY31uqA==
X-Gm-Gg: ASbGnctXITfVYGP4RNLM78fGEShHd4RNTvbRuiuBLbh+mjPuHlntxnN0qAPQwfax6HA
	SxiiIA1uO73d+XC9db/OBc2XawzQqs++fioRpjiY0gac4WiZTvh2Td3T/4yC++4rxkwNzhvu6B2
	h6EeDI/VzmsT8Xm9woTl8VcCu3qibcnGMDqtdVtPeh1BbojQKwgyIF8X/i99gy8g3BfP/RdrRSt
	PssPCaxV2iN1VVrBHv1OxRCebp6mgiI0zYX0xYsdcoZ3m8p/GM=
X-Google-Smtp-Source: AGHT+IFWAWY1WIHzuD54kLwKxLAOyWVxeWxaJwWDz8EQeex/sMwoqGct0Grcc/Vz4+Cgdugk362/0Q==
X-Received: by 2002:a05:651c:1587:b0:2ff:c3a2:f408 with SMTP id 38308e7fff4ca-2ffc3a2fa61mr37888971fa.12.1732638395832;
        Tue, 26 Nov 2024 08:26:35 -0800 (PST)
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
Subject: [PATCH v7 1/3] xen/riscv: introduce setup_mm()
Date: Tue, 26 Nov 2024 17:26:30 +0100
Message-ID: <d5f3f3deeeafc8a35ec6ffdece3bdd3cc09ff30d.1732637041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732637041.git.oleksii.kurochko@gmail.com>
References: <cover.1732637041.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the implementation of setup_mm(), which includes:
1. Adding all free regions to the boot allocator, as memory is needed
   to allocate page tables used for frame table mapping.
2. Calculating RAM size and the RAM end address.
3. Setting up direct map mappings from each RAM bank and initialize
   directmap_virt_start to keep simple VA <-> PA translation and if
   RAM_start isn't properly aligned then add an additional alignment
   to directmap_virt_start to be properly aligned with RAM
   start to use more superpages to reduce pressure on the TLB.
4. Setting up frame table mappings for range [ram_start, ram_end)
   and initialize properly frametable_virt_start to have simplified
   version of mfn_to_page() and page_to_mfn().
5. Setting up max_page.

Introduce DIRECTMAP_VIRT_END to have a convient way to do some basic
checks of address ranges.

Based on the memory layout mentioned in config.h, DIRECTMAP_SIZE is
expected to be inclusive, i.e., [DIRECTMAP_VIRT_START, DIRECTMAP_VIRT_END].
Therefore, DIRECTMAP_SIZE is updated to reflect this.

Update virt_to_maddr() to use introduced directmap_virt_start and newly
introduced DIRECTMAP_VIRT_END.

Implement maddr_to_virt() function to convert a machine address
to a virtual address. This function is specifically designed to be used
only for the DIRECTMAP region, so a check has been added to ensure that
the address does not exceed DIRECTMAP_VIRT_END.

After the introduction of maddr_to_virt() the following linkage error starts
to occur and to avoid it share_xen_page_with_guest() stub is added:
  riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
  /build/xen/common/tasklet.c:176: undefined reference to
     `share_xen_page_with_guest'
  riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `share_xen_page_with_guest'
    isn't defined riscv64-linux-gnu-ld: final link failed: bad value

Despite the linkger fingering tasklet.c, it's trace.o which has the undefined
refenrece:
  $ find . -name \*.o | while read F; do nm $F | grep share_xen_page_with_guest &&
    echo $F; done
                     U share_xen_page_with_guest
    ./xen/common/built_in.o
                     U share_xen_page_with_guest
    ./xen/common/trace.o
                     U share_xen_page_with_guest
    ./xen/prelink.o

Looking at trace.i, there is call of share_xen_page_with_guest() but in case of
when maddr_to_virt() is defined as stub ("BUG_ON(); return NULL;") DCE happens and
the code is just eliminated.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V7:
 - Refactor maddr_to_virt() to simplify ASSERTS.
 - Merge to ASSERTS into one.
 - Update the commit message.
 - Update DIRECTMAP_SIZE to be inclusive.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
 - introduce DIRECTMAP_VIRT_END and use it in maddr_to_virt()
   and virt_to_maddr().
 - Update ASSERTs in maddr_to_virt() to properly varify that
   expected range for passed ma.
 - Drop the check of re-entrance of setup_frametable_mappings().
 - Update the comment above setup_frametable_mappings(): add a comment that it
   is expected to be called only once.
 - Use PFN_DOWN(frametable_size) instead of open-code:
   frametable_size >> PAGE_SHIFT.
 - Add panic() for a check that banks->nr_banks isn't 0 in setup_mm().
 - Update the comment above setup_mm(): update information about frametable as
   it isn't mapped from 0 by default.
 - Update the commit message.
---
Changes in V5:
 - correct the if-condition in virt_to_maddr():
     directmap_virt_start -> DIRECTMAP_VIRT_START
   as `va` argument of virt_to_maddr() is DIRECTMAP_VIRT_START-relative.
 - add initializer to definition/declaration of frametable_virt_start.
 - setup_frametable_mappings() update:
   - add check that setup_frametable_mappings() is called once.
   - add staic variable frametable_mfn_start inside setup_frametable_mappings()
     to handle the case when setup_frametable_mappings() is called more then
     once.
 - setup_directmap_mappings():
   - Update initialization of directmap_virt_start when setup_directmap_mappings()
     is called for the first time.
   - Introduce local variable "mfn_t base_mfn_t = _mfn(base_mfn);" to have
     less mfn_x(...) in the code.
   - Add logging of error code of map_pages_to_xen().
 - Drop ram_size variable in setup_mm() as there is no users of it.
---
Change in V4:
 - s/heap/directmap in log message in setup_directmap_mappings().
 - drop local variable total_pages in setup_mm() as it is not used.
 - call setup_frametable_mappings() for [ram_start,ram_end) range.
 - setup_frametable_mappings(ps, pe):
   - update initialization ( validation/invalidation ) of frame table.
   - add and initialize frameframetable_virt_start variable to cover
     the case that ps ( RAM start ) could be not eqaul 0 so the proper
     calculations are needed in mfn_to_page() and page_to_mfn().
 - setup_directmap_mapping():
   - update the value of directmap_virt_start: add an alignment to the size
     of HYP_PT_ROOT_LEVEL to have proper alignment so more superpages will be
     used for mapping.
   - re-use indirectly directmap_virt_start ( by using mfn_to_virt(base_mfn) )
     during mapping of directmap region for RAM bank to not face an issue with
     possible mapping overlapping during the 2nd invocation of
     setup_directmap_mapping().
 - Update the commit message.
---
Changes in V3:
  - Update the comment the part where DCE should be mentioned and directmap-related
    things are touched.
  - Move ROUNDDOWN to <xen/macros.h>.
  - s/sizeof(struct page_info)/sizeof(*frame_table) in setup_frametable_mapping().
  - Updates in setup_frametable_mapping():
    - align phys_start (ps) up to a page boundary and align phys_end (pe) down
      to a page boundary.
    - Update panic message.
    - Add the comment about alignment of frametable_size and base_mfn.
    - invalidate all frame_table entries and then just init with 0 only valid ones.
  - Double blank lines removing.
  - Initialize directmap_virt_start with DIRECTMAP_VIRT_START.
  - Updates in setup_directmap_mapping():
    - Drop local variable rc as it is used only once.
    - Move directmap_mfn_start definition to setup_directmap_mapping() and
      change __ro_after_init to __initdata.
    - Update the commit message about alignment of directmap_virt_start.
    - Move down directmap_virt_start for (base_addr & ~XEN_PT_LEVEL_SIZE(HYP_PT_ROOT_LEVEL))
      to not waste a lot of directmap space.
    - Map DIRECTMAP_VIRT_START + (base_addr & XEN_PT_LEVEL_SIZE(HYP_PT_ROOT_LEVEL))
      to _mfn(base_mfn).
    - Add log of the range in case directmap mapping failure.
  - Drop XENHEAP_VIRT_START and use directmap_virt_start instead.
  - Update the comment above setup_mm().
  - Update the calculation of bank_start and bank_end in setup_mm() to cover
    the case when a bank doesn't cover full pages.
  - Move share_xen_page_with_guest() to riscv/mm.c instead of riscv/stub.c.
  - Drop inclusion of <xen/pdx.h> in riscv/mm.c as thery is nothing used
    anymore in riscv/mm.c.
  - Move variable directmap_virt_start and setup_mm() outside
    #ifndef CONFIG_RISCV_32 ... #endif as they are likely to be common.
---
 Changes in V2:
  - merge patch 2 ( xen/riscv: implement maddr_to_virt() ) to the current one
    as maddr_to_virt() started to use the thing which are introduced in the
    current patch.
  - merge with patch 1 ( xen/riscv: add stub for share_xen_page_with_guest() )
    as this linkage issue happens during introduction of maddr_to_virt().
  - use mathematical range expressions for log messages.
  - calculate properly amount of mfns in setup_frametable_mapping() taking into
    account that ps and pe can be not properly aligned.
  - drop full stop at the end of debug message.
  - use PFN_DOWN(framsetable_size) instead of frametable_size >> PAGE_SHIFT.
  - round down ram_size when it is being accumulated in setup_mm() to guarantee
    that banks can never have partial pages at their start/end.
  - call setup_directmap_mappings() only for ram bank regions instead of
    mapping [0, ram_end] region.
  - drop directmap_virt_end for now as it isn't used at the moment.
  - update the commit message.
---
 xen/arch/riscv/include/asm/config.h |   3 +-
 xen/arch/riscv/include/asm/mm.h     |  19 ++--
 xen/arch/riscv/include/asm/setup.h  |   2 +
 xen/arch/riscv/mm.c                 | 148 ++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |   3 +
 xen/include/xen/macros.h            |   1 +
 6 files changed, 169 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index ad75871283..4954677aff 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -89,7 +89,8 @@
 #define DIRECTMAP_SLOT_END      509
 #define DIRECTMAP_SLOT_START    200
 #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
-#define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) - SLOTN(DIRECTMAP_SLOT_START))
+#define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END + 1) - SLOTN(DIRECTMAP_SLOT_START))
+#define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
 
 #define FRAMETABLE_SCALE_FACTOR  (PAGE_SIZE/sizeof(struct page_info))
 #define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) / FRAMETABLE_SCALE_FACTOR) + 1)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index ebb142502e..699ed23f0d 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,8 @@
 
 #include <asm/page-bits.h>
 
+extern vaddr_t directmap_virt_start;
+
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
 
@@ -25,8 +27,11 @@
 
 static inline void *maddr_to_virt(paddr_t ma)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    unsigned long va = directmap_virt_start + maddr_to_directmapoff(ma);
+
+    ASSERT((va >= DIRECTMAP_VIRT_START) && (va <= DIRECTMAP_VIRT_END));
+
+    return (void *)va;
 }
 
 /*
@@ -38,8 +43,8 @@ static inline void *maddr_to_virt(paddr_t ma)
 static inline unsigned long virt_to_maddr(unsigned long va)
 {
     if ((va >= DIRECTMAP_VIRT_START) &&
-        (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
-        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
+        (va <= DIRECTMAP_VIRT_END))
+        return directmapoff_to_maddr(va - directmap_virt_start);
 
     BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
     ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
@@ -127,11 +132,13 @@ struct page_info
     };
 };
 
+extern struct page_info *frametable_virt_start;
+
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 
 /* Convert between machine frame numbers and page-info structures. */
-#define mfn_to_page(mfn)    (frame_table + mfn_x(mfn))
-#define page_to_mfn(pg)     _mfn((pg) - frame_table)
+#define mfn_to_page(mfn)    (frametable_virt_start + mfn_x(mfn))
+#define page_to_mfn(pg)     _mfn((pg) - frametable_virt_start)
 
 static inline void *page_to_virt(const struct page_info *pg)
 {
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index c0214a9bf2..844a2f0ef1 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,6 +5,8 @@
 
 #define max_init_domid (0)
 
+void setup_mm(void);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 27026d803b..2db1193bac 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -372,6 +372,12 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return -1;
 }
 
+void share_xen_page_with_guest(struct page_info *page, struct domain *d,
+                               enum XENSHARE_flags flags)
+{
+    BUG_ON("unimplemented");
+}
+
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
     /* We are using 2MB superpage for mapping the FDT */
@@ -423,3 +429,145 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
     return fdt_virt;
 }
+
+vaddr_t __ro_after_init directmap_virt_start = DIRECTMAP_VIRT_START;
+
+struct page_info *__ro_after_init frametable_virt_start = frame_table;
+
+#ifndef CONFIG_RISCV_32
+
+/*
+ * Map a frame table to cover physical addresses ps through pe.
+ * This function is expected to be called only once.
+ */
+static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
+    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
+    unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
+    unsigned long frametable_size = nr_mfns * sizeof(*frame_table);
+    mfn_t base_mfn;
+
+    frametable_virt_start -= paddr_to_pfn(aligned_ps);
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover [%#"PRIpaddr", %#"PRIpaddr")\n",
+              ps, pe);
+
+    /*
+     * align base_mfn and frametable_size to MB(2) to have superpage mapping
+     * in map_pages_to_xen()
+     */
+    frametable_size = ROUNDUP(frametable_size, MB(2));
+    base_mfn = alloc_boot_pages(PFN_DOWN(frametable_size), PFN_DOWN(MB(2)));
+
+    if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
+                          PFN_DOWN(frametable_size),
+                          PAGE_HYPERVISOR_RW) )
+        panic("frametable mappings failed: %#lx -> %#lx\n",
+              FRAMETABLE_VIRT_START, mfn_x(base_mfn));
+
+    memset(&frame_table[0], 0, nr_mfns * sizeof(*frame_table));
+    memset(&frame_table[nr_mfns], -1,
+           frametable_size - (nr_mfns * sizeof(*frame_table)));
+}
+
+/* Map the region in the directmap area. */
+static void __init setup_directmap_mappings(unsigned long base_mfn,
+                                            unsigned long nr_mfns)
+{
+    static mfn_t __initdata directmap_mfn_start = INVALID_MFN_INITIALIZER;
+
+    mfn_t base_mfn_t = _mfn(base_mfn);
+    unsigned long base_addr = mfn_to_maddr(base_mfn_t);
+    unsigned long high_bits_mask = XEN_PT_LEVEL_MAP_MASK(HYP_PT_ROOT_LEVEL);
+    int res;
+
+    /* First call sets the directmap physical and virtual offset. */
+    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
+    {
+        directmap_mfn_start = base_mfn_t;
+
+       /*
+        * The base address may not be aligned to the second level
+        * size in case of Sv39 (e.g. 1GB when using 4KB pages).
+        * This would prevent superpage mappings for all the regions
+        * because the virtual address and machine address should
+        * both be suitably aligned.
+        *
+        * Prevent that by offsetting the start of the directmap virtual
+        * address.
+        */
+        directmap_virt_start -= (base_addr & high_bits_mask);
+    }
+
+    if ( base_mfn < mfn_x(directmap_mfn_start) )
+        panic("can't add directmap mapping at %#lx below directmap start %#lx\n",
+              base_mfn, mfn_x(directmap_mfn_start));
+
+    if ( (res = map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn),
+                          base_mfn_t, nr_mfns,
+                          PAGE_HYPERVISOR_RW)) )
+        panic("Directmap mappings for [%#"PRIpaddr", %#"PRIpaddr") failed: %d\n",
+              mfn_to_maddr(base_mfn_t),
+              mfn_to_maddr(mfn_add(base_mfn_t, nr_mfns)), res);
+}
+
+#else /* CONFIG_RISCV_32 */
+#error setup_{directmap,frametable}_mapping() should be implemented for RV_32
+#endif
+
+/*
+ * Setup memory management
+ *
+ * RISC-V 64 has a large virtual address space (the minimum supported
+ * MMU mode is Sv39, which provides GBs of VA space).
+ *
+ * The directmap_virt_start is shifted lower in the VA space to
+ * (DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address) to avoid
+ * wasting a large portion of the directmap space, this also allows for simple
+ * VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a GB boundary
+ * (for Sv39; for other MMU mode boundaries will be bigger ) by masking the
+ * bits of the RAM start address to enable the use of superpages in
+ * map_pages_to_xen().
+ *
+ * The frametable is mapped starting from physical address RAM_START, so an
+ * additional offset is applied in setup_frametable_mappings() to initialize
+ * frametable_virt_start to minimize wasting of VA space and simplifying
+ * page_to_mfn() and mfn_to_page() translations.
+ */
+void __init setup_mm(void)
+{
+    const struct membanks *banks = bootinfo_get_mem();
+    paddr_t ram_start = INVALID_PADDR;
+    paddr_t ram_end = 0;
+    unsigned int i;
+
+    /*
+     * We need some memory to allocate the page-tables used for the directmap
+     * mappings. But some regions may contain memory already allocated
+     * for other uses (e.g. modules, reserved-memory...).
+     *
+     * For simplicity, add all the free regions in the boot allocator.
+     */
+    populate_boot_allocator();
+
+    if ( !banks->nr_banks )
+        panic("bank->nr_banks shouldn't be zero, check memory node in dts\n");
+
+    for ( i = 0; i < banks->nr_banks; i++ )
+    {
+        const struct membank *bank = &banks->bank[i];
+        paddr_t bank_start = ROUNDUP(bank->start, PAGE_SIZE);
+        paddr_t bank_end = ROUNDDOWN(bank->start + bank->size, PAGE_SIZE);
+        unsigned long bank_size = bank_end - bank_start;
+
+        ram_start = min(ram_start, bank_start);
+        ram_end = max(ram_end, bank_end);
+
+        setup_directmap_mappings(PFN_DOWN(bank_start), PFN_DOWN(bank_size));
+    }
+
+    setup_frametable_mappings(ram_start, ram_end);
+    max_page = PFN_DOWN(ram_end);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index e29bd75d7c..2887a18c0c 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 
 #include <asm/early_printk.h>
 #include <asm/sbi.h>
+#include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/traps.h>
 
@@ -59,6 +60,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
 
+    setup_mm();
+
     printk("All set up\n");
 
     machine_halt();
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index 19caaa8026..cd528fbdb1 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -2,6 +2,7 @@
 #define __MACROS_H__
 
 #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
+#define ROUNDDOWN(x, a) ((x) & ~((a) - 1))
 
 #define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
 
-- 
2.47.0


