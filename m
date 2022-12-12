Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDA6498F1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 07:25:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459071.716741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4cEt-00050i-59; Mon, 12 Dec 2022 06:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459071.716741; Mon, 12 Dec 2022 06:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4cEt-0004yI-1u; Mon, 12 Dec 2022 06:24:35 +0000
Received: by outflank-mailman (input) for mailman id 459071;
 Mon, 12 Dec 2022 06:24:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/A98=4K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p4cEr-0004yC-83
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 06:24:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a33bc605-79e5-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 07:24:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D084333895;
 Mon, 12 Dec 2022 06:24:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8DED13456;
 Mon, 12 Dec 2022 06:24:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jEviJx7JlmNdVwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Dec 2022 06:24:30 +0000
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
X-Inumbo-ID: a33bc605-79e5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670826270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PDleQvRrvX4MednzmZMOBosn/u+w5VLSU4we6Gr6Rpg=;
	b=JeOvlfdVQ0v0I9dzki2wi4tBTPrtVnpfK7fhFEf5ZClAg8Gc2aRgtHIna2pcEnPFObuod7
	R86VxHPkycHHJpEM324Vo3EnvroKux4P7x7kgFVis2Rbi0fa3RHfAxX4DXFokOp8EJs7DK
	W2dmF+T2I3R0t2KMkA00IxcaVxp+Fcw=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org
Subject: [GIT PULL] xen: branch for v6.2-rc1
Date: Mon, 12 Dec 2022 07:24:30 +0100
Message-Id: <20221212062430.10263-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.2-rc1-tag

xen: branch for v6.2-rc1

It contains:

- 2 small minor fixes
- a small series fixing memory leaks in error paths
- a small series adding support for virtio PCI-devices in Xen guests on
  Arm


Thanks.

Juergen

 arch/arm/xen/enlighten.c    |   2 +-
 arch/x86/xen/smp.c          |  24 +++++-----
 arch/x86/xen/smp_pv.c       |  12 ++---
 arch/x86/xen/spinlock.c     |   6 +--
 drivers/xen/grant-dma-ops.c | 105 ++++++++++++++++++++++++--------------------
 drivers/xen/privcmd.c       |   2 +-
 include/xen/arm/xen-ops.h   |   4 +-
 include/xen/xen-ops.h       |  16 -------
 include/xen/xen.h           |   4 +-
 9 files changed, 84 insertions(+), 91 deletions(-)

Harshit Mogalapalli (1):
      xen/privcmd: Fix a possible warning in privcmd_ioctl_mmap_resource()

Jani Nikula (1):
      xen: fix xen.h build for CONFIG_XEN_PVH=y

Oleksandr Tyshchenko (2):
      xen/virtio: Optimize the setup of "xen-grant-dma" devices
      xen/virtio: Handle PCI devices which Host controller is described in DT

Xiu Jianfeng (2):
      x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
      x86/xen: Fix memory leak in xen_init_lock_cpu()

