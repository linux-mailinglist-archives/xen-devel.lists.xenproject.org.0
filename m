Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907242EB990
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 06:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62304.110347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bE-0001BO-K1; Wed, 06 Jan 2021 05:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62304.110347; Wed, 06 Jan 2021 05:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx1bE-0001AJ-7N; Wed, 06 Jan 2021 05:43:12 +0000
Received: by outflank-mailman (input) for mailman id 62304;
 Wed, 06 Jan 2021 03:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBi8=GJ=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1kwzi0-0005h6-Ds
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 03:42:04 +0000
Received: from mail-pl1-x635.google.com (unknown [2607:f8b0:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ccc18fc8-3f3e-4f31-abf4-74b673b3d06e;
 Wed, 06 Jan 2021 03:42:03 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id y8so874452plp.8
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 19:42:03 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:3e52:82ff:fe5e:cc9d])
 by smtp.gmail.com with ESMTPSA id c24sm645490pgi.71.2021.01.05.19.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 19:42:01 -0800 (PST)
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
X-Inumbo-ID: ccc18fc8-3f3e-4f31-abf4-74b673b3d06e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C4wJrXGOxQgGn7AWcQHemsUEO9lwwvSET4WpFWpbPwY=;
        b=TacCBszXScPX762D74v8tFRfid8uZoy9Ewhv1WIXnCiKTHeqMsF3/gsK/ez6Nm9+D5
         ZNRfylPSihDDipIm5LnWx2jdXSEWrWcm6YzF3IfFUBeMSe/mjhKtlhPWbfirAA9QZxzO
         m3eTqq/0mBatCIinOczTbQ1MsdcHqQ/fVoY1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C4wJrXGOxQgGn7AWcQHemsUEO9lwwvSET4WpFWpbPwY=;
        b=WIgjSFmKBZc01eb3zGo78+5FQ1bIercY7ftkoY/L6qI2bQGmWCa0ju4cfH8fUvHz5u
         C/SdcOaRcpu8Dz5q+cNiPGElQAln0ldQNfJv48j9EeHymlRxve/SjoINPTs54rhiX0/X
         Exu3O14LcV4ESVC3+bbJtxE6Fn+YJ1I5U6Gz+7QTFz9d6Ch4Iz3WQGX5Z8KKm/h6jiWv
         h/ngm6B/zkiUwGEXWLBaoe87/NTMrFSSAH0AG/3qhQnwfG3oxuHKWgTLZZqN5X0GW3M3
         IHET7doZLkf1C5+4irmKF9hNmGAsii2rUyfD5khNJckke58VsSIVf2Mr20BpUYUrYUPk
         Yx7g==
X-Gm-Message-State: AOAM5337zCHa9AWL17LeeC0F1luVnE/49gADs+pJ8Z9wLofeTE48QrPp
	Bem5FRj3GSE+UZFv3W7bsOZ1NA==
X-Google-Smtp-Source: ABdhPJzG9r3nJPEwoRZp7m2+d8QeYx0Am+0VGQ6z3BFwCJSpdV+bXsC0qFMiY2ZqvkX4It24DduLlw==
X-Received: by 2002:a17:902:e9d2:b029:db:d4f6:b581 with SMTP id 18-20020a170902e9d2b02900dbd4f6b581mr2540895plk.34.1609904522345;
        Tue, 05 Jan 2021 19:42:02 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: robh+dt@kernel.org,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	joro@8bytes.org,
	will@kernel.org,
	frowand.list@gmail.com,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: grant.likely@arm.com,
	xypron.glpk@gmx.de,
	treding@nvidia.com,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	gregkh@linuxfoundation.org,
	saravanak@google.com,
	rafael.j.wysocki@intel.com,
	heikki.krogerus@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org,
	dan.j.williams@intel.com,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	tfiga@chromium.org,
	drinkcat@chromium.org,
	Claire Chang <tientzu@chromium.org>
Subject: [RFC PATCH v3 4/6] swiotlb: Add restricted DMA alloc/free support.
Date: Wed,  6 Jan 2021 11:41:22 +0800
Message-Id: <20210106034124.30560-5-tientzu@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210106034124.30560-1-tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the functions, swiotlb_alloc and swiotlb_free to support the
memory allocation from restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h |   6 ++
 kernel/dma/direct.c     |  12 +++
 kernel/dma/swiotlb.c    | 171 +++++++++++++++++++++++++++++-----------
 3 files changed, 144 insertions(+), 45 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 5135e5636042..84fe96e40685 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -68,6 +68,12 @@ extern void swiotlb_tbl_sync_single(struct device *hwdev,
 dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
 
+void *swiotlb_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
+		    unsigned long attrs);
+
+void swiotlb_free(struct device *dev, size_t size, void *vaddr,
+		  dma_addr_t dma_addr, unsigned long attrs);
+
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
 
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 30ccbc08e229..126e9b3354d6 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -137,6 +137,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	void *ret;
 	int err;
 
+#ifdef CONFIG_SWIOTLB
+	if (unlikely(dev->dma_io_tlb_mem))
+		return swiotlb_alloc(dev, size, dma_handle, attrs);
+#endif
+
 	size = PAGE_ALIGN(size);
 	if (attrs & DMA_ATTR_NO_WARN)
 		gfp |= __GFP_NOWARN;
@@ -246,6 +251,13 @@ void dma_direct_free(struct device *dev, size_t size,
 {
 	unsigned int page_order = get_order(size);
 
+#ifdef CONFIG_SWIOTLB
+	if (unlikely(dev->dma_io_tlb_mem)) {
+		swiotlb_free(dev, size, cpu_addr, dma_addr, attrs);
+		return;
+	}
+#endif
+
 	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
 	    !force_dma_unencrypted(dev)) {
 		/* cpu_addr is a struct page cookie, not a kernel address */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1f05af09e61a..ca88ef59435d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -459,14 +459,13 @@ static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
 	}
 }
 
-phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
-		size_t mapping_size, size_t alloc_size,
-		enum dma_data_direction dir, unsigned long attrs)
+static int swiotlb_tbl_find_free_region(struct device *hwdev,
+					dma_addr_t tbl_dma_addr,
+					size_t alloc_size,
+					unsigned long attrs)
 {
 	struct io_tlb_mem *mem = get_io_tlb_mem(hwdev);
-	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, mem->start);
 	unsigned long flags;
-	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
 	int i;
 	unsigned long mask;
@@ -477,15 +476,6 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	if (no_iotlb_memory && !hwdev->dma_io_tlb_mem)
 		panic("Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer");
 
-	if (mem_encrypt_active())
-		pr_warn_once("Memory encryption is active and system is using DMA bounce buffers\n");
-
-	if (mapping_size > alloc_size) {
-		dev_warn_once(hwdev, "Invalid sizes (mapping: %zd bytes, alloc: %zd bytes)",
-			      mapping_size, alloc_size);
-		return (phys_addr_t)DMA_MAPPING_ERROR;
-	}
-
 	mask = dma_get_seg_boundary(hwdev);
 
 	tbl_dma_addr &= mask;
@@ -547,7 +537,6 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 				mem->list[i] = 0;
 			for (i = index - 1; (OFFSET(i, IO_TLB_SEGSIZE) != IO_TLB_SEGSIZE - 1) && mem->list[i]; i--)
 				mem->list[i] = ++count;
-			tlb_addr = mem->start + (index << IO_TLB_SHIFT);
 
 			/*
 			 * Update the indices to avoid searching in the next
@@ -570,45 +559,21 @@ phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
 	if (!(attrs & DMA_ATTR_NO_WARN) && printk_ratelimit())
 		dev_warn(hwdev, "swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
 			 alloc_size, mem->nslabs, tmp_io_tlb_used);
-	return (phys_addr_t)DMA_MAPPING_ERROR;
+	return -ENOMEM;
+
 found:
 	mem->used += nslots;
 	spin_unlock_irqrestore(&mem->lock, flags);
 
-	/*
-	 * Save away the mapping from the original address to the DMA address.
-	 * This is needed when we sync the memory.  Then we sync the buffer if
-	 * needed.
-	 */
-	for (i = 0; i < nslots; i++)
-		mem->orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
-
-	return tlb_addr;
+	return index;
 }
 
-/*
- * tlb_addr is the physical address of the bounce buffer to unmap.
- */
-void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
-			      size_t mapping_size, size_t alloc_size,
-			      enum dma_data_direction dir, unsigned long attrs)
+static void swiotlb_tbl_release_region(struct device *hwdev, int index,
+				       size_t size)
 {
 	struct io_tlb_mem *mem = get_io_tlb_mem(hwdev);
 	unsigned long flags;
-	int i, count, nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
-	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
-	phys_addr_t orig_addr = mem->orig_addr[index];
-
-	/*
-	 * First, sync the memory before unmapping the entry
-	 */
-	if (orig_addr != INVALID_PHYS_ADDR &&
-	    !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-	    ((dir == DMA_FROM_DEVICE) || (dir == DMA_BIDIRECTIONAL)))
-		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_FROM_DEVICE);
+	int i, count, nslots = ALIGN(size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
 
 	/*
 	 * Return the buffer to the free list by setting the corresponding
@@ -640,6 +605,69 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 	spin_unlock_irqrestore(&mem->lock, flags);
 }
 
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
+		size_t mapping_size, size_t alloc_size,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	struct io_tlb_mem *mem = get_io_tlb_mem(hwdev);
+	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, mem->start);
+	phys_addr_t tlb_addr;
+	unsigned int nslots, index;
+	int i;
+
+	if (mem_encrypt_active())
+		pr_warn_once("Memory encryption is active and system is using DMA bounce buffers\n");
+
+	if (mapping_size > alloc_size) {
+		dev_warn_once(hwdev, "Invalid sizes (mapping: %zd bytes, alloc: %zd bytes)",
+			      mapping_size, alloc_size);
+		return (phys_addr_t)DMA_MAPPING_ERROR;
+	}
+
+	index = swiotlb_tbl_find_free_region(hwdev, tbl_dma_addr, alloc_size,
+					     attrs);
+	if (index < 0)
+		return (phys_addr_t)DMA_MAPPING_ERROR;
+
+	tlb_addr = mem->start + (index << IO_TLB_SHIFT);
+
+	/*
+	 * Save away the mapping from the original address to the DMA address.
+	 * This is needed when we sync the memory.  Then we sync the buffer if
+	 * needed.
+	 */
+	nslots = ALIGN(alloc_size, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
+	for (i = 0; i < nslots; i++)
+		mem->orig_addr[index+i] = orig_addr + (i << IO_TLB_SHIFT);
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
+		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_TO_DEVICE);
+
+	return tlb_addr;
+}
+
+/*
+ * tlb_addr is the physical address of the bounce buffer to unmap.
+ */
+void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
+			      size_t mapping_size, size_t alloc_size,
+			      enum dma_data_direction dir, unsigned long attrs)
+{
+	struct io_tlb_mem *mem = get_io_tlb_mem(hwdev);
+	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
+	phys_addr_t orig_addr = mem->orig_addr[index];
+
+	/*
+	 * First, sync the memory before unmapping the entry
+	 */
+	if (orig_addr != INVALID_PHYS_ADDR &&
+	    !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+	    ((dir == DMA_FROM_DEVICE) || (dir == DMA_BIDIRECTIONAL)))
+		swiotlb_bounce(orig_addr, tlb_addr, mapping_size, DMA_FROM_DEVICE);
+
+	swiotlb_tbl_release_region(hwdev, index, alloc_size);
+}
+
 void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 			     size_t size, enum dma_data_direction dir,
 			     enum dma_sync_target target)
@@ -706,6 +734,59 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 	return dma_addr;
 }
 
+void *swiotlb_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
+		    unsigned long attrs)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	int index;
+	void *vaddr;
+	phys_addr_t tlb_addr;
+
+	size = PAGE_ALIGN(size);
+	index = swiotlb_tbl_find_free_region(dev, mem->start, size, attrs);
+	if (index < 0)
+		return NULL;
+
+	tlb_addr = mem->start + (index << IO_TLB_SHIFT);
+	*dma_handle = phys_to_dma_unencrypted(dev, tlb_addr);
+
+	if (!dev_is_dma_coherent(dev)) {
+		unsigned long pfn = PFN_DOWN(tlb_addr);
+
+		/* remove any dirty cache lines on the kernel alias */
+		arch_dma_prep_coherent(pfn_to_page(pfn), size);
+
+		/* create a coherent mapping */
+		vaddr = dma_common_contiguous_remap(
+			pfn_to_page(pfn), size,
+			dma_pgprot(dev, PAGE_KERNEL, attrs),
+			__builtin_return_address(0));
+		if (!vaddr) {
+			swiotlb_tbl_release_region(dev, index, size);
+			return NULL;
+		}
+	} else {
+		vaddr = phys_to_virt(tlb_addr);
+	}
+
+	memset(vaddr, 0, size);
+
+	return vaddr;
+}
+
+void swiotlb_free(struct device *dev, size_t size, void *vaddr,
+		  dma_addr_t dma_addr, unsigned long attrs)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	unsigned int index;
+
+	if (!dev_is_dma_coherent(dev))
+		vunmap(vaddr);
+
+	index = (dma_addr - mem->start) >> IO_TLB_SHIFT;
+	swiotlb_tbl_release_region(dev, index, PAGE_ALIGN(size));
+}
+
 size_t swiotlb_max_mapping_size(struct device *dev)
 {
 	return ((size_t)1 << IO_TLB_SHIFT) * IO_TLB_SEGSIZE;
-- 
2.29.2.729.g45daf8777d-goog


