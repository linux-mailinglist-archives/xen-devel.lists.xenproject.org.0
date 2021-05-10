Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B4378053
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 11:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125089.235549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2aQ-0004hI-5s; Mon, 10 May 2021 09:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125089.235549; Mon, 10 May 2021 09:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2aQ-0004dg-0l; Mon, 10 May 2021 09:52:26 +0000
Received: by outflank-mailman (input) for mailman id 125089;
 Mon, 10 May 2021 09:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NcLl=KF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lg2aP-0004bT-3d
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 09:52:25 +0000
Received: from mail-pl1-x62b.google.com (unknown [2607:f8b0:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1a4f09b-a12b-4939-8f69-9d6128ba80a4;
 Mon, 10 May 2021 09:52:24 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id n16so8860989plf.7
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 02:52:24 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a524:abe8:94e3:5601])
 by smtp.gmail.com with UTF8SMTPSA id f6sm10227287pfe.74.2021.05.10.02.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 02:52:23 -0700 (PDT)
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
X-Inumbo-ID: f1a4f09b-a12b-4939-8f69-9d6128ba80a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3YaoLVJ/BlS2jGrFuaf+HAqZru6rV2ab/VHFDnxpz5s=;
        b=I10YUhrVFYEnBb151sjznBCAywSiwwuXX1ra65r+6Dp7kLXlkJTjZj64MC39DrflfN
         L6B6coAmKhXT3uzYOIMy3hHP2AqrBakoEoGo6H/hyImCZ+Vs9dEj0AdH5ph0QtkKY+Bg
         SjBGhbtFT0tOcMKvv+2FyMSaO8PoMl7ClMI8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3YaoLVJ/BlS2jGrFuaf+HAqZru6rV2ab/VHFDnxpz5s=;
        b=FoO2R8++42yVAfcdx2QNNhUzxNPEjSup10L064MRyPl794OWeI+uGWf3f4vikhPeiE
         tloW8gqVHLO2Y5UvsVOsrBbXQMLbvMo3s1U6uu9PXKYyGFQzZ+AepEamAaicfi9VaVwQ
         L3uKjCqAYeuyqZVvXBsJjjFtLlD65IhelcjJXR+vscIK0zIRdOXnSqgQPatX2au5wBaj
         tPwcJufFPZMSYnb+21ZnZx4RYhsyTiTLjbm5Eb89bnnvIqxHFxG/jD12mbh1i4EFKdUh
         L/hn7Rmj3Ct6jiVqWE3lNP4wdjGtnLe58QjdhDVVjFnM/kPDDBhl8lrl+54TJFd9EXqz
         Tzfg==
X-Gm-Message-State: AOAM530kah28iH2rdaYfQu9WijEt894fMyGQrfh47tz8YLssLGKhDjYC
	4xtKlcEyepzflozfAfouGhMFRQ==
X-Google-Smtp-Source: ABdhPJyvBg/0ILrSmUeqEzW7Fk7bklgK3teEOUZ3TKSkxe3vq+G4eTcWybVNarpL8KZA9dCjKF/+aQ==
X-Received: by 2002:a17:90a:246:: with SMTP id t6mr27381833pje.228.1620640343682;
        Mon, 10 May 2021 02:52:23 -0700 (PDT)
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
	nouveau@lists.freedesktop.org,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v6 12/15] swiotlb: Add restricted DMA alloc/free support.
Date: Mon, 10 May 2021 17:50:23 +0800
Message-Id: <20210510095026.3477496-13-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210510095026.3477496-1-tientzu@chromium.org>
References: <20210510095026.3477496-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the functions, swiotlb_{alloc,free} to support the memory allocation
from restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h |  4 ++++
 kernel/dma/swiotlb.c    | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 0c5a18d9cf89..e8cf49bd90c5 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -134,6 +134,10 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long size);
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *swiotlb_alloc(struct device *dev, size_t size);
+bool swiotlb_free(struct device *dev, struct page *page, size_t size);
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index fa11787e4b95..d99d5f902259 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -457,8 +457,9 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 
 	index = wrap = wrap_index(mem, ALIGN(mem->index, stride));
 	do {
-		if ((slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
-		    (orig_addr & iotlb_align_mask)) {
+		if (orig_addr &&
+		    (slot_addr(tbl_dma_addr, index) & iotlb_align_mask) !=
+			    (orig_addr & iotlb_align_mask)) {
 			index = wrap_index(mem, index + 1);
 			continue;
 		}
@@ -701,6 +702,36 @@ late_initcall(swiotlb_create_default_debugfs);
 #endif
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+struct page *swiotlb_alloc(struct device *dev, size_t size)
+{
+	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	phys_addr_t tlb_addr;
+	int index;
+
+	if (!mem)
+		return NULL;
+
+	index = find_slots(dev, 0, size);
+	if (index == -1)
+		return NULL;
+
+	tlb_addr = slot_addr(mem->start, index);
+
+	return pfn_to_page(PFN_DOWN(tlb_addr));
+}
+
+bool swiotlb_free(struct device *dev, struct page *page, size_t size)
+{
+	phys_addr_t tlb_addr = page_to_phys(page);
+
+	if (!is_swiotlb_buffer(dev, tlb_addr))
+		return false;
+
+	release_slots(dev, tlb_addr);
+
+	return true;
+}
+
 static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
-- 
2.31.1.607.g51e8a6a459-goog


