Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690E559E2B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355637.583510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqN-0005iF-9u; Fri, 24 Jun 2022 16:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355637.583510; Fri, 24 Jun 2022 16:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqN-0005eq-6P; Fri, 24 Jun 2022 16:07:39 +0000
Received: by outflank-mailman (input) for mailman id 355637;
 Fri, 24 Jun 2022 16:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4lqM-0005eU-GT
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:07:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3d1d118-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:07:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7BB41F8BF;
 Fri, 24 Jun 2022 16:07:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9145D13480;
 Fri, 24 Jun 2022 16:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A5s3IUjhtWJDTQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 24 Jun 2022 16:07:36 +0000
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
X-Inumbo-ID: c3d1d118-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656086856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8wsGpUN1UHHjvwIixiG/ch3Vuvqb7p7EhnrZz6CUSYE=;
	b=QrRyewZrCg6LT4hn5tCGnl9MAX7vPMxkYVG+zpI1aTS5sbpOUnliLWiA2UdkNiE71nQh3F
	alPLupPQSY/RdqfutXxd7gJ5yMtMyaNlTv7kJp4esqU1y0OimrKaT8lPfHaa4IG/0pOaVk
	QGu25m49rZ6c+Tsp/hxfqdJkFraXFVE=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v5.19-rc4
Date: Fri, 24 Jun 2022 18:07:36 +0200
Message-Id: <20220624160736.14606-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc4-tag

xen: branch for v5.19-rc4

It contains the following fixes:

- A rare deadlock in Qubes-OS between the i915 driver and Xen grant
  unmapping, solved by making the unmapping fully asynchronous
- A bug in the Xen blkfront driver caused by incomplete error handling
- A fix for undefined behavior (shifting a signed int by 31 bits)
- A fix in the Xen drmfront driver avoiding a WARN()

Thanks.

Juergen

 drivers/block/xen-blkfront.c            |  19 ++--
 drivers/gpu/drm/xen/xen_drm_front_gem.c |   2 +-
 drivers/xen/features.c                  |   2 +-
 drivers/xen/gntdev-common.h             |   7 ++
 drivers/xen/gntdev.c                    | 157 +++++++++++++++++++++-----------
 5 files changed, 127 insertions(+), 60 deletions(-)

Demi Marie Obenour (1):
      xen/gntdev: Avoid blocking in unmap_grant_pages()

Jason Andryuk (1):
      xen-blkfront: Handle NULL gendisk

Julien Grall (1):
      x86/xen: Remove undefined behavior in setup_features()

Oleksandr Tyshchenko (1):
      drm/xen: Add missing VM_DONTEXPAND flag in mmap callback

