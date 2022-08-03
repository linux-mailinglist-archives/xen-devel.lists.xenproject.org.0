Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF458884C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 09:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379615.613203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9B8-0006PA-1U; Wed, 03 Aug 2022 07:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379615.613203; Wed, 03 Aug 2022 07:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9B7-0006MF-U2; Wed, 03 Aug 2022 07:52:29 +0000
Received: by outflank-mailman (input) for mailman id 379615;
 Wed, 03 Aug 2022 07:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oJ9B6-0006M9-QV
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 07:52:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38162ff0-1301-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 09:52:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46D3D1FA1D;
 Wed,  3 Aug 2022 07:52:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EC4713AD8;
 Wed,  3 Aug 2022 07:52:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a/roBTsp6mKPWAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Aug 2022 07:52:27 +0000
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
X-Inumbo-ID: 38162ff0-1301-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659513147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sr704n3E+uzEfLfboBuOTEXvE58GeQo8M8jf8i1d0wo=;
	b=AebRSCnYhod5FFONkbzTNUZTBG3L/F4GVPo3Z4G21ul82l+lNmkK7r8ZoBiyd1054aEHGC
	BgQxd2/AuRViZxMvU+OYN+hX+91qd+i2D1MSV6UaZ7yMig4XgS5EN4LqpBvVPmFtwD1oz/
	OamEmK+LOcnTU8KuSx0xdDYGIqOj0Cs=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.0-rc1
Date: Wed,  3 Aug 2022 09:52:26 +0200
Message-Id: <20220803075226.2400-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc1-tag

xen: branch for v6.0-rc1

It contains:

- a series fine tuning virtio support for Xen guests, including removal
  the now again unused "platform_has()" feature.

- a fix for host admin triggered reboot of Xen guests

- a simple spelling fix

Thanks.

Juergen

 MAINTAINERS                            |  8 --------
 arch/arm/xen/enlighten.c               |  4 +++-
 arch/s390/mm/init.c                    |  4 ++--
 arch/x86/mm/mem_encrypt_amd.c          |  4 ++--
 arch/x86/xen/enlighten_hvm.c           |  4 +++-
 arch/x86/xen/enlighten_pv.c            |  5 ++++-
 drivers/virtio/Kconfig                 |  4 ++++
 drivers/virtio/Makefile                |  1 +
 drivers/virtio/virtio.c                |  4 ++--
 drivers/virtio/virtio_anchor.c         | 18 ++++++++++++++++++
 drivers/xen/Kconfig                    |  9 +++++++++
 drivers/xen/grant-dma-ops.c            | 10 ++++++++++
 drivers/xen/manage.c                   |  2 +-
 drivers/xen/xen-front-pgdir-shbuf.c    |  4 ++--
 include/asm-generic/Kbuild             |  1 -
 include/asm-generic/platform-feature.h |  8 --------
 include/linux/platform-feature.h       | 19 -------------------
 include/linux/virtio_anchor.h          | 19 +++++++++++++++++++
 include/xen/xen-ops.h                  |  9 +++++++++
 include/xen/xen.h                      |  8 --------
 kernel/Makefile                        |  2 +-
 kernel/platform-feature.c              | 27 ---------------------------
 22 files changed, 90 insertions(+), 84 deletions(-)

Juergen Gross (4):
      virtio: replace restricted mem access flag with callback
      kernel: remove platform_has() infrastructure
      xen: don't require virtio with grants for non-PV guests

Ross Lagerwall (1):
      xen/manage: Use orderly_reboot() to reboot

Zhang Jiaming (1):
      xen: Fix spelling mistake

