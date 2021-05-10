Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC71377FF7
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 11:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125048.235405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2Yl-0006Lc-2F; Mon, 10 May 2021 09:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125048.235405; Mon, 10 May 2021 09:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg2Yk-0006IV-V8; Mon, 10 May 2021 09:50:42 +0000
Received: by outflank-mailman (input) for mailman id 125048;
 Mon, 10 May 2021 09:50:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NcLl=KF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lg2Yj-0006IP-MJ
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 09:50:41 +0000
Received: from mail-pf1-x431.google.com (unknown [2607:f8b0:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5de35131-f720-45a4-beac-c0f62c6ab20c;
 Mon, 10 May 2021 09:50:40 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id k19so13248835pfu.5
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 02:50:40 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:a524:abe8:94e3:5601])
 by smtp.gmail.com with UTF8SMTPSA id 3sm10134744pff.132.2021.05.10.02.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 02:50:39 -0700 (PDT)
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
X-Inumbo-ID: 5de35131-f720-45a4-beac-c0f62c6ab20c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suql6mxhF7VWacBQX+vVI90y4jo7pK7o7lRK42P1ziE=;
        b=lOHb/wGLPI35HYDpC1OybPS0wSHtEceWE9NWy4yGK8ilXXldfGkKtOa8K66bNr4LEO
         Pr9azSla0OuJEaDOigJpQisql/QT6Rzgq/OL94Z5dEW4Jo9qDvVnUfwuUeDl/NGvpzhn
         KxdIcdeNTo8YF1ZknPwF9akS+XlqzfXmq6cBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suql6mxhF7VWacBQX+vVI90y4jo7pK7o7lRK42P1ziE=;
        b=QmnjJ+Ku233DQNV7DGQGAIoM8c4t0gAkwqIqRKMFzzOaNAsCL73bpgSEN9j/1RSOOS
         6BCY+kixfn7K6ghMnh+P3WtL7JrYmcVqvo2ZuD0fGXAHE4KdyhNPui2G2dP244sRjYDz
         d/LhbnylOV6AUTu+94BOwG9lh6g81KSrb4CVxIHg/EA+fCMnxfn2fGvtU0T8G8So2+Wg
         j39BeTL9luOG5YwMZrYyXuKDbOonrSLakNNbnqiWQ6gYl7PJGU/TmkzckLVYE8rlR6S7
         sMEUrwqIQC/zw9jeui0PL1L3BRlSXHN/WlzYarvR5i/uTkdKODcS13DQNlRdDvMbfjbf
         Ol4g==
X-Gm-Message-State: AOAM532gpeB4DVvnDUeB3lmIXKAZMh8CJLUyJLTSzRlBZbDmx91F5W3u
	ukdxc3x+wSUKQW6uX2C8a5lgrA==
X-Google-Smtp-Source: ABdhPJxaRNqwofbH1Q1gT6hjDo7UCjX7KCvjB0rJLaDOY22mJQZwGH/owOzO7oGoIZrGlaECEV1xwQ==
X-Received: by 2002:a62:2a14:0:b029:263:20c5:6d8c with SMTP id q20-20020a622a140000b029026320c56d8cmr24491637pfq.23.1620640239613;
        Mon, 10 May 2021 02:50:39 -0700 (PDT)
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
	thomas.hellstrom@linux.intel.com,
	Claire Chang <tientzu@google.com>
Subject: [PATCH v6 00/15] Restricted DMA
Date: Mon, 10 May 2021 17:50:11 +0800
Message-Id: <20210510095026.3477496-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claire Chang <tientzu@google.com>

This series implements mitigations for lack of DMA access control on
systems without an IOMMU, which could result in the DMA accessing the
system memory at unexpected times and/or unexpected addresses, possibly
leading to data leakage or corruption.

For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
not behind an IOMMU. As PCI-e, by design, gives the device full access to
system memory, a vulnerability in the Wi-Fi firmware could easily escalate
to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
full chain of exploits; [2], [3]).

To mitigate the security concerns, we introduce restricted DMA. Restricted
DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
specially allocated region and does memory allocation from the same region.
The feature on its own provides a basic level of protection against the DMA
overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system needs
to provide a way to restrict the DMA to a predefined memory region (this is
usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
[4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132

v6:
Address the comments in v5

v5:
Rebase on latest linux-next
https://lore.kernel.org/patchwork/cover/1416899/

v4:
- Fix spinlock bad magic
- Use rmem->name for debugfs entry
- Address the comments in v3
https://lore.kernel.org/patchwork/cover/1378113/

v3:
Using only one reserved memory region for both streaming DMA and memory
allocation.
https://lore.kernel.org/patchwork/cover/1360992/

v2:
Building on top of swiotlb.
https://lore.kernel.org/patchwork/cover/1280705/

v1:
Using dma_map_ops.
https://lore.kernel.org/patchwork/cover/1271660/
*** BLURB HERE ***

Claire Chang (15):
  swiotlb: Refactor swiotlb init functions
  swiotlb: Refactor swiotlb_create_debugfs
  swiotlb: Add DMA_RESTRICTED_POOL
  swiotlb: Add restricted DMA pool initialization
  swiotlb: Add a new get_io_tlb_mem getter
  swiotlb: Update is_swiotlb_buffer to add a struct device argument
  swiotlb: Update is_swiotlb_active to add a struct device argument
  swiotlb: Bounce data from/to restricted DMA pool if available
  swiotlb: Move alloc_size to find_slots
  swiotlb: Refactor swiotlb_tbl_unmap_single
  dma-direct: Add a new wrapper __dma_direct_free_pages()
  swiotlb: Add restricted DMA alloc/free support.
  dma-direct: Allocate memory from restricted DMA pool if available
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  27 ++
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |   2 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  25 ++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   5 +
 drivers/pci/xen-pcifront.c                    |   2 +-
 drivers/xen/swiotlb-xen.c                     |   2 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  41 ++-
 kernel/dma/Kconfig                            |  14 +
 kernel/dma/direct.c                           |  63 +++--
 kernel/dma/direct.h                           |   9 +-
 kernel/dma/swiotlb.c                          | 242 +++++++++++++-----
 15 files changed, 356 insertions(+), 97 deletions(-)

-- 
2.31.1.607.g51e8a6a459-goog


