Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112FB3B330D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 17:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146897.270482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRi4-0000Y1-Jx; Thu, 24 Jun 2021 15:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146897.270482; Thu, 24 Jun 2021 15:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRi4-0000Vv-GI; Thu, 24 Jun 2021 15:56:08 +0000
Received: by outflank-mailman (input) for mailman id 146897;
 Thu, 24 Jun 2021 15:56:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5fo=LS=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lwRi3-0000Nz-DU
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:56:07 +0000
Received: from mail-pj1-x102a.google.com (unknown [2607:f8b0:4864:20::102a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf6f5d6b-06f2-4a02-802c-1fa6e7d74328;
 Thu, 24 Jun 2021 15:56:06 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id l11so3725150pji.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jun 2021 08:56:06 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id v21sm3445482pfu.77.2021.06.24.08.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:56:05 -0700 (PDT)
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
X-Inumbo-ID: bf6f5d6b-06f2-4a02-802c-1fa6e7d74328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+yhAgwjq5z1dAtXH3bS6halUgnpsXrGer7IGToK2ifg=;
        b=amIqlLHGrUt8djVOf4yys2+imq4cPT7hCVf0b/QuzNNknjD6TQ5PH/FESx40Jfm2Sy
         e9vppGwlrw0CYkZwPegdpkHKAhnvdkrDfv3mH1s+b6/aR0Bz86Elj1k+BXGZoNp8MZsX
         qL6/glvhzEwDwjhnM7F3SEdYPjqJ2hAkhfF50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yhAgwjq5z1dAtXH3bS6halUgnpsXrGer7IGToK2ifg=;
        b=nKTtwv+6uRp80/Twgs3na7JPUiFFtLBwvcDfhEImQr0rH3Etov9E9FVkPnr3mb26rc
         LXyD7oFAxfvnMf8MRLL+unbYZtOQ3V3nzKsXBAud9IKpqcqKSx7ZDOKzORn1mP3SAyG8
         hbr81EsZPHL5j2y6MyhfyKoxL16a3Z5SfPmWMNIOvqDLrWxHbwNi3x9rtpgaUnN/CDkb
         kQR+1v8lMeIzyO6s3j6SFtyY0qlh7g9PZsiBnpFOziEF5btjgkrHsihZoA3aObpSuw/0
         82XBCsSLWrMWFITW3b+Ik+s0sPWuOJwC93w7P2WNDdL8DSRSE7ekB8WFXTEd/fnWKg63
         alLA==
X-Gm-Message-State: AOAM530SVeMCASfsL20+8tq64QMbUZzph924vcjXj7zAe7nOn4LLtZUz
	aWJHXXmYvN3eGL9aoPKw/HClbQ==
X-Google-Smtp-Source: ABdhPJx5buaD+Aj0oQHu9wgvwnByTOy2l3ZvCASGd6R1iZ+Ag+wNfG3I5+8ywo8QG6jWoo4vpvXgOg==
X-Received: by 2002:a17:902:d483:b029:127:95c1:19d8 with SMTP id c3-20020a170902d483b029012795c119d8mr4930234plg.42.1624550165683;
        Thu, 24 Jun 2021 08:56:05 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	tfiga@chromium.org,
	bskeggs@redhat.com,
	bhelgaas@google.com,
	chris@chris-wilson.co.uk,
	tientzu@chromium.org,
	daniel@ffwll.ch,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jxgao@google.com,
	joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	thomas.lendacky@amd.com,
	quic_qiancai@quicinc.com
Subject: [PATCH v15 03/12] swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
Date: Thu, 24 Jun 2021 23:55:17 +0800
Message-Id: <20210624155526.2775863-4-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624155526.2775863-1-tientzu@chromium.org>
References: <20210624155526.2775863-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always have the pointer to the swiotlb pool used in struct device. This
could help simplify the code for other pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/base/core.c    | 4 ++++
 include/linux/device.h | 4 ++++
 kernel/dma/swiotlb.c   | 8 ++++----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f29839382f81..cb3123e3954d 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -27,6 +27,7 @@
 #include <linux/netdevice.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
+#include <linux/swiotlb.h>
 #include <linux/sysfs.h>
 #include <linux/dma-map-ops.h> /* for dma_default_coherent */
 
@@ -2736,6 +2737,9 @@ void device_initialize(struct device *dev)
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	dev->dma_coherent = dma_default_coherent;
 #endif
+#ifdef CONFIG_SWIOTLB
+	dev->dma_io_tlb_mem = io_tlb_default_mem;
+#endif
 }
 EXPORT_SYMBOL_GPL(device_initialize);
 
diff --git a/include/linux/device.h b/include/linux/device.h
index ba660731bd25..240d652a0696 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -416,6 +416,7 @@ struct dev_links_info {
  * @dma_pools:	Dma pools (if dma'ble device).
  * @dma_mem:	Internal for coherent mem override.
  * @cma_area:	Contiguous memory area for dma allocations
+ * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver use.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -518,6 +519,9 @@ struct device {
 #ifdef CONFIG_DMA_CMA
 	struct cma *cma_area;		/* contiguous memory area for dma
 					   allocations */
+#endif
+#ifdef CONFIG_SWIOTLB
+	struct io_tlb_mem *dma_io_tlb_mem;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ede66df6835b..72a4289faed1 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -340,7 +340,7 @@ void __init swiotlb_exit(void)
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
 			   enum dma_data_direction dir)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	unsigned int offset = (tlb_addr - mem->start) & (IO_TLB_SIZE - 1);
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
@@ -431,7 +431,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
 static int find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
 	dma_addr_t tbl_dma_addr =
 		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -508,7 +508,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		size_t mapping_size, size_t alloc_size,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
 	unsigned int i;
 	int index;
@@ -559,7 +559,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
 			      unsigned long attrs)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
+	struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
 	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
-- 
2.32.0.288.g62a8d224e6-goog


