Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65110387241
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128761.241710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litRt-0005mZ-If; Tue, 18 May 2021 06:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128761.241710; Tue, 18 May 2021 06:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litRt-0005ir-EX; Tue, 18 May 2021 06:43:25 +0000
Received: by outflank-mailman (input) for mailman id 128761;
 Tue, 18 May 2021 06:43:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ/V=KN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1litRr-0003sj-3G
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:43:23 +0000
Received: from mail-pj1-x102a.google.com (unknown [2607:f8b0:4864:20::102a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2042684-1f8d-4605-bd86-e70284f48dec;
 Tue, 18 May 2021 06:43:15 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id t11so5004161pjm.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 23:43:15 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:f284:b819:54ca:c198])
 by smtp.gmail.com with UTF8SMTPSA id k10sm4407807pfu.175.2021.05.17.23.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:43:14 -0700 (PDT)
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
X-Inumbo-ID: d2042684-1f8d-4605-bd86-e70284f48dec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=um8C1f1vzKtWMFhzfAaBUmj42oNwrbNCekMrLvRdk1U=;
        b=Nz40zJd0pKEYV/k8IK4lTQTRDZOUiOUwbA1Arvy6QUQBlPK9z/7NLsKlNL3/1e+jPn
         Rvsno7nzSv10lOGgseQXJjtNssSPkX7wvn5b3le+v615CbL79fsk9Hc2gr53iJRIIsL9
         joN4AoOubYBk2J2DPKHOuv42MtUoFxjdy1UIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=um8C1f1vzKtWMFhzfAaBUmj42oNwrbNCekMrLvRdk1U=;
        b=i08iY70btLs1Gug3jZtz+b4gupPMdNifd8jvTlQ7O3PfLdG7kmgOdIiurmUSEE3I1x
         diJIdQ5+fchQwZNJtbtOlrpzM44TWNnLsPnM712fmCx8fO8dSqrl0d2Nmyl5RC+4NcQI
         MHoFyrX4ArGkM3NpwxQimLtIGcohtlBI5W9GdkAympipM+jK0u4FO/BT8X5aEaXM2V9/
         8aIufDVizO+gUOpO2u1PJqeXFbpmYQOe7PiOcXyRiIaO/JKAkVZJoKay1kMmIO2cO6ZQ
         haW9b8PY3bhMFv/65199BAphUPnnWGJ4ukPr6Fz+sEKM5v6PaIpM0YHDpsfCzdtYx+6l
         YYWQ==
X-Gm-Message-State: AOAM530ANga3vxoX5CnNkw9EYj6QBPVdNE0pREF8uTuDUQgp8HTXsw+O
	rw0guvPlTzVg2rWkNEVg6V3ZRA==
X-Google-Smtp-Source: ABdhPJzOUb2or4i3Atyb+wUWqF92M1zBsVH9PXp2RXUL88l16TO6O0yu3WeWl6JLm0exg/RwsGT9VA==
X-Received: by 2002:a17:90a:f987:: with SMTP id cq7mr1872645pjb.30.1621320194605;
        Mon, 17 May 2021 23:43:14 -0700 (PDT)
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
Subject: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
Date: Tue, 18 May 2021 14:42:05 +0800
Message-Id: <20210518064215.2856977-6-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210518064215.2856977-1-tientzu@chromium.org>
References: <20210518064215.2856977-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new getter, get_io_tlb_mem, to help select the io_tlb_mem struct.
The restricted DMA pool is preferred if available.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 include/linux/swiotlb.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 03ad6e3b4056..b469f04cca26 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_SWIOTLB_H
 #define __LINUX_SWIOTLB_H
 
+#include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -102,6 +103,16 @@ struct io_tlb_mem {
 };
 extern struct io_tlb_mem *io_tlb_default_mem;
 
+static inline struct io_tlb_mem *get_io_tlb_mem(struct device *dev)
+{
+#ifdef CONFIG_DMA_RESTRICTED_POOL
+	if (dev && dev->dma_io_tlb_mem)
+		return dev->dma_io_tlb_mem;
+#endif /* CONFIG_DMA_RESTRICTED_POOL */
+
+	return io_tlb_default_mem;
+}
+
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = io_tlb_default_mem;
-- 
2.31.1.751.gd2f1c929bd-goog


