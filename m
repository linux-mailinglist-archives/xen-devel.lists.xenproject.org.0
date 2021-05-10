Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C920377FF6
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 11:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125054.235441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2ZA-0007hN-3f; Mon, 10 May 2021 09:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125054.235441; Mon, 10 May 2021 09:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2Z9-0007e7-Vh; Mon, 10 May 2021 09:51:07 +0000
Received: by outflank-mailman (input) for mailman id 125054;
 Mon, 10 May 2021 09:51:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NcLl=KF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lg2Z8-0006yg-Qp
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 09:51:06 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a732de66-c3c4-4664-ab4f-d6938473f051;
 Mon, 10 May 2021 09:51:06 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id b15so2684452plh.10
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 02:51:06 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a524:abe8:94e3:5601])
 by smtp.gmail.com with UTF8SMTPSA id ga1sm11342699pjb.5.2021.05.10.02.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 02:51:05 -0700 (PDT)
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
X-Inumbo-ID: a732de66-c3c4-4664-ab4f-d6938473f051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UxwjATyfUtX3knbkz7Ng4a91AyuLGtHH/dkvosOSCGg=;
        b=KOr6914IYxgjLwHfgEdtt7yY0GH36g2NGsJo3fGwbbJaZNcrllky3/6cWFIPbrcxnF
         J6WIRuHd84U2i5BBiDKA/bsQe9y2Z9UkJ/RbWHnAxAdDWQ5FGpvFFVOBGDi0XQRFybWw
         dDc+W6hlTJe2OtGlIaJLuh2fe89FW6RCivPnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UxwjATyfUtX3knbkz7Ng4a91AyuLGtHH/dkvosOSCGg=;
        b=UaKwY+D+WqJ5npUvvk8D9suzezUX1dhxpILFAOY6gPP8ZxVkvamrKgnoonXRMTVTN4
         4BbQALl49A9rTf3yh8+qEnojDVZt6KzKD3yvB1OaWXkD1aCAy5RmTfTDDbT//8mvubak
         CZTLZhYp7BCuqe+j7fwTsi38pVyD32GTCGA3EY4WF5w5SeQPJb1s/0hdJ4bnwkuX/Dzz
         R1zhR6kDGpGVrg0pn61w140JwxzVmRC+D3zewQqIsltRlQeqhiZ5kmopwPkqy5JCXeBn
         iGqa/FGSH1N+0dQqHsM7Xj6S/WSzEFc6ctvLImtZu0Y5alCQJRZv9uwQnkFXbYliMc5t
         thwg==
X-Gm-Message-State: AOAM531WkKk3WVm/4575AFw7Ndp7jZ/qseIL3edlb0dXsEzSWXxnOYGX
	dmXMv4cKrPUXwXCZNWmmVhpCPg==
X-Google-Smtp-Source: ABdhPJxTaq6vhy1R6G0CsSRkldwCBABZULYIDbfdaYlGZp1FgQhncVgdgDLR34kcwkcv6yJulF+tnA==
X-Received: by 2002:a17:90a:cf10:: with SMTP id h16mr26442566pju.49.1620640265461;
        Mon, 10 May 2021 02:51:05 -0700 (PDT)
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
Subject: [PATCH v6 03/15] swiotlb: Add DMA_RESTRICTED_POOL
Date: Mon, 10 May 2021 17:50:14 +0800
Message-Id: <20210510095026.3477496-4-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
In-Reply-To: <20210510095026.3477496-1-tientzu@chromium.org>
References: <20210510095026.3477496-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new kconfig symbol, DMA_RESTRICTED_POOL, for restricted DMA pool.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 77b405508743..3e961dc39634 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -80,6 +80,20 @@ config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
 
+config DMA_RESTRICTED_POOL
+	bool "DMA Restricted Pool"
+	depends on OF && OF_RESERVED_MEM
+	select SWIOTLB
+	help
+	  This enables support for restricted DMA pools which provide a level of
+	  DMA memory protection on systems with limited hardware protection
+	  capabilities, such as those lacking an IOMMU.
+
+	  For more information see
+	  <Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt>
+	  and <kernel/dma/swiotlb.c>.
+	  If unsure, say "n".
+
 #
 # Should be selected if we can mmap non-coherent mappings to userspace.
 # The only thing that is really required is a way to set an uncached bit
-- 
2.31.1.607.g51e8a6a459-goog


