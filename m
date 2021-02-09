Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CA314896
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 07:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83127.153966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPJ-00029u-RN; Tue, 09 Feb 2021 06:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83127.153966; Tue, 09 Feb 2021 06:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9MPJ-00029S-Nr; Tue, 09 Feb 2021 06:21:53 +0000
Received: by outflank-mailman (input) for mailman id 83127;
 Tue, 09 Feb 2021 06:21:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CyDg=HL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1l9MPI-000298-9o
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 06:21:52 +0000
Received: from mail-pl1-x633.google.com (unknown [2607:f8b0:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88784016-37e5-4c45-b58f-4d3d30475329;
 Tue, 09 Feb 2021 06:21:51 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id a16so9161705plh.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 22:21:51 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id y26sm21067426pgk.42.2021.02.08.22.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:21:50 -0800 (PST)
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
X-Inumbo-ID: 88784016-37e5-4c45-b58f-4d3d30475329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VQjRLnhkPorvAVKaOPejw74RXuDyQjfs10AJ4S/GkGY=;
        b=iIl5SP7dar66QYJx01a8eKBzk/OkK/x97Udeqkp8z6Zecwu6gJbtr4+R7AJhbJUsET
         mW/NYKe+92F4cTf+MWb8Kjs3DEc/fRUB2Tuk/IK9lw1i5dbH+o71qP4rUdYAStwKxzrf
         aFKGX0hir3NozqAR+M+IQwDL2zs+YG9OyvX5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VQjRLnhkPorvAVKaOPejw74RXuDyQjfs10AJ4S/GkGY=;
        b=OqWBdvNlNwl42JVqtcBAeIGbXKhe829U+cvVF7V9AS0dBjbhFOHGJGFT7NsajsV1gC
         ryf4QvN4PRNO9Iq6IlB0QgyrePoJpKiU8YXAggHqyXYx54rC0kP0DkQgMa5abiPoDZih
         2yp0pp/1GErKlhbp/1CcWkXk3xYp+8PMQo4OVV1CKubyndWhPjRFv28sQ7G51MoZw8mv
         V6qfAPtNunbt9Dlq+JY5ntlsakmzgS99K6ZDcuibSUrkdNqqtqnwkXnDL4ayS8TSuzYE
         vEc2E6Fy96tNHzrVTJ0ZWG7DDxuYelhNAp0O6d3tULndJXyPQoxnBNm+DzkOw4mqqs8N
         XVgA==
X-Gm-Message-State: AOAM533OuaCKZIPNhB/Kd+lljpGP3goRwE2S/a2OEDVbBgqS5EvjPDWX
	vT6RS3Vg/KStdtlCwy/n140hHA==
X-Google-Smtp-Source: ABdhPJzMs/GVP3LhI2pHnVT9gB2t4EDZQ5t7O4c7u18G3hsJLKUa+IhCtg1SpLtI9Cft7lrwlj4fPw==
X-Received: by 2002:a17:90a:ad09:: with SMTP id r9mr2555446pjq.51.1612851710886;
        Mon, 08 Feb 2021 22:21:50 -0800 (PST)
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
Subject: [PATCH v4 01/14] swiotlb: Remove external access to io_tlb_start
Date: Tue,  9 Feb 2021 14:21:18 +0800
Message-Id: <20210209062131.2300005-2-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new function, get_swiotlb_start(), and remove external access to
io_tlb_start, so we can entirely hide struct swiotlb inside of swiotlb.c
in the following patches.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 arch/powerpc/platforms/pseries/svm.c | 4 ++--
 drivers/xen/swiotlb-xen.c            | 4 ++--
 include/linux/swiotlb.h              | 1 +
 kernel/dma/swiotlb.c                 | 5 +++++
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 7b739cc7a8a9..c10c51d49f3d 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -55,8 +55,8 @@ void __init svm_swiotlb_init(void)
 	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
 		return;
 
-	if (io_tlb_start)
-		memblock_free_early(io_tlb_start,
+	if (vstart)
+		memblock_free_early(vstart,
 				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99..91f8c68d1a9b 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -192,8 +192,8 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	/*
 	 * IO TLB memory already allocated. Just use it.
 	 */
-	if (io_tlb_start != 0) {
-		xen_io_tlb_start = phys_to_virt(io_tlb_start);
+	if (is_swiotlb_active()) {
+		xen_io_tlb_start = phys_to_virt(get_swiotlb_start());
 		goto end;
 	}
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d9c9fc9ca5d2..83200f3b042a 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -81,6 +81,7 @@ void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(void);
+phys_addr_t get_swiotlb_start(void);
 void __init swiotlb_adjust_size(unsigned long new_size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7c42df6e6100..e180211f6ad9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -719,6 +719,11 @@ bool is_swiotlb_active(void)
 	return io_tlb_end != 0;
 }
 
+phys_addr_t get_swiotlb_start(void)
+{
+	return io_tlb_start;
+}
+
 #ifdef CONFIG_DEBUG_FS
 
 static int __init swiotlb_create_debugfs(void)
--

This can be dropped if Christoph's swiotlb cleanups are landed.
https://lore.kernel.org/linux-iommu/20210207160934.2955931-1-hch@lst.de/T/#m7124f29b6076d462101fcff6433295157621da09 

2.30.0.478.g8a0d178c01-goog


