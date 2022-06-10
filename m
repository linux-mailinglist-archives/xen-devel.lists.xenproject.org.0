Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F9545B4B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 06:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345754.571413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzWZy-00056E-Ah; Fri, 10 Jun 2022 04:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345754.571413; Fri, 10 Jun 2022 04:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzWZy-00053S-7M; Fri, 10 Jun 2022 04:49:02 +0000
Received: by outflank-mailman (input) for mailman id 345754;
 Fri, 10 Jun 2022 04:49:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FoyK=WR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nzWZw-00053M-N2
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 04:49:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a43afb82-e878-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 06:48:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD6661FDA6;
 Fri, 10 Jun 2022 04:48:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96DBB139ED;
 Fri, 10 Jun 2022 04:48:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KAqTIzrNomKDAgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Jun 2022 04:48:58 +0000
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
X-Inumbo-ID: a43afb82-e878-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654836538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ehPBDIeGo/IVyVU/00SU2xxg0fPE5snMj1Ycn6dtS/k=;
	b=R9D4hN0hV9wkzyPOFBVw6H33koGOOe8nQL8by+vWmodVHt1cwdnqwKgJMvBPtpyMt2weuH
	Tmrxam4DoC651QO5Z7jHZfyoqmIA+bd7iy5UW0w5FLz/awX12Toc5X3HC+ZZ37Gx2oBQ1u
	zQ0ABu39T1ar2udtXkSd+2lSP7WX/2I=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v5.19-rc2
Date: Fri, 10 Jun 2022 06:48:58 +0200
Message-Id: <20220610044858.30822-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc2-tag

xen: branch for v5.19-rc2

It contains:
- a small cleanup removing "export" of an __init function
- a small series adding a new infrastructure for platform flags
- a series adding generic virtio support for Xen guests (frontend side)

Thanks.

Juergen

 .../devicetree/bindings/iommu/xen,grant-dma.yaml   |  39 +++
 MAINTAINERS                                        |   8 +
 arch/arm/include/asm/xen/xen-ops.h                 |   2 +
 arch/arm/mm/dma-mapping.c                          |   7 +-
 arch/arm/xen/enlighten.c                           |   2 +
 arch/arm64/include/asm/xen/xen-ops.h               |   2 +
 arch/arm64/mm/dma-mapping.c                        |   7 +-
 arch/s390/Kconfig                                  |   1 -
 arch/s390/mm/init.c                                |  13 +-
 arch/x86/Kconfig                                   |   1 -
 arch/x86/mm/mem_encrypt.c                          |   7 -
 arch/x86/mm/mem_encrypt_amd.c                      |   4 +
 arch/x86/xen/enlighten_hvm.c                       |   2 +
 arch/x86/xen/enlighten_pv.c                        |   2 +
 drivers/virtio/Kconfig                             |   6 -
 drivers/virtio/virtio.c                            |   5 +-
 drivers/xen/Kconfig                                |  20 ++
 drivers/xen/Makefile                               |   2 +
 drivers/xen/grant-dma-iommu.c                      |  78 +++++
 drivers/xen/grant-dma-ops.c                        | 346 +++++++++++++++++++++
 drivers/xen/grant-table.c                          | 251 ++++++++++++---
 drivers/xen/xlate_mmu.c                            |   1 -
 include/asm-generic/Kbuild                         |   1 +
 include/asm-generic/platform-feature.h             |   8 +
 include/linux/platform-feature.h                   |  19 ++
 include/linux/virtio_config.h                      |   9 -
 include/xen/arm/xen-ops.h                          |  18 ++
 include/xen/grant_table.h                          |   4 +
 include/xen/xen-ops.h                              |  13 +
 include/xen/xen.h                                  |   8 +
 kernel/Makefile                                    |   2 +-
 kernel/platform-feature.c                          |  27 ++
 32 files changed, 830 insertions(+), 85 deletions(-)

Juergen Gross (5):
      kernel: add platform_has() infrastructure
      virtio: replace arch_has_restricted_virtio_memory_access()
      xen/grants: support allocating consecutive grants
      xen/grant-dma-ops: Add option to restrict memory access under Xen
      xen/virtio: Enable restricted memory access using Xen grant mappings

Masahiro Yamada (1):
      xen: unexport __init-annotated xen_xlate_map_ballooned_pages()

Oleksandr Tyshchenko (5):
      arm/xen: Introduce xen_setup_dma_ops()
      dt-bindings: Add xen,grant-dma IOMMU description for xen-grant DMA ops
      xen/grant-dma-iommu: Introduce stub IOMMU driver
      xen/grant-dma-ops: Retrieve the ID of backend's domain for DT devices
      arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices

