Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB367132A0
	for <lists+xen-devel@lfdr.de>; Sat, 27 May 2023 07:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540274.841934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2mai-0005sZ-D1; Sat, 27 May 2023 05:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540274.841934; Sat, 27 May 2023 05:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2mai-0005pi-8h; Sat, 27 May 2023 05:35:48 +0000
Received: by outflank-mailman (input) for mailman id 540274;
 Sat, 27 May 2023 05:35:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6b3Y=BQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q2mag-0005hV-4i
 for xen-devel@lists.xenproject.org; Sat, 27 May 2023 05:35:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53dc798f-fc50-11ed-b231-6b7b168915f2;
 Sat, 27 May 2023 07:35:45 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2DAF1F381;
 Sat, 27 May 2023 05:35:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C6564134AB;
 Sat, 27 May 2023 05:35:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id bi9+LrCWcWTnVwAAGKfGzw
 (envelope-from <jgross@suse.com>); Sat, 27 May 2023 05:35:44 +0000
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
X-Inumbo-ID: 53dc798f-fc50-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685165745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oSTN1BPSP9tLeSFNLAlCJe9fSQGY+JofX+1sr1rhixA=;
	b=Ivl0RidbdCzC08rHVPLS4MR+BjtZ+BzVdtqVjHybO8r+ulA5IboiwPUlZ04IM4FzA84dIe
	59yYLh39GkLsYjvNIncm6vW7hLlOfUmkNVaYBP5CAS1XGs/ciXQngBpBqXhLi/heor+AJi
	bkuzGtfS8JdheiVtx9RVgVQ0s2QBjK8=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.4-rc4
Date: Sat, 27 May 2023 07:35:44 +0200
Message-Id: <20230527053544.31822-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.4-rc4-tag

xen: branch for v6.4-rc4

It contains 3 fixes:

- a double free fix in the Xen pvcalls backend driver

- a fix for a regression causing the MSI related sysfs entries to not
  being created in Xen PV guests

- a fix in the Xen blkfront driver for handling insane input data better

Thanks.

Juergen

 arch/x86/pci/xen.c           | 8 +++++---
 drivers/block/xen-blkfront.c | 3 ++-
 drivers/xen/pvcalls-back.c   | 9 ++++-----
 include/linux/msi.h          | 9 ++++++++-
 kernel/irq/msi.c             | 4 ++--
 5 files changed, 21 insertions(+), 12 deletions(-)

Dan Carpenter (1):
      xen/pvcalls-back: fix double frees with pvcalls_new_active_socket()

Maximilian Heyne (1):
      x86/pci/xen: populate MSI sysfs entries

Ross Lagerwall (1):
      xen/blkfront: Only check REQ_FUA for writes

