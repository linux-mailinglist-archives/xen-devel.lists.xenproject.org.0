Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B133801B26
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 08:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645991.1008554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9KM8-00011m-8v; Sat, 02 Dec 2023 07:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645991.1008554; Sat, 02 Dec 2023 07:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9KM8-0000zK-6E; Sat, 02 Dec 2023 07:24:04 +0000
Received: by outflank-mailman (input) for mailman id 645991;
 Sat, 02 Dec 2023 07:24:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r9KM6-0000zE-Ow
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 07:24:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c39902f6-90e3-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 08:24:01 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 55BB221D65;
 Sat,  2 Dec 2023 07:24:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DDEB13588;
 Sat,  2 Dec 2023 07:24:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id KeuVCZDbamVCDgAAn2gu4w
 (envelope-from <jgross@suse.com>); Sat, 02 Dec 2023 07:24:00 +0000
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
X-Inumbo-ID: c39902f6-90e3-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701501840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UH019fP1BxPPcQjfP9yhSG/5xpP8AqAQpy+OKJJzXac=;
	b=QkgDBFmrEI96No39C6gLtvgn/yE7dsmyQ8UGPoV5Z5IPFkoAEmX1a8J5rbJBRBOblf3r7z
	uMNywKpOJBELRF6WMg53Dz/pNU+QmUj39N0MDThE1cfFv+rG6XZA4blqu6AtDzFyKw2uoi
	WwGv71R5NWFwwgHlxHG3PaSxmUBgmCU=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.7-rc4
Date: Sat,  2 Dec 2023 08:23:59 +0100
Message-Id: <20231202072359.30587-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 6.53
X-Spam-Level: ******
X-Spamd-Result: default: False [6.53 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_SPAM_SHORT(3.00)[0.999];
	 NEURAL_HAM_LONG(-0.96)[-0.963];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.41)[77.87%]

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc4-tag

xen: branch for v6.7-rc4

It contains 2 fixes:

- A fix for the Xen event driver setting the correct return value when
  experiencing an allocation failure

- A fix for allocating space for a struct in the percpu area to not
  cross page boundaries (this one is for x86, a similar one for Arm was
  already in the pull request for rc3)


Thanks.

Juergen

 arch/x86/xen/enlighten.c         | 6 +++++-
 arch/x86/xen/xen-ops.h           | 2 +-
 drivers/xen/events/events_base.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

Dan Carpenter (1):
      xen/events: fix error code in xen_bind_pirq_msi_to_irq()

Juergen Gross (1):
      x86/xen: fix percpu vcpu_info allocation

