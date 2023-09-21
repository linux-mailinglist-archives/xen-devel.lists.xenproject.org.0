Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC817A92BA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 10:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606209.943969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFFL-0000by-CU; Thu, 21 Sep 2023 08:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606209.943969; Thu, 21 Sep 2023 08:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFFL-0000Yu-99; Thu, 21 Sep 2023 08:41:15 +0000
Received: by outflank-mailman (input) for mailman id 606209;
 Thu, 21 Sep 2023 08:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qjFFJ-0000Yo-Ah
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 08:41:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e304c7c-585a-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 10:41:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 80AE51FF34;
 Thu, 21 Sep 2023 08:41:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5AC46134B0;
 Thu, 21 Sep 2023 08:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id akXPFKcBDGUAHwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 21 Sep 2023 08:41:11 +0000
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
X-Inumbo-ID: 9e304c7c-585a-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695285671; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xLSmJHDOAeyr0SNBhUaYyjXJCesrWfX5ksP2B3zrsxU=;
	b=B2CSIf4qD3ZjJ0wqPhaMGHT0itCWrwZjCQgE+TIXmStBYXtryLkbOTz9SFudLoT7xdPCXm
	HSJv/8Nh/O8EgTibNN19rNjR6Eck1TYHt/fOxHYUUuo4x4XH0vZfPWPkgero80M0VLA0ct
	Vzmq6PNT1w3cMYecKGkvhcS2lm9130E=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.6-rc3
Date: Thu, 21 Sep 2023 10:41:10 +0200
Message-Id: <20230921084110.31633-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.6a-rc3-tag

xen: branch for v6.6-rc3

It contains:

- a cleanup patch removing some unused functions in the Xen event
  channel handling

- a 3 patch series fixing a regression (introduced in 6.6 merge window)
  when booting as Xen PV guest

- a small cleanup patch removing another strncpy() instance


Thanks.

Juergen

 arch/arm/xen/enlighten.c              |  2 +-
 arch/x86/entry/common.c               |  2 +-
 arch/x86/include/asm/paravirt_types.h | 15 --------
 arch/x86/include/asm/xen/hypervisor.h | 37 +++++++++++++++++++
 arch/x86/kernel/paravirt.c            | 67 -----------------------------------
 arch/x86/xen/efi.c                    |  2 +-
 arch/x86/xen/enlighten.c              |  2 +-
 arch/x86/xen/enlighten_hvm.c          |  2 +-
 arch/x86/xen/enlighten_pv.c           | 40 +++++++++++++++++----
 arch/x86/xen/mmu_pv.c                 | 55 ++++++++++++++++++----------
 arch/x86/xen/multicalls.h             |  4 +--
 drivers/xen/events/events_base.c      | 21 ++---------
 drivers/xen/platform-pci.c            |  2 +-
 include/trace/events/xen.h            | 12 +++----
 include/xen/arm/hypervisor.h          | 12 -------
 include/xen/events.h                  |  3 +-
 16 files changed, 123 insertions(+), 155 deletions(-)

Juergen Gross (4):
      xen: simplify evtchn_do_upcall() call maze
      arm/xen: remove lazy mode related definitions
      x86/xen: move paravirt lazy code
      x86/xen: allow nesting of same lazy mode

Justin Stitt (1):
      xen/efi: refactor deprecated strncpy

