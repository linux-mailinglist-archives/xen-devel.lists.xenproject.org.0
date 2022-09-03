Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212A5ABF6E
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 16:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398153.638934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUUXb-0000JR-7c; Sat, 03 Sep 2022 14:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398153.638934; Sat, 03 Sep 2022 14:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUUXb-0000GQ-41; Sat, 03 Sep 2022 14:54:35 +0000
Received: by outflank-mailman (input) for mailman id 398153;
 Sat, 03 Sep 2022 14:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDJJ=ZG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oUUXZ-0000GK-RW
 for xen-devel@lists.xenproject.org; Sat, 03 Sep 2022 14:54:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ff4c98d-2b98-11ed-82f2-63bd783d45fa;
 Sat, 03 Sep 2022 16:54:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7B3D34C2C;
 Sat,  3 Sep 2022 14:54:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 84A8013517;
 Sat,  3 Sep 2022 14:54:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NmM2H6RqE2PWVQAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 03 Sep 2022 14:54:28 +0000
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
X-Inumbo-ID: 4ff4c98d-2b98-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662216868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CJfyMJFEqY/Rw/Ebm+V1xYgPDk5ZiuDtFBgSCD431IE=;
	b=KHwL4zNuFAmaKbIR2Y5apZfyfeGzXIFIjyttYMjgv7LGAAMidfWFffpPRNbXE4prRuyKR4
	0fbhNVRfPd10vBHYeCCHkoF0iWRFE05iUzYB4Q/GE/LevHeQbZJjEX7d4gklgJLSBs4eDL
	XaFZLosKG96wZMvDzqHfJIoxfM/OEFg=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.0-rc4
Date: Sat,  3 Sep 2022 16:54:28 +0200
Message-Id: <20220903145428.29553-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc4-tag

xen: branch for v6.0-rc4

It contains:

- a minor fix for the Xen grant driver

- a small series fixing a recently introduced problem in the Xen
  blkfront/blkback drivers with negotiation of feature usage


Thanks.

Juergen

 drivers/block/xen-blkback/common.h |  3 +++
 drivers/block/xen-blkback/xenbus.c |  6 ++++--
 drivers/block/xen-blkfront.c       | 20 ++++++++++++--------
 drivers/xen/grant-table.c          |  3 +++
 4 files changed, 22 insertions(+), 10 deletions(-)

Dan Carpenter (1):
      xen/grants: prevent integer overflow in gnttab_dma_alloc_pages()

SeongJae Park (3):
      xen-blkback: Advertise feature-persistent as user requested
      xen-blkfront: Advertise feature-persistent as user requested
      xen-blkfront: Cache feature_persistent value before advertisement

