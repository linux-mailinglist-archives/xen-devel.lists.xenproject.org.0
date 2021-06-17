Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB53AAC17
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 08:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143636.264664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlVM-0005IU-W0; Thu, 17 Jun 2021 06:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143636.264664; Thu, 17 Jun 2021 06:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlVM-0005FB-Rb; Thu, 17 Jun 2021 06:27:56 +0000
Received: by outflank-mailman (input) for mailman id 143636;
 Thu, 17 Jun 2021 06:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3wh=LL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1ltlVL-0003Kj-Ay
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 06:27:55 +0000
Received: from mail-pf1-x42a.google.com (unknown [2607:f8b0:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3300be8-72b2-4530-8b42-58876100a5c0;
 Thu, 17 Jun 2021 06:27:48 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id k15so4168328pfp.6
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 23:27:48 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:e349:a6ae:d3d0:1621])
 by smtp.gmail.com with UTF8SMTPSA id b5sm802199pgh.41.2021.06.16.23.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 23:27:46 -0700 (PDT)
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
X-Inumbo-ID: a3300be8-72b2-4530-8b42-58876100a5c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vL93q1YbKGNvBEIa7UrABp5ApsQUTAD5UUYTnsdEB3Q=;
        b=CtB2mooENzTC4i0L5rpa1zNICqjYFPsIZqEbEkBKAJa8+qd9w2N9/n64NCFrt9j45u
         Ih26Uj+R6NzicgrImuSogNhtDWEP6supbvO5mJkr1dAyUpDH0cFI8DnqnJG9Y3c4jeK7
         STp7xwS/W8U1n8UjbDMotkZIyUJH71Vl6CqRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vL93q1YbKGNvBEIa7UrABp5ApsQUTAD5UUYTnsdEB3Q=;
        b=hrjoAg3MIQBh3+JM8bg4TIaGxNfsREKSMP+kNdlchlKUEe84DISoPsKAlqfHt79DmK
         jlkIIxZ8a3ZjrM+dNapDgrXtYoP9yz4DVF/s3+EUmQ3imTwQtGnQBc9l1tpUGha/ErK5
         a3NtB89VtKlRogD0UuEZL1lOXd+qH59rsOIqW/uSVn12Z90YWc++DISBjxhAORRHgQj9
         M4vtA/2Wshsupch7qVbDz21VtmdIsZ+ARM8H+16FE3p8xxwKNBnBHYDz+ZxVkxZasrjM
         nFaZKHvAZQ0trF+UyjhkTblASQ64zRCfQLBJtKYn8E7hXi1c+dziBkMt0+XoAdrOjilR
         5lnw==
X-Gm-Message-State: AOAM532888g9W36AKE427k2aoLKDHdsiYyMd33N0yhirtU6t6HEtdOBT
	vVTWbvs0gx7OnCfSkrWmBpwOXg==
X-Google-Smtp-Source: ABdhPJwOXzNBlzTLYb2sPRtjxMXEGiwV/XPAbxRS65Sr0Y1ZJRRWjSo71Ji+g4hEO7fWdP+p0wiGoQ==
X-Received: by 2002:a05:6a00:b8a:b029:2ec:761e:33e3 with SMTP id g10-20020a056a000b8ab02902ec761e33e3mr3577341pfj.35.1623911267361;
        Wed, 16 Jun 2021 23:27:47 -0700 (PDT)
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
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v13 07/12] swiotlb: Move alloc_size to swiotlb_find_slots
Date: Thu, 17 Jun 2021 14:26:30 +0800
Message-Id: <20210617062635.1660944-8-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210617062635.1660944-1-tientzu@chromium.org>
References: <20210617062635.1660944-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename find_slots to swiotlb_find_slots and move the maintenance of
alloc_size to it for better code reusability later.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 kernel/dma/swiotlb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 13891d5de8c9..89049d021d0d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -432,8 +432,8 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
  * Find a suitable number of IO TLB entries size that will fit this request and
  * allocate a buffer from that IO TLB pool.
  */
-static int find_slots(struct device *dev, phys_addr_t orig_addr,
-		size_t alloc_size)
+static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
+			      size_t alloc_size)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned long boundary_mask = dma_get_seg_boundary(dev);
@@ -488,8 +488,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 	return -1;
 
 found:
-	for (i = index; i < index + nslots; i++)
+	for (i = index; i < index + nslots; i++) {
 		mem->slots[i].list = 0;
+		mem->slots[i].alloc_size =
+			alloc_size - ((i - index) << IO_TLB_SHIFT);
+	}
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
@@ -530,7 +533,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
-	index = find_slots(dev, orig_addr, alloc_size + offset);
+	index = swiotlb_find_slots(dev, orig_addr, alloc_size + offset);
 	if (index == -1) {
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
@@ -544,11 +547,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * This is needed when we sync the memory.  Then we sync the buffer if
 	 * needed.
 	 */
-	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
+	for (i = 0; i < nr_slots(alloc_size + offset); i++)
 		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
-		mem->slots[index + i].alloc_size =
-			alloc_size - (i << IO_TLB_SHIFT);
-	}
 	tlb_addr = slot_addr(mem->start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-- 
2.32.0.288.g62a8d224e6-goog


