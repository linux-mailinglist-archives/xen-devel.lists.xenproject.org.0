Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C740F6C4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 13:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189333.338963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRC9S-0004YC-Ql; Fri, 17 Sep 2021 11:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189333.338963; Fri, 17 Sep 2021 11:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRC9S-0004VB-Mr; Fri, 17 Sep 2021 11:35:30 +0000
Received: by outflank-mailman (input) for mailman id 189333;
 Fri, 17 Sep 2021 11:35:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+lGq=OH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mRC9Q-0004V5-Mz
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 11:35:28 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a3addd1-23b8-4e6f-8e03-f1eeb8d4b1bc;
 Fri, 17 Sep 2021 11:35:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AFDF1FDC7;
 Fri, 17 Sep 2021 11:35:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E730014102;
 Fri, 17 Sep 2021 11:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +CBmN359RGFAKQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Sep 2021 11:35:26 +0000
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
X-Inumbo-ID: 0a3addd1-23b8-4e6f-8e03-f1eeb8d4b1bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631878527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HcGZS+FDX8DdT1W8lmf9U7WzYN/MAtRfhAF9s0ohGYM=;
	b=WD3lw50Gt+6ZMpkmVs40GJTztbcc911Io34NZGq4RfGTN7onx9wdnRg5XiuqTpO3kHYcQ2
	UWLLLN+bzcioig35fjD2mkEpEW54WB+D42oTlQS2zJGkbi4RK7O9pRa7MiPP96kd8Zm35X
	LTIF7U12YiZ+shwCAA1egJwg0XOM75M=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.15-rc2
Date: Fri, 17 Sep 2021 13:35:26 +0200
Message-Id: <20210917113526.7963-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc2-tag

xen: branch for v5.15-rc2

It contains:
- The first hunk of a Xen swiotlb fixup series fixing multiple minor
  issues and doing some small cleanups
- Some further Xen related fixes avoiding WARN() splats when running
  as Xen guests or dom0
- A Kconfig fix allowing the pvcalls frontend to be built as a module

Thanks.

Juergen

 arch/x86/xen/enlighten_pv.c |  7 +++++
 arch/x86/xen/mmu_pv.c       |  7 +++--
 drivers/base/power/trace.c  | 10 ++++++++
 drivers/xen/Kconfig         |  2 +-
 drivers/xen/balloon.c       | 62 ++++++++++++++++++++++++++++++++-------------
 drivers/xen/swiotlb-xen.c   | 37 +++++++++++++--------------
 6 files changed, 85 insertions(+), 40 deletions(-)

Jan Beulich (9):
      xen/pvcalls: backend can be a module
      swiotlb-xen: avoid double free
      swiotlb-xen: fix late init retry
      swiotlb-xen: maintain slab count properly
      swiotlb-xen: suppress certain init retries
      swiotlb-xen: limit init retries
      swiotlb-xen: drop leftover __ref
      swiotlb-xen: arrange to have buffer info logged
      swiotlb-xen: drop DEFAULT_NSLABS

Juergen Gross (4):
      xen/balloon: use a kernel thread instead a workqueue
      PM: base: power: don't try to use non-existing RTC for storing data
      xen: reset legacy rtc flag for PV domU
      xen: fix usage of pmd_populate in mremap for pv guests

