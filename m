Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263227871B7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 16:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590135.922238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZBRm-0005oB-1t; Thu, 24 Aug 2023 14:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590135.922238; Thu, 24 Aug 2023 14:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZBRl-0005le-VW; Thu, 24 Aug 2023 14:36:29 +0000
Received: by outflank-mailman (input) for mailman id 590135;
 Thu, 24 Aug 2023 14:36:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E907=EJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qZBRl-0005lX-1v
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 14:36:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b9402d1-428b-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 16:36:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A703122A72;
 Thu, 24 Aug 2023 14:36:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7F5251336F;
 Thu, 24 Aug 2023 14:36:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K4RqHepq52SdKQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Aug 2023 14:36:26 +0000
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
X-Inumbo-ID: 9b9402d1-428b-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692887786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=I4kf96Gd/Pc254PdRlSC5VEW2Pw9dnY7qf5r6K/JaRQ=;
	b=TPdQCUtmEWOeKIGIrTK68yO+0VLWEAtX3ijOW8TUxZpV2rQ/9UfqcWU9aCQtcVb8HvKX6l
	WGusHhRDvLrVbpJc1k5Vi9yC/GPIplIzx0pE1YhgEH90zgxFOzXENT2/8aEJPyvHGKHTIE
	XMkdk9yPlREkeFZvS34Pjar+XbQiePM=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.6-rc1
Date: Thu, 24 Aug 2023 16:36:26 +0200
Message-Id: <20230824143626.10100-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.6-rc1-tag

xen: branch for v6.6-rc1

It contains the following patches:

- a bunch of minor cleanups

- a patch adding irqfd support for virtio backends running as user
  daemon supporting Xen guests


Thanks.

Juergen

 arch/x86/include/asm/xen/page.h             |   5 +-
 arch/x86/xen/enlighten_pv.c                 |   2 +-
 arch/x86/xen/mmu_pv.c                       |  18 +-
 arch/x86/xen/setup.c                        |   4 +-
 drivers/xen/Kconfig                         |   7 +
 drivers/xen/grant-table.c                   |   2 +-
 drivers/xen/privcmd.c                       | 282 +++++++++++++++++++++++++++-
 drivers/xen/xen-acpi-processor.c            |   7 +-
 drivers/xen/xen-pciback/conf_space_quirks.h |   2 -
 drivers/xen/xen-pciback/pciback.h           |   3 -
 drivers/xen/xenbus/xenbus_probe_frontend.c  |   2 +-
 drivers/xen/xenbus/xenbus_xs.c              |   4 +-
 include/uapi/xen/privcmd.h                  |  14 ++
 include/xen/events.h                        |   1 -
 14 files changed, 320 insertions(+), 33 deletions(-)

Li Zetao (1):
      xen: xenbus: Use helper function IS_ERR_OR_NULL()

Linus Walleij (1):
      x86/xen: Make virt_to_pfn() a static inline

Petr Pavlu (1):
      xen/xenbus: Avoid a lockdep warning when adding a watch

Petr Tesarik (1):
      xen: remove a confusing comment on auto-translated guest I/O

Ruan Jinjie (1):
      xen: Switch to use kmemdup() helper

Viresh Kumar (1):
      xen: privcmd: Add support for irqfd

Yang Li (1):
      xen: Fix one kernel-doc comment

Yue Haibing (2):
      xen/evtchn: Remove unused function declaration xen_set_affinity_evtchn()
      xen-pciback: Remove unused function declarations

