Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6206D4182C0
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 16:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195884.348751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mU8iA-0002va-2l; Sat, 25 Sep 2021 14:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195884.348751; Sat, 25 Sep 2021 14:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mU8i9-0002sI-VJ; Sat, 25 Sep 2021 14:31:29 +0000
Received: by outflank-mailman (input) for mailman id 195884;
 Sat, 25 Sep 2021 14:31:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nlhD=OP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mU8i8-0002rk-O2
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 14:31:28 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 442a34d0-1e0d-11ec-bb87-12813bfff9fa;
 Sat, 25 Sep 2021 14:31:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9BDAD1FE78;
 Sat, 25 Sep 2021 14:31:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 756E913398;
 Sat, 25 Sep 2021 14:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3cZVG74yT2EtEwAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 25 Sep 2021 14:31:26 +0000
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
X-Inumbo-ID: 442a34d0-1e0d-11ec-bb87-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632580286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Wpvi9Btcg02A0UWx/KC6Hh6eVUMEVHaSr7Cmxo2893M=;
	b=VwYoSAw+lzQPAiJURGqOKsrbOlP0YIeCHCp0NI2uaSeIJun3pGIIaknmfLI9b6L9J0FXuV
	vlrPIovlybqiEIQZNzNUcDuIVkFla6eWNHDe3DdYFgfwqnLqGRtCZIhnxjRNSxfhCPy9LR
	z/8EwUltrFeOjWe630C4a8r0B2bi8AM=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.15-rc3
Date: Sat, 25 Sep 2021 16:31:26 +0200
Message-Id: <20210925143126.26439-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc3-tag

xen: branch for v5.15-rc3

It contains some minor cleanups and fixes of some theoretical bugs, as
well as a fix of a bug introduced in 5.15-rc1.

Thanks.

Juergen

 arch/x86/Kconfig                       |  1 -
 arch/x86/include/asm/xen/swiotlb-xen.h |  6 +-----
 arch/x86/xen/enlighten_pv.c            | 15 +++++++++------
 arch/x86/xen/pci-swiotlb-xen.c         |  4 ++--
 arch/x86/xen/smp_pv.c                  |  4 ----
 drivers/pci/Kconfig                    |  2 +-
 drivers/xen/Kconfig                    |  1 +
 drivers/xen/balloon.c                  |  4 ++--
 drivers/xen/gntdev.c                   |  8 ++++++++
 drivers/xen/swiotlb-xen.c              |  7 ++++---
 include/xen/xen-ops.h                  | 12 ------------
 11 files changed, 28 insertions(+), 36 deletions(-)

Jan Beulich (7):
      xen/x86: drop redundant zeroing from cpu_initialize_context()
      Xen/gntdev: don't ignore kernel unmapping error
      swiotlb-xen: ensure to issue well-formed XENMEM_exchange requests
      PCI: only build xen-pcifront in PV-enabled environments
      xen/pci-swiotlb: reduce visibility of symbols
      swiotlb-xen: this is PV-only on x86
      xen/x86: fix PV trap handling on secondary processors

Juergen Gross (1):
      xen/balloon: fix balloon kthread freezing

