Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33A665B52
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 13:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475277.736900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFaAD-0008Gx-5U; Wed, 11 Jan 2023 12:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475277.736900; Wed, 11 Jan 2023 12:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFaAD-0008E1-2f; Wed, 11 Jan 2023 12:25:05 +0000
Received: by outflank-mailman (input) for mailman id 475277;
 Wed, 11 Jan 2023 12:25:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvS=5I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pFaAC-0008Dv-4c
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 12:25:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e66b5f-91aa-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 13:25:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0523A177FF;
 Wed, 11 Jan 2023 12:25:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D519413591;
 Wed, 11 Jan 2023 12:25:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xE+2Mp2qvmMUSAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 11 Jan 2023 12:25:01 +0000
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
X-Inumbo-ID: f8e66b5f-91aa-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673439902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vZMspio6CqflV2FoZGlGgB3ql5H0jWaCysfX0yUnYDQ=;
	b=i1j/ru4dgYR90bYOPjq+JSLrzSFu3i9s/RaWWGUijp2M6fS3/bNXgZgzTq+7/Wkoxb+Vco
	YrOwY5iy3Qm217kyCcQYgZQdqOPNNKWA09rKXzprgg7CG/OpT7LMAK+Y7t62I9v+Y5dJbC
	qnsseM3aCsLj/JhMkaXRg2Vdz86A4+o=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.2-rc4
Date: Wed, 11 Jan 2023 13:25:01 +0100
Message-Id: <20230111122501.21815-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.2-rc4-tag

xen: branch for v6.2-rc4

It contains:
- 2 cleanup patches
- a fix of a memory leak in the Xen pvfront driver
- a fix of a locking issue in the Xen hypervisor console driver

Thanks.

Juergen

 arch/x86/xen/p2m.c                  |  5 ----
 drivers/block/xen-blkback/xenbus.c  |  4 +--
 drivers/block/xen-blkfront.c        |  3 +--
 drivers/char/tpm/xen-tpmfront.c     |  3 +--
 drivers/gpu/drm/xen/xen_drm_front.c |  3 +--
 drivers/input/misc/xen-kbdfront.c   |  5 ++--
 drivers/net/xen-netback/xenbus.c    |  3 +--
 drivers/net/xen-netfront.c          |  4 +--
 drivers/pci/xen-pcifront.c          |  4 +--
 drivers/scsi/xen-scsifront.c        |  4 +--
 drivers/tty/hvc/hvc_xen.c           | 50 +++++++++++++++++++++++--------------
 drivers/usb/host/xen-hcd.c          |  4 +--
 drivers/video/fbdev/xen-fbfront.c   |  6 ++---
 drivers/xen/pvcalls-back.c          |  3 +--
 drivers/xen/pvcalls-front.c         |  7 +++---
 drivers/xen/xen-pciback/xenbus.c    |  4 +--
 drivers/xen/xen-scsiback.c          |  4 +--
 include/xen/xenbus.h                |  2 +-
 net/9p/trans_xen.c                  |  3 +--
 sound/xen/xen_snd_front.c           |  3 +--
 20 files changed, 54 insertions(+), 70 deletions(-)

Dawei Li (1):
      xen: make remove callback of xen driver void returned

Jiapeng Chong (1):
      x86/xen: Remove the unused function p2m_index()

Oleksii Moisieiev (1):
      xen/pvcalls: free active map buffer on pvcalls_front_free_map

Roger Pau Monne (1):
      hvc/xen: lock console list traversal

