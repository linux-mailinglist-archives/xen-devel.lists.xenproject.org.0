Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E3773F43C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 08:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555857.867991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE1t1-0000gC-1h; Tue, 27 Jun 2023 06:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555857.867991; Tue, 27 Jun 2023 06:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE1t0-0000dd-Up; Tue, 27 Jun 2023 06:09:10 +0000
Received: by outflank-mailman (input) for mailman id 555857;
 Tue, 27 Jun 2023 06:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EZfr=CP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qE1sz-0000dX-HN
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 06:09:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2019a569-14b1-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 08:09:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F71421864;
 Tue, 27 Jun 2023 06:09:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02BE813276;
 Tue, 27 Jun 2023 06:09:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pJK6OgJ9mmQ3dQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 27 Jun 2023 06:09:06 +0000
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
X-Inumbo-ID: 2019a569-14b1-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687846147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=49rhAYE/xDlCYNBwhU7TuEWvhe0toiSWL8jdPfXh+RE=;
	b=cz72qwCW1DHGJlJCOq5CadsH+lvtWSSZsLPRBS9gsiuaIbaeOz+kojb79E0r1dlgemJ3Y/
	kXeUBRLWE6lLbHvpv4FzDGwvpH79MFNS6Jj5TGx4ZtYpW8aTDCf7CXAwXtImocaolSnIp0
	MivRQy1UhE+TjukfCoo6B/fdvwdlu0A=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.5-rc1
Date: Tue, 27 Jun 2023 08:09:06 +0200
Message-Id: <20230627060906.14981-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5-rc1-tag

xen: branch for v6.5-rc1

It contains the following patches:

- 3 patches adding missing prototypes

- a fix for finding the iBFT in a Xen dom0 for supporting discless iSCSI
  boot


Thanks.

Juergen

 arch/x86/kernel/setup.c            |  2 +-
 arch/x86/xen/efi.c                 |  2 ++
 arch/x86/xen/mmu_pv.c              | 16 ++++++++++++++++
 arch/x86/xen/setup.c               | 28 +++++++++++++++++++---------
 arch/x86/xen/smp.h                 |  4 ++++
 arch/x86/xen/smp_pv.c              |  1 -
 arch/x86/xen/xen-ops.h             |  5 +++--
 drivers/firmware/iscsi_ibft_find.c | 26 +++++++++++++++++---------
 include/linux/iscsi_ibft.h         | 10 +++++++++-
 include/xen/events.h               |  3 +++
 include/xen/xen.h                  |  3 +++
 11 files changed, 77 insertions(+), 23 deletions(-)

Arnd Bergmann (2):
      xen: xen_debug_interrupt prototype to global header
      x86: xen: add missing prototypes

Juergen Gross (1):
      x86/xen: add prototypes for paravirt mmu functions

Ross Lagerwall (1):
      iscsi_ibft: Fix finding the iBFT under Xen Dom 0

