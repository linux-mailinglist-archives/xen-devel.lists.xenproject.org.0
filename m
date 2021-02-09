Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226E314899
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83132.154027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPu-0002Zo-Ib; Tue, 09 Feb 2021 06:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83132.154027; Tue, 09 Feb 2021 06:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPu-0002Z6-ET; Tue, 09 Feb 2021 06:22:30 +0000
Received: by outflank-mailman (input) for mailman id 83132;
 Tue, 09 Feb 2021 06:22:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MPs-0002Xy-F2
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:22:28 +0000
Received: from mail-pj1-x1031.google.com (unknown [2607:f8b0:4864:20::1031])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08b5f9aa-1429-40ab-93ff-b5fa52d14e3d;
 Tue, 09 Feb 2021 06:22:27 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id gb24so976520pjb.4
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:22:27 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id np7sm1080411pjb.10.2021.02.08.22.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:25 -0800 (PST)
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
X-Inumbo-ID: 08b5f9aa-1429-40ab-93ff-b5fa52d14e3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxLFhhx42ZtNAWWPxxTC2YTMXHtyxeDPJClSNQiYoYc=;
        b=FOjc62yoUhk/LYUclkinZZ4zDvKpeGo1x74CjLhqDxql67icfdZqyBr48BDMmzkMqR
         tA+flicJ3qCGmrksh4BzQ5Am4hl3t7sFnye0tmSkf0JhPfYSoJrQn4ouvbgIPDxqcZT9
         22NHFR6mKzgKsRHbHqBZhVhBnyuYHLbdeoeHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxLFhhx42ZtNAWWPxxTC2YTMXHtyxeDPJClSNQiYoYc=;
        b=QmhH21nsdCyP3anOIGhloWuW3HcMHlzz6pUCJ8ElxmyskhU20XjltIddFoivValrAn
         o68WFMa3cHaPf9XW+VlSZb3MP7JUP+XVy5DB6PgPDzKjtxXH2MVEDpwI6HjuFvdu5ip6
         knxPnONCYq8l6nseSHT5kCGjIIcUx5oWOWGYJJo6NZZujMs4XnNi0JPsfzQuBf/75JWQ
         vrQPJf/fzOwyZowhwCNu/EPUlcupu0iNd6BkrKfVRYhWAXHkIT3FTOz/+pP5eAv6huw5
         QXYIQsHMD11VMsDwB5QbvSPlb9+Sr4V6CVFEp9J5spgROotxWnAK042uqQav6jlZPBkI
         OOrg==
X-Gm-Message-State: AOAM532b1R9/QSf3LxfQW98JtlWG4xbYW2jJhP6JsMCvzO0KKwHh5cEp
	bb3P36sg3aBUB0QoVnadLo3/mA==
X-Google-Smtp-Source: ABdhPJwDHlCULV4tTgyY9CKwnf/NbNTRufsz7Pi36U/uwqUNeuQrkhr5EaPoNzogQlT61PzYunqO5A==
X-Received: by 2002:a17:90a:3188:: with SMTP id j8mr2559404pjb.53.1612851746343;
        Mon, 08 Feb 2021 22:22:26 -0800 (PST)
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
	Claire Chang <tientzu@chromium.org>
Subject: [PATCH v4 06/14] swiotlb: Add restricted DMA pool
Date: Tue,  9 Feb 2021 14:21:23 +0800
Message-Id: <20210209062131.2300005-7-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initialization function to create restricted DMA pools from
matching reserved-memory nodes.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/device.h |  4 ++
 kernel/dma/swiotlb.c   | 94 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 7619a84f8ce4..08d440627b93 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -415,6 +415,7 @@ struct dev_links_info {
  * @dma_pools:	Dma pools (if dma'ble device).
  * @dma_mem:	Internal for coherent mem override.
  * @cma_area:	Contiguous memory area for dma allocations
+ * @dev_swiotlb: Internal for swiotlb override.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -517,6 +518,9 @@ struct device {
 #ifdef CONFIG_DMA_CMA
 	struct cma *cma_area;		/* contiguous memory area for dma
 					   allocations */
+#endif
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	struct swiotlb *dev_swiotlb;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index dc37951c6924..3a17451c5981 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -39,6 +39,13 @@
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 #endif
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/slab.h>
+#endif
 
 #include <asm/io.h>
 #include <asm/dma.h>
@@ -75,7 +82,8 @@ enum swiotlb_force swiotlb_force;
  *              range check to see if the memory was in fact allocated by this
  *              API.
  * @nslabs:     The number of IO TLB blocks (in groups of 64) between @start and
- *              @end. This is command line adjustable via setup_io_tlb_npages.
+ *              @end. For default swiotlb, this is command line adjustable via
+ *              setup_io_tlb_npages.
  * @used:       The number of used IO TLB block.
  * @list:       The free list describing the number of free entries available
  *              from each index.
@@ -780,3 +788,87 @@ static int __init swiotlb_create_default_debugfs(void)
 
 late_initcall(swiotlb_create_default_debugfs);
 #endif
+
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
+				    struct device *dev)
+{
+	struct swiotlb *swiotlb = rmem->priv;
+	int ret;
+
+	if (dev->dev_swiotlb)
+		return -EBUSY;
+
+	/* Since multiple devices can share the same pool, the private data,
+	 * swiotlb struct, will be initialized by the first device attached
+	 * to it.
+	 */
+	if (!swiotlb) {
+		swiotlb = kzalloc(sizeof(*swiotlb), GFP_KERNEL);
+		if (!swiotlb)
+			return -ENOMEM;
+#ifdef CONFIG_ARM
+		unsigned long pfn = PHYS_PFN(reme->base);
+
+		if (!PageHighMem(pfn_to_page(pfn))) {
+			ret = -EINVAL;
+			goto cleanup;
+		}
+#endif /* CONFIG_ARM */
+
+		ret = swiotlb_init_tlb_pool(swiotlb, rmem->base, rmem->size);
+		if (ret)
+			goto cleanup;
+
+		rmem->priv = swiotlb;
+	}
+
+#ifdef CONFIG_DEBUG_FS
+	swiotlb_create_debugfs(swiotlb, rmem->name, default_swiotlb.debugfs);
+#endif /* CONFIG_DEBUG_FS */
+
+	dev->dev_swiotlb = swiotlb;
+
+	return 0;
+
+cleanup:
+	kfree(swiotlb);
+
+	return ret;
+}
+
+static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
+					struct device *dev)
+{
+	if (!dev)
+		return;
+
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove_recursive(dev->dev_swiotlb->debugfs);
+#endif /* CONFIG_DEBUG_FS */
+	dev->dev_swiotlb = NULL;
+}
+
+static const struct reserved_mem_ops rmem_swiotlb_ops = {
+	.device_init = rmem_swiotlb_device_init,
+	.device_release = rmem_swiotlb_device_release,
+};
+
+static int __init rmem_swiotlb_setup(struct reserved_mem *rmem)
+{
+	unsigned long node = rmem->fdt_node;
+
+	if (of_get_flat_dt_prop(node, "reusable", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,cma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "linux,dma-default", NULL) ||
+	    of_get_flat_dt_prop(node, "no-map", NULL))
+		return -EINVAL;
+
+	rmem->ops = &rmem_swiotlb_ops;
+	pr_info("Reserved memory: created device swiotlb memory pool at %pa, size %ld MiB\n",
+		&rmem->base, (unsigned long)rmem->size / SZ_1M);
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
-- 
2.30.0.478.g8a0d178c01-goog


