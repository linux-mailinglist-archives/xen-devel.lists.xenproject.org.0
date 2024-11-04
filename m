Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4E9BB823
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 15:41:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830081.1245002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7yGi-00042N-G8; Mon, 04 Nov 2024 14:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830081.1245002; Mon, 04 Nov 2024 14:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7yGi-00040O-Ce; Mon, 04 Nov 2024 14:41:24 +0000
Received: by outflank-mailman (input) for mailman id 830081;
 Mon, 04 Nov 2024 14:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Evtf=R7=bounce.vates.tech=bounce-md_30504962.6728dd0b.v1-00a9add463124e10a3c376e6272604d1@srs-se1.protection.inumbo.net>)
 id 1t7yGg-00040I-Gn
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 14:41:22 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8e32b5a-9aba-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 15:41:17 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4XhvKl43vmzBsVDXy
 for <xen-devel@lists.xenproject.org>; Mon,  4 Nov 2024 14:41:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 00a9add463124e10a3c376e6272604d1; Mon, 04 Nov 2024 14:41:15 +0000
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
X-Inumbo-ID: d8e32b5a-9aba-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzMy4xIiwiaGVsbyI6Im1haWwxMzMtMS5hdGwxMzEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ4ZTMyYjVhLTlhYmEtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzMxMjc3LjU0OTcwOSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MjhkZDBiLnYxLTAwYTlhZGQ0NjMxMjRlMTBhM2MzNzZlNjI3MjYwNGQxQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730731275; x=1730991775;
	bh=vcI+dluGaD5M6iZjJ+mno1wyRmsrm6WijK79LN4oTjE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=U5ubBPIQ2odlCLjj9YTOUSyfZ8jmeAZgGiZs/KvQznhBvHubU5YbDe81CV3PuADT2
	 nf96RlEbck/v1WS77VXypaQVFibpfV/ZQdet+IJbvfHY21pgdnvidXMaRFyAhRLgpc
	 vVWbKvVyW3hOAXBXu1SneeOqtWAfXxmRTx4M3xgW/YOEB3ZyNzWSEZxM9xohMMcPR5
	 y0OtS8SruHdFZ/R0iN7PTpH/AczCe2VxbHvR25BYS+30f3kbcghaQSNg4z3OzAyQ4Y
	 /lgkAoiT9iHHXVDWDRl+Q6iMcLbsk5Qr/pCGyroaY+Wtt+efZMqVUjHEWEOjAcWzbY
	 uEnyER3t1Dz9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730731275; x=1730991775; i=teddy.astie@vates.tech;
	bh=vcI+dluGaD5M6iZjJ+mno1wyRmsrm6WijK79LN4oTjE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=1EARiS1FtbVnphUSi5LuJfIJlSgZfXXE7d3OEKlwCBIVuAdAWeED8p4ezeI0WBpRG
	 Lq5BvyxgVouKm+YFaNmLIxtuMxMz7ruJ/0pq468oAEGU9ZtN+H4xkWk9jP+F8x5PoF
	 gddksuOdAK2smlvX1U4xT4hbpMKjzh2kb5TzMwEWcqhnDwqU5H/xuqJkN4MwjSU/3y
	 MG7g0mQbtEfLs/Flzt7KdALTCxum4Ek+U/G9u806DxlQRcvpcrR0RQtQEVK6isswEJ
	 ucf+Ry6d6Ng4zqMPGpruGGJQpg2pgcGLyB33Zex3i2Qs+7NShrKllcfVxFYz88aEI5
	 AoqPgthu59neQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3]=20iommu/xen:=20Add=20Xen=20PV-IOMMU=20driver?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730731272271
To: xen-devel@lists.xenproject.org, iommu@lists.linux.dev
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <b2c58854cba26cc2ca1a4d28700b833510fe2def.1730729812.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.00a9add463124e10a3c376e6272604d1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241104:md
Date: Mon, 04 Nov 2024 14:41:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In the context of Xen, Linux runs as Dom0 and doesn't have access to the
machine IOMMU. Although, a IOMMU is mandatory to use some kernel features
such as VFIO or DMA protection.

In Xen, we added a paravirtualized IOMMU with iommu_op hypercall in order to
allow Dom0 to implement such feature. This commit introduces a new IOMMU driver
that uses this new hypercall interface.

Introduce io-pgtable-xen as a shadow pagetable to track mappings for lookup.

Signed-off-by Teddy Astie <teddy.astie@vates.tech>
---
Changed in v2 :
* formatting changes
* applied Jan Beulich proposed changes : removed vim notes at end of pv-iommu.h
* applied Jason Gunthorpe proposed changes : use new ops and remove redundant
checks

Changed in v3 :
* Introduced io-pgtable-xen in order to track entries to implement lookup (as
	it has been removed from hypercall interface)
* use redesigned hypercall interface

Depends on https://lore.kernel.org/xen-devel/cover.1730718102.git.teddy.astie@vates.tech
---
 arch/x86/include/asm/xen/hypercall.h |   6 +
 drivers/iommu/Kconfig                |   9 +
 drivers/iommu/Makefile               |   2 +
 drivers/iommu/io-pgtable-xen.c       | 368 ++++++++++++++++++++++
 drivers/iommu/io-pgtable.c           |   3 +
 drivers/iommu/xen-iommu.c            | 444 +++++++++++++++++++++++++++
 include/linux/io-pgtable.h           |   2 +
 include/xen/interface/memory.h       |  33 ++
 include/xen/interface/pv-iommu.h     | 341 ++++++++++++++++++++
 include/xen/interface/xen.h          |   1 +
 10 files changed, 1209 insertions(+)
 create mode 100644 drivers/iommu/io-pgtable-xen.c
 create mode 100644 drivers/iommu/xen-iommu.c
 create mode 100644 include/xen/interface/pv-iommu.h

diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index a2dd24947eb8..d8b2876c2df4 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -490,6 +490,12 @@ HYPERVISOR_xenpmu_op(unsigned int op, void *arg)
 	return _hypercall2(int, xenpmu_op, op, arg);
 }
 
+static inline long
+HYPERVISOR_iommu_op(unsigned int subop, void *arg)
+{
+	return _hypercall2(int, iommu_op, subop, arg);
+}
+
 static inline int
 HYPERVISOR_dm_op(
 	domid_t dom, unsigned int nr_bufs, struct xen_dm_op_buf *bufs)
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index b3aa1f5d5321..9d8fab4090cc 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -507,6 +507,15 @@ config VIRTIO_IOMMU
 
 	  Say Y here if you intend to run this kernel as a guest.
 
+config XEN_IOMMU
+	bool "Xen IOMMU driver"
+	depends on XEN_DOM0
+	select IOMMU_API
+	help
+		Xen PV-IOMMU driver for Dom0.
+
+		Say Y here if you intend to run this guest as Xen Dom0.
+
 config SPRD_IOMMU
 	tristate "Unisoc IOMMU Support"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 542760d963ec..0adbcb167c0b 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_DART) += io-pgtable-dart.o
+obj-$(CONFIG_XEN_IOMMU) += io-pgtable-xen.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
 obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
 obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
@@ -30,3 +31,4 @@ obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o
 obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
 obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
 obj-$(CONFIG_APPLE_DART) += apple-dart.o
+obj-$(CONFIG_XEN_IOMMU) += xen-iommu.o
\ No newline at end of file
diff --git a/drivers/iommu/io-pgtable-xen.c b/drivers/iommu/io-pgtable-xen.c
new file mode 100644
index 000000000000..974941fff80d
--- /dev/null
+++ b/drivers/iommu/io-pgtable-xen.c
@@ -0,0 +1,368 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic page table allocator for tracking purposes.
+ * Based on AMD IO pagetable allocator v2.
+ *
+ * Copyright (C) 2024 Vates SAS
+ * Author: Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#define pr_fmt(fmt)	"xen-iommu pg-table: " fmt
+#define dev_fmt(fmt)	pr_fmt(fmt)
+
+#include <linux/bitops.h>
+#include <linux/io-pgtable.h>
+#include <linux/kernel.h>
+
+#include <asm/barrier.h>
+
+#include "iommu-pages.h"
+
+#include "xen/page.h"
+
+#define IOMMU_PAGE_PRESENT	BIT_ULL(0)	/* Is present */
+#define IOMMU_PAGE_HUGE		BIT_ULL(1)	/* Is hugepage */
+#define MAX_PTRS_PER_PAGE	512
+
+#define IOMMU_PAGE_SIZE_2M	BIT_ULL(21)
+#define IOMMU_PAGE_SIZE_1G	BIT_ULL(30)
+
+#define PM_ADDR_MASK		0x000ffffffffff000ULL
+#define XEN_IOMMU_PGSIZES	(XEN_PAGE_SIZE | (1ULL << 21) | (1ULL << 30))
+
+#define PAGE_MODE_NONE    0x00
+#define PAGE_MODE_1_LEVEL 0x01
+#define PAGE_MODE_2_LEVEL 0x02
+#define PAGE_MODE_3_LEVEL 0x03
+#define PAGE_MODE_4_LEVEL 0x04
+#define PAGE_MODE_5_LEVEL 0x05
+
+#define IOMMU_PTE_PR BIT(0)
+#define IOMMU_PTE_PRESENT(pte) ((pte) & IOMMU_PTE_PR)
+
+#define PM_LEVEL_SHIFT(x)	(12 + ((x) * 9))
+#define PM_LEVEL_INDEX(x, a)	(((a) >> PM_LEVEL_SHIFT((x))) & 0x1ffULL)
+
+#define IOMMU_IN_ADDR_BIT_SIZE  52
+#define IOMMU_OUT_ADDR_BIT_SIZE 52
+
+#define PAGE_SIZE_ALIGN(address, pagesize) \
+		((address) & ~((pagesize) - 1))
+
+#define io_pgtable_to_data(x) \
+	container_of((x), struct xen_io_pgtable, iop)
+
+#define io_pgtable_ops_to_data(x) \
+	io_pgtable_to_data(io_pgtable_ops_to_pgtable(x))
+
+
+struct xen_io_pgtable {
+	struct io_pgtable_cfg	pgtbl_cfg;
+	struct io_pgtable	iop;
+	u64			*pgd;	/* pgtable pgd pointer */
+};
+
+static inline bool is_large_pte(u64 pte)
+{
+	return (pte & IOMMU_PAGE_HUGE);
+}
+
+static inline u64 set_pgtable_attr(u64 *page)
+{
+	return (virt_to_phys(page) | IOMMU_PAGE_PRESENT);
+}
+
+static inline void *get_pgtable_pte(u64 pte)
+{
+	return phys_to_virt(pte & PM_ADDR_MASK);
+}
+
+static u64 set_pte_attr(u64 paddr, u64 pg_size)
+{
+	u64 pte;
+
+	pte = paddr & PM_ADDR_MASK;
+	pte |= IOMMU_PAGE_PRESENT;
+
+	/* Large page */
+	if (pg_size == IOMMU_PAGE_SIZE_1G || pg_size == IOMMU_PAGE_SIZE_2M)
+		pte |= IOMMU_PAGE_HUGE;
+
+	return pte;
+}
+
+static inline u64 get_alloc_page_size(u64 size)
+{
+	if (size >= IOMMU_PAGE_SIZE_1G)
+		return IOMMU_PAGE_SIZE_1G;
+
+	if (size >= IOMMU_PAGE_SIZE_2M)
+		return IOMMU_PAGE_SIZE_2M;
+
+	return XEN_PAGE_SIZE;
+}
+
+static inline int page_size_to_level(u64 pg_size)
+{
+	if (pg_size == IOMMU_PAGE_SIZE_1G)
+		return PAGE_MODE_3_LEVEL;
+	if (pg_size == IOMMU_PAGE_SIZE_2M)
+		return PAGE_MODE_2_LEVEL;
+
+	return PAGE_MODE_1_LEVEL;
+}
+
+static void free_pgtable(u64 *pt, int level)
+{
+	u64 *p;
+	int i;
+
+	for (i = 0; i < MAX_PTRS_PER_PAGE; i++) {
+		/* PTE present? */
+		if (!IOMMU_PTE_PRESENT(pt[i]))
+			continue;
+
+		if (is_large_pte(pt[i]))
+			continue;
+
+		/*
+		 * Free the next level. No need to look at l1 tables here since
+		 * they can only contain leaf PTEs; just free them directly.
+		 */
+		p = get_pgtable_pte(pt[i]);
+		if (level > 2)
+			free_pgtable(p, level - 1);
+		else
+			iommu_free_page(p);
+	}
+
+	iommu_free_page(pt);
+}
+
+/* Allocate page table */
+static u64 *xen_alloc_pte(u64 *pgd, unsigned long iova, gfp_t gfp,
+			  unsigned long pg_size, bool *updated)
+{
+	u64 *pte, *page;
+	int level, end_level;
+
+	level = PAGE_MODE_5_LEVEL - 1;
+	end_level = page_size_to_level(pg_size);
+	pte = &pgd[PM_LEVEL_INDEX(level, iova)];
+	iova = PAGE_SIZE_ALIGN(iova, XEN_PAGE_SIZE);
+
+	while (level >= end_level) {
+		u64 __pte, __npte;
+
+		__pte = *pte;
+
+		if (IOMMU_PTE_PRESENT(__pte) && is_large_pte(__pte)) {
+			/* Unmap large pte */
+			cmpxchg64(pte, *pte, 0ULL);
+			*updated = true;
+			continue;
+		}
+
+		if (!IOMMU_PTE_PRESENT(__pte)) {
+			page = iommu_alloc_page(gfp);
+			if (!page)
+				return NULL;
+
+			__npte = set_pgtable_attr(page);
+			/* pte could have been changed somewhere. */
+			if (cmpxchg64(pte, __pte, __npte) != __pte)
+				iommu_free_page(page);
+			else if (IOMMU_PTE_PRESENT(__pte))
+				*updated = true;
+
+			continue;
+		}
+
+		level -= 1;
+		pte = get_pgtable_pte(__pte);
+		pte = &pte[PM_LEVEL_INDEX(level, iova)];
+	}
+
+	/* Tear down existing pte entries */
+	if (IOMMU_PTE_PRESENT(*pte)) {
+		u64 *__pte;
+
+		*updated = true;
+		__pte = get_pgtable_pte(*pte);
+		cmpxchg64(pte, *pte, 0ULL);
+		if (pg_size == IOMMU_PAGE_SIZE_1G)
+			free_pgtable(__pte, end_level - 1);
+		else if (pg_size == IOMMU_PAGE_SIZE_2M)
+			iommu_free_page(__pte);
+	}
+
+	return pte;
+}
+
+/*
+ * This function checks if there is a PTE for a given dma address.
+ * If there is one, it returns the pointer to it.
+ */
+static u64 *fetch_pte(struct xen_io_pgtable *pgtable, unsigned long iova,
+		      unsigned long *page_size)
+{
+	u64 *pte;
+	int level;
+
+	level = PAGE_MODE_5_LEVEL - 1;
+	pte = &pgtable->pgd[PM_LEVEL_INDEX(level, iova)];
+	/* Default page size is 4K */
+	*page_size = XEN_PAGE_SIZE;
+
+	while (level) {
+		/* Not present */
+		if (!IOMMU_PTE_PRESENT(*pte))
+			return NULL;
+
+		/* Walk to the next level */
+		pte = get_pgtable_pte(*pte);
+		pte = &pte[PM_LEVEL_INDEX(level - 1, iova)];
+
+		/* Large page */
+		if (is_large_pte(*pte)) {
+			if (level == PAGE_MODE_3_LEVEL)
+				*page_size = IOMMU_PAGE_SIZE_1G;
+			else if (level == PAGE_MODE_2_LEVEL)
+				*page_size = IOMMU_PAGE_SIZE_2M;
+			else
+				return NULL;	/* Wrongly set PSE bit in PTE */
+
+			break;
+		}
+
+		level -= 1;
+	}
+
+	return pte;
+}
+
+static int iommu_xen_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
+			       phys_addr_t paddr, size_t pgsize, size_t pgcount,
+			       int prot, gfp_t gfp, size_t *mapped)
+{
+	struct xen_io_pgtable *pgtable = io_pgtable_ops_to_data(ops);	
+	struct io_pgtable_cfg *cfg = &pgtable->pgtbl_cfg;
+	u64 *pte;
+	unsigned long map_size;
+	unsigned long mapped_size = 0;
+	size_t size = pgcount << __ffs(pgsize);
+	int ret = 0;
+	bool updated = false;
+
+	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize) || !pgcount)
+		return -EINVAL;
+
+	while (mapped_size < size) {
+		map_size = get_alloc_page_size(pgsize);
+		pte = xen_alloc_pte(pgtable->pgd, iova, gfp, map_size, &updated);
+		if (!pte) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		*pte = set_pte_attr(paddr, map_size);
+
+		iova += map_size;
+		paddr += map_size;
+		mapped_size += map_size;
+	}
+
+out:
+	if (mapped)
+		*mapped += mapped_size;
+
+	return ret;
+}
+
+static unsigned long iommu_xen_unmap_pages(struct io_pgtable_ops *ops,
+					   unsigned long iova,
+					   size_t pgsize, size_t pgcount,
+					   struct iommu_iotlb_gather *gather)
+{
+	struct xen_io_pgtable *pgtable = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_cfg *cfg = &pgtable->iop.cfg;
+	unsigned long unmap_size;
+	unsigned long unmapped = 0;
+	size_t size = pgcount << __ffs(pgsize);
+	u64 *pte;
+
+	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize || !pgcount))
+		return 0;
+
+	while (unmapped < size) {
+		pte = fetch_pte(pgtable, iova, &unmap_size);
+		if (!pte)
+			return unmapped;
+
+		*pte = 0ULL;
+
+		iova = (iova & ~(unmap_size - 1)) + unmap_size;
+		unmapped += unmap_size;
+	}
+
+	return unmapped;
+}
+
+static phys_addr_t iommu_xen_iova_to_phys(struct io_pgtable_ops *ops, unsigned long iova)
+{
+	struct xen_io_pgtable *pgtable = io_pgtable_ops_to_data(ops);
+	unsigned long offset_mask, pte_pgsize;
+	u64 *pte, __pte;
+
+	pte = fetch_pte(pgtable, iova, &pte_pgsize);
+	if (!pte || !IOMMU_PTE_PRESENT(*pte))
+		return 0;
+
+	offset_mask = pte_pgsize - 1;
+	__pte = *pte & PM_ADDR_MASK;
+
+	return (__pte & ~offset_mask) | (iova & offset_mask);
+}
+
+static void xen_free_pgtable(struct io_pgtable *iop)
+{
+	struct xen_io_pgtable *pgtable = container_of(iop, struct xen_io_pgtable, iop);
+
+	if (!pgtable || !pgtable->pgd)
+		return;
+
+	/* Free page table */
+	free_pgtable(pgtable->pgd, PAGE_MODE_5_LEVEL);
+	kfree(pgtable);
+}
+
+static struct io_pgtable *xen_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
+{
+	struct xen_io_pgtable *pgtable = kmalloc(sizeof(struct xen_io_pgtable),
+						 GFP_KERNEL);
+	if (!pgtable)
+		return NULL;
+
+	pgtable->pgd = iommu_alloc_page(GFP_KERNEL);
+	if (!pgtable->pgd) {
+		kfree(pgtable);
+		return NULL;
+	}
+
+	pgtable->iop.ops.map_pages    = iommu_xen_map_pages;
+	pgtable->iop.ops.unmap_pages  = iommu_xen_unmap_pages;
+	pgtable->iop.ops.iova_to_phys = iommu_xen_iova_to_phys;
+
+	cfg->pgsize_bitmap = XEN_IOMMU_PGSIZES;
+	cfg->ias           = IOMMU_IN_ADDR_BIT_SIZE;
+	cfg->oas           = IOMMU_OUT_ADDR_BIT_SIZE;
+
+	pgtable->pgtbl_cfg = *cfg;
+
+	return &pgtable->iop;
+}
+
+struct io_pgtable_init_fns io_pgtable_xen_init_fns = {
+	.alloc	= xen_alloc_pgtable,
+	.free	= xen_free_pgtable,
+};
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index 8841c1487f00..763f6c34db73 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -32,6 +32,9 @@ io_pgtable_init_table[IO_PGTABLE_NUM_FMTS] = {
 	[AMD_IOMMU_V1] = &io_pgtable_amd_iommu_v1_init_fns,
 	[AMD_IOMMU_V2] = &io_pgtable_amd_iommu_v2_init_fns,
 #endif
+#ifdef CONFIG_XEN_IOMMU
+	[XEN_IOMMU_GENERIC] = &io_pgtable_xen_init_fns,
+#endif
 };
 
 static int check_custom_allocator(enum io_pgtable_fmt fmt,
diff --git a/drivers/iommu/xen-iommu.c b/drivers/iommu/xen-iommu.c
new file mode 100644
index 000000000000..01a4cc27f3c9
--- /dev/null
+++ b/drivers/iommu/xen-iommu.c
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xen PV-IOMMU driver.
+ *
+ * Copyright (C) 2024 Vates SAS
+ *
+ * Author: Teddy Astie <teddy.astie@vates.tech>
+ *
+ */
+
+#define pr_fmt(fmt)	"xen-iommu: " fmt
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/iommu.h>
+#include <linux/pci.h>
+#include <linux/printk.h>
+#include <linux/stddef.h>
+#include <linux/minmax.h>
+#include <linux/io-pgtable.h>
+
+#include <xen/xen.h>
+#include <xen/page.h>
+#include <xen/interface/memory.h>
+#include <xen/interface/pv-iommu.h>
+#include <asm/xen/hypercall.h>
+#include <asm/xen/page.h>
+
+MODULE_DESCRIPTION("Xen IOMMU driver");
+MODULE_AUTHOR("Teddy Astie <teddy.astie@vates.tech>");
+MODULE_LICENSE("GPL");
+
+#define MSI_RANGE_START		(0xfee00000)
+#define MSI_RANGE_END		(0xfeefffff)
+
+struct xen_iommu_domain {
+	struct iommu_domain domain;
+
+	u16 ctx_no;			/* Xen PV-IOMMU context number */
+	struct io_pgtable_ops *pgtable;	/* Parralel page table for iova_to_phys */
+};
+
+static struct iommu_device xen_iommu_device;
+static struct pv_iommu_capabilities caps;
+
+static struct xen_iommu_domain xen_iommu_identity_domain;
+static bool map_single_pages = false;
+
+static inline struct xen_iommu_domain *to_xen_iommu_domain(struct iommu_domain *dom)
+{
+	return container_of(dom, struct xen_iommu_domain, domain);
+}
+
+static inline u64 addr_to_pfn(u64 addr)
+{
+	return addr >> 12;
+}
+
+static inline u64 pfn_to_addr(u64 pfn)
+{
+	return pfn << 12;
+}
+
+static bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static struct iommu_domain *xen_iommu_domain_alloc_paging(struct device *dev)
+{
+	struct xen_iommu_domain *domain;
+	struct io_pgtable_cfg cfg = { .alloc = NULL, .free = NULL };
+	struct io_pgtable_ops *pgtable;
+	int ret;
+
+	struct pv_iommu_alloc alloc = { .alloc_flags = 0 };
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return ERR_PTR(-ENOMEM);
+
+	pgtable = alloc_io_pgtable_ops(XEN_IOMMU_GENERIC, &cfg, NULL);
+	if (!pgtable) {
+		kfree(domain);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ret = HYPERVISOR_iommu_op(IOMMU_alloc_context, &alloc);
+
+	if (ret) {
+		pr_err("Unable to create Xen IOMMU context (%d)", ret);
+		kfree(domain);
+		free_io_pgtable_ops(pgtable);
+		return ERR_PTR(ret);
+	}
+
+	domain->ctx_no = alloc.ctx_no;
+	domain->pgtable = pgtable;
+
+	domain->domain.geometry = (struct iommu_domain_geometry){
+		.aperture_start = 0,
+		.aperture_end = caps.max_iova_addr,
+		.force_aperture = true,
+	};
+
+	return &domain->domain;
+}
+
+static struct iommu_device *xen_iommu_probe_device(struct device *dev)
+{
+	if (!dev_is_pci(dev))
+		return ERR_PTR(-ENODEV);
+
+	return &xen_iommu_device;
+}
+
+static int xen_iommu_map_pages(struct iommu_domain *domain, unsigned long iova,
+			       phys_addr_t paddr, size_t pgsize, size_t pgcount,
+			       int prot, gfp_t gfp, size_t *mapped)
+{
+	int ret = 0;
+	size_t _mapped; /* for pgtable callback */
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+	struct pv_iommu_map_pages map = {
+		.ctx_no = dom->ctx_no,
+		.pgsize = pgsize,
+		.map_flags = 0,
+		.mapped = 0,
+	};
+
+	/* NOTE: paddr is actually bound to pfn, not gfn */
+	uint64_t pfn0 = addr_to_pfn(paddr);
+	uint64_t dfn0 = addr_to_pfn(iova);
+
+	if (prot & IOMMU_READ)
+		map.map_flags |= IOMMU_MAP_readable;
+
+	if (prot & IOMMU_WRITE)
+		map.map_flags |= IOMMU_MAP_writeable;
+
+	if (prot & IOMMU_CACHE)
+		map.map_flags |= IOMMU_MAP_cache;
+
+	if (map_single_pages) {
+		size_t i = 0;
+		map.nr_pages = 1;
+
+		for (; i < pgcount; i++) {
+			map.gfn = pfn_to_gfn(pfn0 + i);
+			map.dfn = dfn0 + i;
+			map.nr_pages = 1;
+
+			ret = HYPERVISOR_iommu_op(IOMMU_map_pages, &map);
+
+			if (ret)
+				break;
+		}
+	} else {
+		map.nr_pages = pgcount;
+		map.gfn = pfn_to_gfn(pfn0);
+		map.dfn = dfn0;
+
+		ret = HYPERVISOR_iommu_op(IOMMU_map_pages, &map);
+	}
+
+	if (mapped)
+		*mapped = pgsize * map.mapped;
+
+	dom->pgtable->map_pages(dom->pgtable, iova, paddr, pgsize, pgcount,
+				prot, gfp, &_mapped);
+
+	return ret;
+}
+
+static size_t xen_iommu_unmap_pages(struct iommu_domain *domain, unsigned long iova,
+				    size_t pgsize, size_t pgcount,
+				    struct iommu_iotlb_gather *iotlb_gather)
+{
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+	struct pv_iommu_unmap_pages unmap = {
+		.ctx_no = dom->ctx_no,
+		.pgsize = pgsize,
+		.unmapped = 0,
+		.nr_pages = pgcount,
+		.dfn = addr_to_pfn(iova),
+	};
+
+	WARN_ON(HYPERVISOR_iommu_op(IOMMU_unmap_pages, &unmap));
+	dom->pgtable->unmap_pages(dom->pgtable, iova, pgsize, pgcount,
+				  iotlb_gather);
+
+	return unmap.unmapped * pgsize;
+}
+
+static int xen_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
+{
+	struct pci_dev *pdev;
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+	struct pv_iommu_reattach_device reattach = {
+		.ctx_no = dom->ctx_no,
+		.pasid = 0,
+	};
+
+	pdev = to_pci_dev(dev);
+
+	reattach.dev.seg = pci_domain_nr(pdev->bus);
+	reattach.dev.bus = pdev->bus->number;
+	reattach.dev.devfn = pdev->devfn;
+
+	return HYPERVISOR_iommu_op(IOMMU_reattach_device, &reattach);
+}
+
+static void xen_iommu_free(struct iommu_domain *domain)
+{
+	int ret;
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+	struct pv_iommu_free op = {
+		.ctx_no = dom->ctx_no,
+		.free_flags = 0,
+	};
+
+	ret = HYPERVISOR_iommu_op(IOMMU_free_context, &op);
+
+	if (ret)
+		pr_err("Context %hu destruction failure\n", dom->ctx_no);
+
+	free_io_pgtable_ops(dom->pgtable);
+
+	kfree(domain);
+}
+
+static phys_addr_t xen_iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+{
+	struct xen_iommu_domain *dom = to_xen_iommu_domain(domain);
+
+	if (!dom->ctx_no)
+		/* If default domain is identity, phys_addr is iova. */
+		return (caps.cap_flags & IOMMUCAP_default_identity) ? iova : 0;
+	
+	return dom->pgtable->iova_to_phys(dom->pgtable, iova);
+}
+
+static void xen_iommu_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	struct iommu_resv_region *reg;
+	struct xen_reserved_device_memory *entries;
+	struct xen_reserved_device_memory_map map;
+	struct pci_dev *pdev;
+	int ret, i;
+
+	pdev = to_pci_dev(dev);
+
+	reg = iommu_alloc_resv_region(MSI_RANGE_START,
+				      MSI_RANGE_END - MSI_RANGE_START + 1,
+				      0, IOMMU_RESV_MSI, GFP_KERNEL);
+
+	if (!reg)
+		return;
+
+	list_add_tail(&reg->list, head);
+
+	/* Map xen-specific entries */
+
+	/* First, get number of entries to map */
+	map.buffer = NULL;
+	map.nr_entries = 0;
+	map.flags = 0;
+
+	map.dev.pci.seg = pci_domain_nr(pdev->bus);
+	map.dev.pci.bus = pdev->bus->number;
+	map.dev.pci.devfn = pdev->devfn;
+
+	ret = HYPERVISOR_memory_op(XENMEM_reserved_device_memory_map, &map);
+
+	if (ret == 0)
+		/* No reserved region, nothing to do */
+		return;
+
+	if (ret != -ENOBUFS) {
+		pr_err("Unable to get reserved region count (%d)\n", ret);
+		return;
+	}
+
+	/* Assume a reasonable number of entries, otherwise, something is probably wrong */
+	if (WARN_ON(map.nr_entries > 256))
+		pr_warn("Xen reporting many reserved regions (%u)\n", map.nr_entries);
+
+	/* And finally get actual mappings */
+	entries = kcalloc(map.nr_entries, sizeof(struct xen_reserved_device_memory),
+					  GFP_KERNEL);
+
+	if (!entries) {
+		pr_err("No memory for map entries\n");
+		return;
+	}
+
+	map.buffer = entries;
+
+	ret = HYPERVISOR_memory_op(XENMEM_reserved_device_memory_map, &map);
+
+	if (ret != 0) {
+		pr_err("Unable to get reserved regions (%d)\n", ret);
+		kfree(entries);
+		return;
+	}
+
+	for (i = 0; i < map.nr_entries; i++) {
+		struct xen_reserved_device_memory entry = entries[i];
+
+		reg = iommu_alloc_resv_region(pfn_to_addr(entry.start_pfn),
+					      pfn_to_addr(entry.nr_pages),
+					      0, IOMMU_RESV_RESERVED, GFP_KERNEL);
+
+		if (!reg)
+			break;
+
+		list_add_tail(&reg->list, head);
+	}
+
+	kfree(entries);
+}
+
+static struct iommu_ops xen_iommu_ops = {
+	.identity_domain = &xen_iommu_identity_domain.domain,
+	.release_domain = &xen_iommu_identity_domain.domain,
+	.capable = xen_iommu_capable,
+	.domain_alloc_paging = xen_iommu_domain_alloc_paging,
+	.probe_device = xen_iommu_probe_device,
+	.device_group = pci_device_group,
+	.get_resv_regions = xen_iommu_get_resv_regions,
+	.pgsize_bitmap = XEN_PAGE_SIZE,
+	.default_domain_ops = &(const struct iommu_domain_ops) {
+		.map_pages = xen_iommu_map_pages,
+		.unmap_pages = xen_iommu_unmap_pages,
+		.attach_dev = xen_iommu_attach_dev,
+		.iova_to_phys = xen_iommu_iova_to_phys,
+		.free = xen_iommu_free,
+	},
+};
+
+static int __init xen_iommu_init(void)
+{
+	long ret;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	/* Check if iommu_op is supported */
+	if ((ret = HYPERVISOR_iommu_op(IOMMU_query_capabilities, &caps)))
+	{
+		pr_err("Unable to query capabilities (%ld)", ret);
+		return -ENODEV; /* No Xen IOMMU hardware */
+	}
+
+	/* If ctx_no is zero, it may be due to PV-IOMMU not being initialized. */
+	if (!caps.max_ctx_no)
+	{
+		/* Try to initialize PV-IOMMU */
+		struct pv_iommu_init init;
+
+		pr_info("Got no usable context, try initializing PV-IOMMU\n");
+
+		/* FIXME: Don't hardcode this */
+		init.max_ctx_no = 128;
+		init.arena_order = 12;
+
+		pr_info("init.max_ctx_no=%hu\n", init.max_ctx_no);
+		pr_info("init.arena_order=%hu\n", init.arena_order);
+
+		/* Try to initialize PV-IOMMU */
+		ret = HYPERVISOR_iommu_op(IOMMU_init, &init);
+
+		if (ret == -EACCES) {
+			/* PV-IOMMU being already initialized often means not allowed. */
+			pr_warn("PV-IOMMU is already initialized, guest may not be allowed to use PV-IOMMU\n");
+			return -EACCES;
+		} else if (ret) {
+			pr_err("PV-IOMMU initialization failure (%ld)", ret);
+			return ret;
+		}
+
+		WARN_ON(HYPERVISOR_iommu_op(IOMMU_query_capabilities, &caps));
+	}
+
+	pr_info("Initialising Xen IOMMU driver\n");
+	pr_info("max_ctx_no=%hu\n", caps.max_ctx_no);
+	pr_info("max_iova_addr=%llx\n", caps.max_iova_addr);
+	pr_info("pgsize_mask=%d\n", caps.pgsize_mask);
+	pr_info("default_identity=%c\n", (caps.cap_flags & IOMMUCAP_default_identity) ? 'y' : 'n');
+	pr_info("cache=%c\n", (caps.cap_flags & IOMMUCAP_cache) ? 'y' : 'n');
+
+	if (caps.max_ctx_no == 0) {
+		pr_err("Unable to use IOMMU PV driver (no context available ?)\n");
+		return -ENOTSUPP; /* Unable to use IOMMU PV ? */
+	}
+
+	xen_iommu_ops.pgsize_bitmap = caps.pgsize_mask;
+
+	if (xen_domain_type == XEN_PV_DOMAIN)
+		/* TODO: In PV domain, due to the existing pfn-gfn mapping we need to
+		 * consider that under certains circonstances, we have :
+		 *   pfn_to_gfn(x + 1) != pfn_to_gfn(x) + 1
+		 *
+		 * In these cases, we would want to separate the subop into several calls.
+		 * (only doing the grouped operation when the mapping is actually contigous)
+		 * Only map operation would be affected, as unmap actually uses dfn which
+		 * doesn't have this kind of mapping.
+		 *
+		 * Force single-page operations to work arround this issue for now.
+		 */
+		map_single_pages = true;
+
+	/* Initialize identity domain */
+	xen_iommu_identity_domain.ctx_no = 0;
+
+	xen_iommu_identity_domain.domain.geometry = (struct iommu_domain_geometry){
+		.aperture_start = 0,
+		.aperture_end = caps.max_iova_addr,
+		.force_aperture = true,
+	};
+
+	ret = iommu_device_sysfs_add(&xen_iommu_device, NULL, NULL, "xen-iommu");
+	if (ret) {
+		pr_err("Unable to add Xen IOMMU sysfs\n");
+		return ret;
+	}
+
+	ret = iommu_device_register(&xen_iommu_device, &xen_iommu_ops, NULL);
+	if (ret) {
+		pr_err("Unable to register Xen IOMMU device %ld\n", ret);
+		iommu_device_sysfs_remove(&xen_iommu_device);
+		return ret;
+	}
+
+	return 0;
+}
+
+module_init(xen_iommu_init);
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b1ecfc3cd5bc..8b1cd995d6f3 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -19,6 +19,7 @@ enum io_pgtable_fmt {
 	AMD_IOMMU_V2,
 	APPLE_DART,
 	APPLE_DART2,
+	XEN_IOMMU_GENERIC,
 	IO_PGTABLE_NUM_FMTS,
 };
 
@@ -303,5 +304,6 @@ extern struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_amd_iommu_v1_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_amd_iommu_v2_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_apple_dart_init_fns;
+extern struct io_pgtable_init_fns io_pgtable_xen_init_fns;
 
 #endif /* __IO_PGTABLE_H */
diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
index 1a371a825c55..c860acaf4b0e 100644
--- a/include/xen/interface/memory.h
+++ b/include/xen/interface/memory.h
@@ -10,6 +10,7 @@
 #ifndef __XEN_PUBLIC_MEMORY_H__
 #define __XEN_PUBLIC_MEMORY_H__
 
+#include <xen/interface/physdev.h>
 #include <linux/spinlock.h>
 
 /*
@@ -214,6 +215,38 @@ struct xen_add_to_physmap_range {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_add_to_physmap_range);
 
+/*
+ * With some legacy devices, certain guest-physical addresses cannot safely
+ * be used for other purposes, e.g. to map guest RAM.  This hypercall
+ * enumerates those regions so the toolstack can avoid using them.
+ */
+#define XENMEM_reserved_device_memory_map   27
+struct xen_reserved_device_memory {
+    xen_pfn_t start_pfn;
+    xen_ulong_t nr_pages;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory);
+
+struct xen_reserved_device_memory_map {
+#define XENMEM_RDM_ALL 1 /* Request all regions (ignore dev union). */
+    /* IN */
+    uint32_t flags;
+    /*
+     * IN/OUT
+     *
+     * Gets set to the required number of entries when too low,
+     * signaled by error code -ERANGE.
+     */
+    unsigned int nr_entries;
+    /* OUT */
+    GUEST_HANDLE(xen_reserved_device_memory) buffer;
+    /* IN */
+    union {
+        struct physdev_pci_device pci;
+    } dev;
+};
+DEFINE_GUEST_HANDLE_STRUCT(xen_reserved_device_memory_map);
+
 /*
  * Returns the pseudo-physical memory map as it was when the domain
  * was started (specified by XENMEM_set_memory_map).
diff --git a/include/xen/interface/pv-iommu.h b/include/xen/interface/pv-iommu.h
new file mode 100644
index 000000000000..a4a470319486
--- /dev/null
+++ b/include/xen/interface/pv-iommu.h
@@ -0,0 +1,341 @@
+/* SPDX-License-Identifier: MIT */
+/**
+ * pv-iommu.h
+ *
+ * Paravirtualized IOMMU driver interface.
+ *
+ * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#ifndef __XEN_PUBLIC_PV_IOMMU_H__
+#define __XEN_PUBLIC_PV_IOMMU_H__
+
+#include "xen.h"
+#include "physdev.h"
+
+#ifndef uint64_aligned_t
+#define uint64_aligned_t uint64_t
+#endif
+
+#define IOMMU_DEFAULT_CONTEXT (0)
+
+enum {
+    /* Basic cmd */
+    IOMMU_noop = 0,
+    IOMMU_query_capabilities,
+    IOMMU_init,
+    IOMMU_alloc_context,
+    IOMMU_free_context,
+    IOMMU_reattach_device,
+    IOMMU_map_pages,
+    IOMMU_unmap_pages,
+    IOMMU_remote_cmd,
+
+    /* Extended cmd */
+    IOMMU_alloc_nested,     /* if IOMMUCAP_nested */
+    IOMMU_flush_nested,     /* if IOMMUCAP_nested */
+    IOMMU_attach_pasid,     /* if IOMMUCAP_pasid */
+    IOMMU_detach_pasid,     /* if IOMMUCAP_pasid */
+};
+
+/**
+ * Indicate if the default context is a identity mapping to domain memory.
+ * If not defined, default context blocks all DMA to domain memory.
+ */
+#define IOMMUCAP_default_identity  (1 << 0)
+
+/**
+ * IOMMU_MAP_cache support.
+ */
+#define IOMMUCAP_cache     (1 << 1)
+
+/**
+ * Support for IOMMU_alloc_nested.
+ */
+#define IOMMUCAP_nested    (1 << 2)
+
+/**
+ * Support for IOMMU_attach_pasid and IOMMU_detach_pasid and pasid parameter in
+ * reattach_context.
+ */
+#define IOMMUCAP_pasid     (1 << 3)
+
+/**
+ * Support for IOMMU_ALLOC_identity
+ */
+#define IOMMUCAP_identity (1 << 4)
+
+/**
+ * IOMMU_query_capabilities
+ * Query PV-IOMMU capabilities for this domain.
+ */
+struct pv_iommu_capabilities {
+    /*
+     * OUT: Maximum device address (iova) that the guest can use for mappings.
+     */
+    uint64_aligned_t max_iova_addr;
+
+    /* OUT: IOMMU capabilities flags */
+    uint32_t cap_flags;
+
+    /* OUT: Mask of all supported page sizes. */
+    uint32_t pgsize_mask;
+
+    /* OUT: Maximum pasid (if IOMMUCAP_pasid) */
+    uint32_t max_pasid;
+
+    /* OUT: Maximum number of IOMMU context this domain can use. */
+    uint16_t max_ctx_no;
+};
+typedef struct pv_iommu_capabilities pv_iommu_capabilities_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_capabilities_t);
+
+/**
+ * IOMMU_init
+ * Initialize PV-IOMMU for this domain.
+ *
+ * Fails with -EACCESS if PV-IOMMU is already initialized.
+ */
+struct pv_iommu_init {
+    /* IN: Maximum number of IOMMU context this domain can use. */
+    uint32_t max_ctx_no;
+
+    /* IN: Arena size in pages (in power of two) */
+    uint32_t arena_order;
+};
+typedef struct pv_iommu_init pv_iommu_init_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_init_t);
+
+/**
+ * Create a 1:1 identity mapped context to domain memory
+ * (needs IOMMUCAP_identity).
+ */
+#define IOMMU_ALLOC_identity (1 << 0)
+
+/**
+ * IOMMU_alloc_context
+ * Allocate an IOMMU context.
+ * Fails with -ENOSPC if no context number is available.
+ */
+struct pv_iommu_alloc {
+    /* OUT: allocated IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: allocation flags */
+    uint32_t alloc_flags;
+};
+typedef struct pv_iommu_alloc pv_iommu_alloc_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_alloc_t);
+
+/**
+ * Move all devices to default context before freeing the context.
+ */
+#define IOMMU_FREE_reattach_default (1 << 0)
+
+/**
+ * IOMMU_free_context
+ * Destroy a IOMMU context.
+ *
+ * If IOMMU_FREE_reattach_default is specified, move all context devices to
+ * default context before destroying this context.
+ *
+ * If there are devices in the context and IOMMU_FREE_reattach_default is not
+ * specified, fail with -EBUSY.
+ *
+ * The default context can't be destroyed.
+ */
+struct pv_iommu_free {
+    /* IN: IOMMU context number to free */
+    uint16_t ctx_no;
+
+    /* IN: Free operation specific flags */
+    uint32_t free_flags;
+};
+typedef struct pv_iommu_free pv_iommu_free_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_free_t);
+
+/* Device has read access */
+#define IOMMU_MAP_readable (1 << 0)
+
+/* Device has write access */
+#define IOMMU_MAP_writeable (1 << 1)
+
+/* Enforce DMA coherency */
+#define IOMMU_MAP_cache (1 << 2)
+
+/**
+ * IOMMU_map_pages
+ * Map pages on a IOMMU context.
+ *
+ * pgsize must be supported by pgsize_mask.
+ * Fails with -EINVAL if mapping on top of another mapping.
+ * Report actually mapped page count in mapped field (regardless of failure).
+ */
+struct pv_iommu_map_pages {
+    /* IN: IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: Guest frame number */
+    uint64_aligned_t gfn;
+
+    /* IN: Device frame number */
+    uint64_aligned_t dfn;
+
+    /* IN: Map flags */
+    uint32_t map_flags;
+
+    /* IN: Size of pages to map */
+    uint32_t pgsize;
+
+    /* IN: Number of pages to map */
+    uint32_t nr_pages;
+
+    /* OUT: Number of pages actually mapped */
+    uint32_t mapped;
+};
+typedef struct pv_iommu_map_pages pv_iommu_map_pages_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_map_pages_t);
+
+/**
+ * IOMMU_unmap_pages
+ * Unmap pages on a IOMMU context.
+ *
+ * pgsize must be supported by pgsize_mask.
+ * Report actually unmapped page count in mapped field (regardless of failure).
+ * Fails with -ENOENT when attempting to unmap a page without any mapping
+ */
+struct pv_iommu_unmap_pages {
+    /* IN: IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: Device frame number */
+    uint64_aligned_t dfn;
+
+    /* IN: Size of pages to unmap */
+    uint32_t pgsize;
+
+    /* IN: Number of pages to unmap */
+    uint32_t nr_pages;
+
+    /* OUT: Number of pages actually unmapped */
+    uint32_t unmapped;
+};
+typedef struct pv_iommu_unmap_pages pv_iommu_unmap_pages_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_unmap_pages_t);
+
+/**
+ * IOMMU_reattach_device
+ * Reattach a device to another IOMMU context.
+ * Fails with -ENODEV if no such device exist.
+ */
+struct pv_iommu_reattach_device {
+    /* IN: Target IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: Physical device to move */
+    struct physdev_pci_device dev;
+
+    /* IN: PASID of the device (if IOMMUCAP_pasid) */
+    uint32_t pasid;
+};
+typedef struct pv_iommu_reattach_device pv_iommu_reattach_device_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_reattach_device_t);
+
+
+/**
+ * IOMMU_remote_cmd
+ * Do a PV-IOMMU operation on another domain.
+ * Current domain needs to be allowed to act on the target domain, otherwise
+ * fails with -EPERM.
+ */
+struct pv_iommu_remote_cmd {
+    /* IN: Target domain to do the subop on */
+    uint16_t domid;
+
+    /* IN: Command to do on target domain. */
+    uint16_t subop;
+
+    /* INOUT: Command argument from current domain memory */
+    GUEST_HANDLE(void) arg;
+};
+typedef struct pv_iommu_remote_cmd pv_iommu_remote_cmd_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_remote_cmd_t);
+
+/**
+ * IOMMU_alloc_nested
+ * Create a nested IOMMU context (needs IOMMUCAP_nested).
+ *
+ * This context uses a platform-specific page table from domain address space
+ * specified in pgtable_gfn and use it for nested translations.
+ *
+ * Explicit flushes needs to be submited with IOMMU_flush_nested on
+ * modification of the nested pagetable to ensure coherency between IOTLB and
+ * nested page table.
+ *
+ * This context can be destroyed using IOMMU_free_context.
+ * This context cannot be modified using map_pages, unmap_pages.
+ */
+struct pv_iommu_alloc_nested {
+    /* OUT: allocated IOMMU context number */
+    uint16_t ctx_no;
+
+    /* IN: guest frame number of the nested page table */
+    uint64_aligned_t pgtable_gfn;
+
+    /* IN: nested mode flags */
+    uint64_aligned_t nested_flags;
+};
+typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_alloc_nested_t);
+
+/**
+ * IOMMU_flush_nested (needs IOMMUCAP_nested)
+ * Flush the IOTLB for nested translation.
+ */
+struct pv_iommu_flush_nested {
+    /* TODO */
+};
+typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_flush_nested_t);
+
+/**
+ * IOMMU_attach_pasid (needs IOMMUCAP_pasid)
+ * Attach a new device-with-pasid to a IOMMU context.
+ * If a matching device-with-pasid already exists (globally),
+ * fail with -EEXIST.
+ * If pasid is 0, fails with -EINVAL.
+ * If physical device doesn't exist in domain, fail with -ENOENT.
+ */
+struct pv_iommu_attach_pasid {
+    /* IN: IOMMU context to add the device-with-pasid in */
+    uint16_t ctx_no;
+
+    /* IN: Physical device */
+    struct physdev_pci_device dev;
+
+    /* IN: pasid of the device to attach */
+    uint32_t pasid;
+};
+typedef struct pv_iommu_attach_pasid pv_iommu_attach_pasid_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_attach_pasid_t);
+
+/**
+ * IOMMU_detach_pasid (needs IOMMUCAP_pasid)
+ * detach a device-with-pasid.
+ * If the device-with-pasid doesn't exist or belong to the domain,
+ * fail with -ENOENT.
+ * If pasid is 0, fails with -EINVAL.
+ */
+struct pv_iommu_detach_pasid {
+    /* IN: Physical device */
+    struct physdev_pci_device dev;
+
+    /* pasid of the device to detach */
+    uint32_t pasid;
+};
+typedef struct pv_iommu_detach_pasid pv_iommu_detach_pasid_t;
+DEFINE_GUEST_HANDLE_STRUCT(pv_iommu_detach_pasid_t);
+
+/* long do_iommu_op(int subop, XEN_GUEST_HANDLE_PARAM(void) arg) */
+
+#endif
\ No newline at end of file
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 0ca23eca2a9c..8b1daf3fecc6 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -65,6 +65,7 @@
 #define __HYPERVISOR_xc_reserved_op       39 /* reserved for XenClient */
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
+#define __HYPERVISOR_iommu_op 					  43
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

