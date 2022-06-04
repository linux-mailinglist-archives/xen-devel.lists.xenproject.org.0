Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E9753D5B0
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 07:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341773.567001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxMlh-0006oA-Kn; Sat, 04 Jun 2022 05:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341773.567001; Sat, 04 Jun 2022 05:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxMlh-0006lq-Gr; Sat, 04 Jun 2022 05:56:13 +0000
Received: by outflank-mailman (input) for mailman id 341773;
 Sat, 04 Jun 2022 05:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mc85=WL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nxMlf-0006lk-Ml
 for xen-devel@lists.xenproject.org; Sat, 04 Jun 2022 05:56:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081f2ab6-e3cb-11ec-bd2c-47488cf2e6aa;
 Sat, 04 Jun 2022 07:56:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 307C61F8DE;
 Sat,  4 Jun 2022 05:56:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0790813A5F;
 Sat,  4 Jun 2022 05:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 035nAPnzmmKgLwAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 04 Jun 2022 05:56:09 +0000
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
X-Inumbo-ID: 081f2ab6-e3cb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654322169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vspAA2gcSD1QkHhRhCOdcZ08ie07v+Yx0GVIhaTtDrI=;
	b=JWiouut0d2cp7hKK+zKFICpWUjpYRhU6Qx3HWCZb43yVunl4EfZZAHMW93i6Jeld75JC2F
	tDt1p7M6eQKEb7BJdquXb5ebIBSrtSBj6jzTnT9GvSr+OCIMbY5hsgcfkx1g4pe/IMKgH9
	t8oHvYA39STnitYCOzrj+QL6mLfzwtE=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v5.19-rc1b
Date: Sat,  4 Jun 2022 07:56:08 +0200
Message-Id: <20220604055608.9037-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19-rc1b-tag

xen: 2nd batch for v5.19-rc1

It contains 2 cleanup patches for Xen related code and (more important)
an update of MAINTAINERS for Xen, as Boris Ostrovsky decided to step
down.

Thanks.

Juergen

 MAINTAINERS                         | 18 ++++++++++++------
 arch/x86/include/asm/xen/page.h     |  3 ---
 drivers/block/xen-blkfront.c        |  6 +++---
 drivers/input/misc/xen-kbdfront.c   |  4 ++--
 drivers/net/xen-netfront.c          |  7 +++----
 drivers/tty/hvc/hvc_xen.c           |  2 +-
 drivers/xen/gntalloc.c              |  9 +++------
 drivers/xen/gntdev-dmabuf.c         |  2 +-
 drivers/xen/grant-table.c           | 14 +++++++-------
 drivers/xen/pvcalls-front.c         |  6 +++---
 drivers/xen/xen-front-pgdir-shbuf.c |  2 +-
 drivers/xen/xenbus/xenbus_client.c  |  2 +-
 drivers/xen/xenbus/xenbus_probe.c   |  8 ++++----
 include/xen/arm/page.h              |  3 ---
 include/xen/grant_table.h           |  6 +++---
 net/9p/trans_xen.c                  |  8 ++++----
 16 files changed, 48 insertions(+), 52 deletions(-)

Boris Ostrovsky (1):
      MAINTAINERS: Update Xen maintainership

Juergen Gross (2):
      xen: switch gnttab_end_foreign_access() to take a struct page pointer
      xen: replace xen_remap() with memremap()

