Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E532038721E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 08:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128747.241666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litRL-0003Tr-7D; Tue, 18 May 2021 06:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128747.241666; Tue, 18 May 2021 06:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litRL-0003RV-3A; Tue, 18 May 2021 06:42:51 +0000
Received: by outflank-mailman (input) for mailman id 128747;
 Tue, 18 May 2021 06:42:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ/V=KN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1litRJ-0003ON-4p
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:42:49 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b04f135c-3ab3-44be-8fab-096c07fccce8;
 Tue, 18 May 2021 06:42:48 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id g24so4970025pji.4
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 23:42:48 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:f284:b819:54ca:c198])
 by smtp.gmail.com with UTF8SMTPSA id w2sm6038009pjq.5.2021.05.17.23.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:42:47 -0700 (PDT)
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
X-Inumbo-ID: b04f135c-3ab3-44be-8fab-096c07fccce8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGrhy/lObEmrAUPjh232akVjdJCQ2N3TEXL4wbqFbws=;
        b=duRWURIb9Sx8GJHi1ThwAr2NHVUzVDJmZ2JmfALmXmR1jxNy4cEQqo3Uwkbwr8EGA5
         R6coZdV6ao6m5xA8Ypmv+2VDPONe4O7NNvHSgWcMocDtkrKiWZWiU74wMPfrgeqiPT2O
         Tm9+7vaYlGeGJ0ngcQbAsFwROnGV4x58UiTXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGrhy/lObEmrAUPjh232akVjdJCQ2N3TEXL4wbqFbws=;
        b=MuhhGYZvHrr73NU9b3R2CAZ+sdY6rwCMWzxnwtkgoqL7cOtOU70ItMt+U08bMRw+6g
         OwHwotELYEzI4DYJNaCshrrX6PEregcR4EcTsNR1wQsk1MO6qKY2Bn5noyI+JP0teiGL
         yeu2Gp5BDrpxix+4WBwq8xvAiKDePULXiw/oLjr/0eWelbrrPGvm+Tfau3FXFHsBvfFg
         Yk8/GYD/K9AI74U1ySq0kHvI80cYkzv19nJsIVaJT5OxZN5F36aY+TGNDGy//rAzERTX
         oNNDyr1CVdG4yK24qg/q5/a0lR8zHadSueFtjG2to1EIYw57tUzU/Gh94qHAMwqOUOAu
         aztw==
X-Gm-Message-State: AOAM533XWFLCsNtHzHl/lMBCUde8Npl8NFynjs7CCSiBABQrZ0DBriZS
	TUAcj4s2Gsn39Bh+t0fAExSvxw==
X-Google-Smtp-Source: ABdhPJxBFjGdNYNy2/hyDmz/8TNNMnZjFTEu3cEDsr/NePqF5IBoqi2/51M3flUXtNzSuuF0EAFgfQ==
X-Received: by 2002:a17:90b:128d:: with SMTP id fw13mr1083856pjb.211.1621320167688;
        Mon, 17 May 2021 23:42:47 -0700 (PDT)
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
Subject: [PATCH v7 02/15] swiotlb: Refactor swiotlb_create_debugfs
Date: Tue, 18 May 2021 14:42:02 +0800
Message-Id: <20210518064215.2856977-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210518064215.2856977-1-tientzu@chromium.org>
References: <20210518064215.2856977-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the debugfs creation to make the code reusable for supporting
different bounce buffer pools, e.g. restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index d3232fc19385..b849b01a446f 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -64,6 +64,7 @@
 enum swiotlb_force swiotlb_force;
 
 struct io_tlb_mem *io_tlb_default_mem;
+static struct dentry *debugfs_dir;
 
 /*
  * Max segment that we can provide which (if pages are contingous) will
@@ -662,18 +663,30 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-static int __init swiotlb_create_debugfs(void)
+static void swiotlb_create_debugfs(struct io_tlb_mem *mem, const char *name)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
-
 	if (!mem)
-		return 0;
-	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
+		return;
+
+	mem->debugfs = debugfs_create_dir(name, debugfs_dir);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
+}
+
+static int __init swiotlb_create_default_debugfs(void)
+{
+	struct io_tlb_mem *mem = io_tlb_default_mem;
+
+	if (mem) {
+		swiotlb_create_debugfs(mem, "swiotlb");
+		debugfs_dir = mem->debugfs;
+	} else {
+		debugfs_dir = debugfs_create_dir("swiotlb", NULL);
+	}
+
 	return 0;
 }
 
-late_initcall(swiotlb_create_debugfs);
+late_initcall(swiotlb_create_default_debugfs);
 
 #endif
-- 
2.31.1.751.gd2f1c929bd-goog


