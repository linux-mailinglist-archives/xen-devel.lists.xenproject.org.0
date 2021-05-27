Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40B392EE2
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133271.248495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFfv-0004ku-6G; Thu, 27 May 2021 13:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133271.248495; Thu, 27 May 2021 13:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFfu-0004fV-Vl; Thu, 27 May 2021 13:03:46 +0000
Received: by outflank-mailman (input) for mailman id 133271;
 Thu, 27 May 2021 13:03:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spZp=KW=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lmFft-0004HJ-Mn
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:03:45 +0000
Received: from mail-pf1-x435.google.com (unknown [2607:f8b0:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a47b63ad-8d60-4159-92cd-eadc6b6b963a;
 Thu, 27 May 2021 13:03:45 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 22so509319pfv.11
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 06:03:44 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a93:378d:9a9e:3b70])
 by smtp.gmail.com with UTF8SMTPSA id w15sm2015155pjy.1.2021.05.27.06.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 06:03:41 -0700 (PDT)
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
X-Inumbo-ID: a47b63ad-8d60-4159-92cd-eadc6b6b963a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7+uI7rGPgfSKn+aVdUzTy5/dZn0TD9snxYJvtDtWr8=;
        b=ftmREmcxrJM5ghdWu3uu6RoVOQmn/FmRG0fXdD0sAjbx0bczGkzwvRTurlvaYuIvJW
         x3lcL0ttraMgqRb6RQUndSyEBiGIY3jtWjTqxgCUrCG/1jwY14bstcfPs5KZ9RhvRj5W
         T2wJrb10vnObIKglZGitAlnSSqiKkQCQp8AYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7+uI7rGPgfSKn+aVdUzTy5/dZn0TD9snxYJvtDtWr8=;
        b=AJ60oWOW8piSmO39i7ejv1tqCzZqTuSBfDixlrQz4BElRNB50M8Wu8U8bF7fkFRuHK
         duYlI/V9jYR4QkgiR4fZiFw9X9NZ3F5qj0btcvJQE+fKbXGsDNwTevvOK98pBj/QR6m+
         I+qFDPTtlfQhbAztebHWcdodhFgTM06dXazBIrO5M6KKE3kgDCtVOc5cQut7sTlgEhyD
         wYZFvuDr3r2XRvb5NmwqnjC9XnNcgIsQFWtjDNJPn3HI9r0LSP3YQA9vqCw5iv/BiCWH
         cHxW/Bdllp7NSwCaog6L6AaQPOeSs0ahvPf+g+vVhSV/YAEgTUQp8kt0L8AP8efKch9k
         lBSQ==
X-Gm-Message-State: AOAM531hm508AyoEdvnrqNmUmiIZIFh+pqVNdYhy7M7800rVvTYLdhi+
	vHMemR6o1b3T+Osw8I6UClduHw==
X-Google-Smtp-Source: ABdhPJwFMAyQyClkgtD2WU3AOT0NSiYpDWGkYsiRLX3TSIJ7iJhjuPVvZAr31+YEfks0HMDDaEOArA==
X-Received: by 2002:a05:6a00:216a:b029:2df:3461:4ac3 with SMTP id r10-20020a056a00216ab02902df34614ac3mr3590982pff.80.1622120624345;
        Thu, 27 May 2021 06:03:44 -0700 (PDT)
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
Subject: [PATCH v8 11/15] dma-direct: Add a new wrapper __dma_direct_free_pages()
Date: Thu, 27 May 2021 21:03:25 +0800
Message-Id: <20210527130329.1853588-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new wrapper __dma_direct_free_pages() that will be useful later
for swiotlb_free().

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/direct.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 078f7087e466..eb4098323bbc 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -75,6 +75,12 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
 		min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit);
 }
 
+static void __dma_direct_free_pages(struct device *dev, struct page *page,
+				    size_t size)
+{
+	dma_free_contiguous(dev, page, size);
+}
+
 static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 		gfp_t gfp)
 {
@@ -237,7 +243,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			return NULL;
 	}
 out_free_pages:
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 	return NULL;
 }
 
@@ -273,7 +279,7 @@ void dma_direct_free(struct device *dev, size_t size,
 	else if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
 		arch_dma_clear_uncached(cpu_addr, size);
 
-	dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
+	__dma_direct_free_pages(dev, dma_direct_to_page(dev, dma_addr), size);
 }
 
 struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
@@ -310,7 +316,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return page;
 out_free_pages:
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 	return NULL;
 }
 
@@ -329,7 +335,7 @@ void dma_direct_free_pages(struct device *dev, size_t size,
 	if (force_dma_unencrypted(dev))
 		set_memory_encrypted((unsigned long)vaddr, 1 << page_order);
 
-	dma_free_contiguous(dev, page, size);
+	__dma_direct_free_pages(dev, page, size);
 }
 
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
-- 
2.31.1.818.g46aad6cb9e-goog


