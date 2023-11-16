Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E977EE009
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 12:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634124.989393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3alh-0003pz-PI; Thu, 16 Nov 2023 11:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634124.989393; Thu, 16 Nov 2023 11:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3alh-0003nI-Lm; Thu, 16 Nov 2023 11:42:45 +0000
Received: by outflank-mailman (input) for mailman id 634124;
 Thu, 16 Nov 2023 11:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pm+N=G5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r3alg-0003nC-4t
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 11:42:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 406c4ccf-8475-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 12:42:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB1A7204FF;
 Thu, 16 Nov 2023 11:42:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AB13139C4;
 Thu, 16 Nov 2023 11:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2tqWIDEAVmU6UgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 16 Nov 2023 11:42:41 +0000
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
X-Inumbo-ID: 406c4ccf-8475-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700134961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rZdIlzuDKB53L1F0Dn2qgygX+xkvd8594ERD+Hc8H2I=;
	b=DZfjQu0HN/giOA/qM0wgjjXAyUA8FGLsAeKsoVCE9gyqdXHBmT1wF7VL0ygz4YTxPXR81y
	DnbGEnREq7JOlbAsCIngz+ufr5uttHbmlFqt18Qnb1tPhL94wReTn1ip8HbjEfAArIgALU
	OH5kZ4gC3q21uNA83rowcvqk3471Lms=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.7-rc2
Date: Thu, 16 Nov 2023 12:42:41 +0100
Message-Id: <20231116114241.26403-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc2-tag

xen: branch for v6.7-rc2

It contains the following patches:

- A fix in the Xen events driver avoiding to use RCU after the call of
  rcu_report_dead() when taking a cpu down.

- A fix for running as Xen dom0 to line up ACPI's idea of power
  management capabilities with the one of Xen.

- A cleasnup eliminating several kernel-doc warnings in Xen related
  code.

- A cleanup series of the Xen events driver.


Thanks.

Juergen

 arch/x86/include/asm/acpi.h           |  14 +
 arch/x86/include/asm/xen/hypervisor.h |   9 +
 drivers/xen/events/events_2l.c        |   8 +-
 drivers/xen/events/events_base.c      | 576 ++++++++++++++++------------------
 drivers/xen/events/events_internal.h  |   1 -
 drivers/xen/pcpu.c                    |  22 ++
 drivers/xen/xen-front-pgdir-shbuf.c   |  34 +-
 include/xen/events.h                  |   8 +-
 8 files changed, 347 insertions(+), 325 deletions(-)

Juergen Gross (8):
      xen/events: avoid using info_for_irq() in xen_send_IPI_one()
      xen/events: fix delayed eoi list handling
      xen/events: remove unused functions
      xen/events: reduce externally visible helper functions
      xen/events: remove some simple helpers from events_base.c
      xen/events: drop xen_allocate_irqs_dynamic()
      xen/events: modify internal [un]bind interfaces
      xen/events: remove some info_for_irq() calls in pirq handling

Randy Dunlap (1):
      xen/shbuf: eliminate 17 kernel-doc warnings

Roger Pau Monne (1):
      acpi/processor: sanitize _OSC/_PDC capabilities for Xen dom0

