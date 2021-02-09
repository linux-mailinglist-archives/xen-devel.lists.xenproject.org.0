Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DEB3148A1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83136.154075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQN-0002xx-1Q; Tue, 09 Feb 2021 06:22:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83136.154075; Tue, 09 Feb 2021 06:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MQM-0002xJ-Te; Tue, 09 Feb 2021 06:22:58 +0000
Received: by outflank-mailman (input) for mailman id 83136;
 Tue, 09 Feb 2021 06:22:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MQL-0002wn-QK
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:22:57 +0000
Received: from mail-pg1-x52b.google.com (unknown [2607:f8b0:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a9ce06d-f690-4a5e-a404-5afefa9bfb0b;
 Tue, 09 Feb 2021 06:22:57 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id o38so301027pgm.9
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:22:57 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id x20sm10253509pfn.14.2021.02.08.22.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:55 -0800 (PST)
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
X-Inumbo-ID: 5a9ce06d-f690-4a5e-a404-5afefa9bfb0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=497zjM77pvF3Z9oAZHKRrRRQASb3zykCWrEq06oWuA4=;
        b=J3JXGtOrm5PoEyvBsVk+eONszRpKlS2e/fHFYsrzg7r41jB4Qhydpz4iHXCx+nR2XB
         bgZwF53kTc5vzTPgHCJnyyfoRJvrgBHi7UionQnej7Yu1P183TVntz02XzomTxMCHg3G
         mcXNNavE9b460T2UV+kLxlE9ubP6dRssCo1RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=497zjM77pvF3Z9oAZHKRrRRQASb3zykCWrEq06oWuA4=;
        b=aulAd3gJRz1Us+eG+bD2DObDE8TgpPn3j+WFcCwhANg7Nl3CBdiTazg8ae+TeoeuaG
         5b+QYYg6vqkTtX6zLqmuCFGaQ0eg3eN8rUvgIFPd86FoKicFCk7ztw39yxlZOqXRh9H2
         DCRqWv2xcrwgUtOrcK1yD0NK38UZwDfWLhWKq4nElji8bp39lndaPdWDt8/TdtIj34C5
         Ht90kCJZsQ22Vvkheoj5WMis5T1+PJHgc5w/eSoxuU/6WzJLWBlST55ncTqhv7zFxw0e
         4NxDKIswurwDVkZDhdcqBaxEUUOdvFDK8zb28TrTmfsqNBTFKiZeoUXQNKe/ldHYbUts
         mVrw==
X-Gm-Message-State: AOAM531HtiBrqMYhxGHEzF6vpbpgh3e5Y2rYIb4EH0yEKF7seRNSqf76
	2MVllqA0y0zCv4i5+G2ypP4fEA==
X-Google-Smtp-Source: ABdhPJxEw/06walO5wKH5QrYrrWevtYirMnCFq5PBC/eIi86fDszp4wESrmyrR0n6ZgmsKGnPFNlrg==
X-Received: by 2002:a63:4a1a:: with SMTP id x26mr21490368pga.260.1612851776396;
        Mon, 08 Feb 2021 22:22:56 -0800 (PST)
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
Subject: [PATCH v4 10/14] dma-direct: Add a new wrapper __dma_direct_free_pages()
Date: Tue,  9 Feb 2021 14:21:27 +0800
Message-Id: <20210209062131.2300005-11-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new wrapper __dma_direct_free_pages() that will be useful later
for dev_swiotlb_free().

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/direct.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 30ccbc08e229..a76a1a2f24da 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -75,6 +75,11 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 		min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit);
 }
 
+static void __dma_direct_free_pages(struct device *dev, struct page *page, size_t size)
+{
+	dma_free_contiguous(dev, page, size);
+}
+
 static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		gfp_t gfp)
 {
@@ -237,7 +242,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			return NULL;
 	}
 out_free_pages:
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 	return NULL;
 }
 
@@ -273,7 +278,7 @@ void dma_direct_free(struct device *dev, size_t size,
 	else if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
 		arch_dma_clear_uncached(cpu_addr, size);
 
-	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
+	__dma_direct_free_pages(dev, dma_direct_to_page(dev, dma_addr), size);
 }
 
 struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
@@ -310,7 +315,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
 out_free_pages:
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 	return NULL;
 }
 
@@ -329,7 +334,7 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 	if (force_dma_unencrypted(dev))
 		set_memory_encrypted((unsigned long)vaddr, 1 << page_order);
 
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 }
 
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
-- 
2.30.0.478.g8a0d178c01-goog


