Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE33AD724
	for <lists+xen-devel@lfdr.de>; Sat, 19 Jun 2021 05:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145025.266856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRqs-0000oM-So; Sat, 19 Jun 2021 03:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145025.266856; Sat, 19 Jun 2021 03:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luRqs-0000mJ-NU; Sat, 19 Jun 2021 03:40:58 +0000
Received: by outflank-mailman (input) for mailman id 145025;
 Sat, 19 Jun 2021 03:40:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oaj8=LN=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1luRqq-0000mD-Ix
 for xen-devel@lists.xenproject.org; Sat, 19 Jun 2021 03:40:56 +0000
Received: from mail-pl1-x630.google.com (unknown [2607:f8b0:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 246ee875-db1c-4980-b357-6f7286b5b6c0;
 Sat, 19 Jun 2021 03:40:55 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id x22so4131386pll.11
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 20:40:55 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:4a46:e208:29e8:e076])
 by smtp.gmail.com with UTF8SMTPSA id h9sm3396879pgn.57.2021.06.18.20.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 20:40:53 -0700 (PDT)
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
X-Inumbo-ID: 246ee875-db1c-4980-b357-6f7286b5b6c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wvS9l30i3GYuPyiKgQTQF0b37cCydWlT07dudvlm33Q=;
        b=nzhm+1SSPBjVZjE/s5NdvBue0n/c7M+1C3XPeFYVZL6vXhVJvQ+WMmRbQnedYpdFhz
         +BXJSvmDWQ2zbmhQ0mXQVGS2uwlDDSzoC4WdeSTpiL7y3Iv4utmKFnBhkI2zT9V/Pvi8
         OcjCsO1ux4x7lk9Z463hWgr5tPX6YDT2An/Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wvS9l30i3GYuPyiKgQTQF0b37cCydWlT07dudvlm33Q=;
        b=LpeVEg1NGb3baVHidssigueDy/c3PlyMvupJv+tSs+pP/2XDAh5l0lnHkJnvzdqRz/
         H0Gy4Stw0IxpUVngNbyAhiuMITly6MBh27hhGBJsFN2ihQUK5/taKqc/G/k3+JgJUguz
         BziiCcmXZztqbVAhdfnsqEPIIsQuw4mCebXWxWqFp12cZ7tHW5UCFTIFEy7cOktZRlcg
         O3SyQ9+cs72RWcOo+UIVbngipWDFYjZJN+/aP+h7dxs/D8g5B0yok1kUA50mD+jqslxp
         EECz/FJJOXt/ToQxXw6wVqXzbCpBabONAf0akT6Yb+sAos/9LdfuiQtsEE+jXt9tqhJW
         RIYA==
X-Gm-Message-State: AOAM5300j0z3dlrHclOYGQtcMKYff3FA3R0JK27e9SOyKMujqgG/YDGN
	sbr2JeCH4dn6xBeNi8JOnaD3xw==
X-Google-Smtp-Source: ABdhPJz3/l7Y1S8+WYsfcCUqr2yTHWs8fYRW3TvBYf0s7lBSL7y2P67ZunbdUFtwSnyF77FW0iYCxQ==
X-Received: by 2002:a17:90a:9910:: with SMTP id b16mr14283876pjp.94.1624074054156;
        Fri, 18 Jun 2021 20:40:54 -0700 (PDT)
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
	thomas.hellstrom@linux.intel.com,
	thomas.lendacky@amd.com
Subject: [PATCH v14 00/12] Restricted DMA
Date: Sat, 19 Jun 2021 11:40:31 +0800
Message-Id: <20210619034043.199220-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

v14:
- Move set_memory_decrypted before swiotlb_init_io_tlb_mem (patch 01/12, 10,12)
- Add Stefano's Acked-by tag from v13

v13:
- Fix xen-swiotlb issues
  - memset in patch 01/12
  - is_swiotlb_force_bounce in patch 06/12
- Fix the dts example typo in reserved-memory.txt
- Add Stefano and Will's Tested-by tag from v12
https://lore.kernel.org/patchwork/cover/1448001/

v12:
Split is_dev_swiotlb_force into is_swiotlb_force_bounce (patch 06/12) and
is_swiotlb_for_alloc (patch 09/12)
https://lore.kernel.org/patchwork/cover/1447254/

v11:
- Rebase against swiotlb devel/for-linus-5.14
- s/mempry/memory/g
- exchange the order of patch 09/12 and 10/12
https://lore.kernel.org/patchwork/cover/1447216/

v10:
Address the comments in v9 to
  - fix the dev->dma_io_tlb_mem assignment
  - propagate swiotlb_force setting into io_tlb_default_mem->force
  - move set_memory_decrypted out of swiotlb_init_io_tlb_mem
  - move debugfs_dir declaration into the main CONFIG_DEBUG_FS block
  - add swiotlb_ prefix to find_slots and release_slots
  - merge the 3 alloc/free related patches
  - move the CONFIG_DMA_RESTRICTED_POOL later
https://lore.kernel.org/patchwork/cover/1446882/

v9:
Address the comments in v7 to
  - set swiotlb active pool to dev->dma_io_tlb_mem
  - get rid of get_io_tlb_mem
  - dig out the device struct for is_swiotlb_active
  - move debugfs_create_dir out of swiotlb_create_debugfs
  - do set_memory_decrypted conditionally in swiotlb_init_io_tlb_mem
  - use IS_ENABLED in kernel/dma/direct.c
  - fix redefinition of 'of_dma_set_restricted_buffer'
https://lore.kernel.org/patchwork/cover/1445081/

v8:
- Fix reserved-memory.txt and add the reg property in example.
- Fix sizeof for of_property_count_elems_of_size in
  drivers/of/address.c#of_dma_set_restricted_buffer.
- Apply Will's suggestion to try the OF node having DMA configuration in
  drivers/of/address.c#of_dma_set_restricted_buffer.
- Fix typo in the comment of drivers/of/address.c#of_dma_set_restricted_buffer.
- Add error message for PageHighMem in
  kernel/dma/swiotlb.c#rmem_swiotlb_device_init and move it to
  rmem_swiotlb_setup.
- Fix the message string in rmem_swiotlb_setup.
https://lore.kernel.org/patchwork/cover/1437112/

v7:
Fix debugfs, PageHighMem and comment style in rmem_swiotlb_device_init
https://lore.kernel.org/patchwork/cover/1431031/

v6:
Address the comments in v5
https://lore.kernel.org/patchwork/cover/1423201/

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


Claire Chang (12):
  swiotlb: Refactor swiotlb init functions
  swiotlb: Refactor swiotlb_create_debugfs
  swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
  swiotlb: Update is_swiotlb_buffer to add a struct device argument
  swiotlb: Update is_swiotlb_active to add a struct device argument
  swiotlb: Use is_swiotlb_force_bounce for swiotlb data bouncing
  swiotlb: Move alloc_size to swiotlb_find_slots
  swiotlb: Refactor swiotlb_tbl_unmap_single
  swiotlb: Add restricted DMA alloc/free support
  swiotlb: Add restricted DMA pool initialization
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  36 ++-
 drivers/base/core.c                           |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |   2 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  33 +++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   6 +
 drivers/pci/xen-pcifront.c                    |   2 +-
 drivers/xen/swiotlb-xen.c                     |   4 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  51 +++-
 kernel/dma/Kconfig                            |  14 +
 kernel/dma/direct.c                           |  59 +++--
 kernel/dma/direct.h                           |   8 +-
 kernel/dma/swiotlb.c                          | 250 +++++++++++++-----
 16 files changed, 387 insertions(+), 103 deletions(-)

-- 
2.32.0.288.g62a8d224e6-goog


