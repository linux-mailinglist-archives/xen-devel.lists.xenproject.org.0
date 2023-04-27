Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B26F01F3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 09:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526891.818944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prwCk-00029P-RQ; Thu, 27 Apr 2023 07:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526891.818944; Thu, 27 Apr 2023 07:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prwCk-000277-OU; Thu, 27 Apr 2023 07:38:14 +0000
Received: by outflank-mailman (input) for mailman id 526891;
 Thu, 27 Apr 2023 07:38:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E+9W=AS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1prwCi-00026y-U1
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 07:38:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75273c14-e4ce-11ed-8611-37d641c3527e;
 Thu, 27 Apr 2023 09:38:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87AF6210EB;
 Thu, 27 Apr 2023 07:38:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F75C13910;
 Thu, 27 Apr 2023 07:38:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ChnZFWEmSmS1LgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 27 Apr 2023 07:38:09 +0000
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
X-Inumbo-ID: 75273c14-e4ce-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682581089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nr7EqN4AM70YmyuoNpfe+PXcas5rhy8+HTE3yW76PeE=;
	b=tcZ3SDL3frCSTs9kfNRn1gulCF03JIxBOSfdNvNV9pmuqasP8RcnwLNU4Ie+SqChQjpt7/
	1Z+9CNH5MFYuoHvtQlPqBtJX+0qA5UWFIZra1y5H4dRnltRWbQI1r6acOVSrfMlYWFg5Oc
	4Cs97+s6ZUGnpWyGL058ZE+gnbn8Atc=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.4-rc1
Date: Thu, 27 Apr 2023 09:38:08 +0200
Message-Id: <20230427073808.12580-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.4-rc1-tag

xen: branch for v6.4-rc1

It contains the following changes:

- a 4 patch series doing some cleanups in the Xen blkback driver
- 3 patches fixing potential sleeps under lock in various Xen drivers 

Thanks.

Juergen

 drivers/block/xen-blkback/blkback.c | 126 ++++++++++++++++++++++++++++++++----
 drivers/block/xen-blkback/common.h  | 103 +----------------------------
 drivers/xen/pvcalls-front.c         |  46 +++++++------
 drivers/xen/xen-pciback/pci_stub.c  |   6 +-
 drivers/xen/xen-scsiback.c          |  27 ++++----
 5 files changed, 160 insertions(+), 148 deletions(-)

Juergen Gross (8):
      xen/pciback: don't call pcistub_device_put() under lock
      xen/scsiback: don't call scsiback_free_translation_entry() under lock
      xen/pvcalls: don't call bind_evtchn_to_irqhandler() under lock
      xen/blkback: fix white space code style issues
      xen/blkback: remove stale prototype
      xen/blkback: simplify free_persistent_gnts() interface
      xen/blkback: move blkif_get_x86_*_req() into blkback.c

